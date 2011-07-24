-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EXPORT_LIST

inherit
   VISITABLE
   
insert
   GLOBALS

creation {ANY}
   make

feature {ANY}
   start_position: POSITION
         -- Of keyword "export".

   clients_for (fn: FEATURE_NAME): CLIENT_LIST is
      do
         Result := permissions.reference_at(fn)
      end

   pretty is
      local
         i, rank: INTEGER
      do
         pretty_printer.set_indent_level(2)
         pretty_printer.keyword(once "export")
         from
            i := items.lower
         until
            i > items.upper
         loop
            rank := rank + 1
            items.item(i).pretty(rank)
            i := i + 1
            if i <= items.upper then
               pretty_printer.put_character(';')
            end
         end
         pretty_printer.set_indent_level(0)
      end

   for_all: CLIENT_LIST

   accept (visitor: EXPORT_LIST_VISITOR) is
      do
         visitor.visit_export_list(Current)
      end

feature {EXPORT_LIST_VISITOR}
   items: ARRAY[EXPORT_ITEM]

   permissions: DICTIONARY[CLIENT_LIST, FEATURE_NAME]

feature {PARENT_EDGE}
   check_level_2 (parent_edge: PARENT_EDGE; parent_type: TYPE) is
         -- Called once for each loaded class.
      require
         parent_edge /= Void
         parent_type /= Void
      local
         parent_class_text: CLASS_TEXT
         list: FEATURE_NAME_LIST; items_idx, list_idx: INTEGER; fn: FEATURE_NAME
      do
         parent_class_text := parent_edge.class_text
         from
            items_idx := items.upper
         until
            items_idx < items.lower
         loop
            list := items.item(items_idx).list
            if list /= Void then
               from
                  list_idx := list.count
               until
                  list_idx = 0
               loop
                  fn := list.item(list_idx)
                  if (not parent_edge.is_target_of_rename(fn)) and then
                     not parent_type.valid_feature_name(fn)
                   then
                     error_handler.add_position(fn.start_position)
                     error_handler.append("Cannot change exportation status of ")
                     error_handler.add_feature_name(fn)
                     error_handler.append(" because type ")
                     error_handler.append(parent_type.name.to_string)
                     error_handler.append(" does not have feature ")
                     error_handler.add_feature_name(fn)
                     error_handler.append(".")
                     error_handler.print_as_warning
                  end
                  list_idx := list_idx - 1
               end
            end
            items_idx := items_idx - 1
         end
      end
   
feature {}
   make (sp: like start_position; it: like items) is
      require
         not sp.is_unknown
         it.lower = 1
         not it.is_empty
      local
         i, j: INTEGER; ei: EXPORT_ITEM; list: FEATURE_NAME_LIST; cl: CLIENT_LIST; fn: FEATURE_NAME
      do
         start_position := sp
         items := it
         create {HASHED_DICTIONARY[CLIENT_LIST, FEATURE_NAME]} permissions.with_capacity(10)
         from
            i := items.upper
         until
            i < items.lower
         loop
            ei := items.item(i)
            if ei.for_all then
               if for_all = Void then
                  for_all := ei.clients
               else
                  error_handler.add_position(for_all.start_position)
                  error_handler.add_position(ei.clients.start_position)
                  error_handler.append("There should be at most one export clause with the %"all%" %
                                       %keyword in each parent clause. The client lists will be %
                                       %merged, but please fix the export clauses.")
                  error_handler.print_as_warning
                  for_all := for_all.merge_with(ei.clients)
               end
            else
               list := ei.list
               from
                  j := list.count
               until
                  j < 1
               loop
                  fn := list.item(j)
                  cl := permissions.reference_at(fn)
                  if cl = Void then
                     permissions.add(ei.clients, fn)
                  else
                     error_handler.add_position(permissions.internal_key(fn).start_position)
                     error_handler.add_position(fn.start_position)
                     error_handler.append("Any given feature name should appear at most once in one %
                                          %export clause for each parent clause. Feature ")
                     error_handler.add_feature_name(fn)
                     error_handler.append(" appears at least twice. The client lists will be merged, %
                                          %but please fix the export clauses.")
                     error_handler.print_as_warning
                     permissions.put(cl.merge_with(ei.clients), fn)
                  end
                  j := j - 1
               end
            end
            i := i - 1
         end
      ensure
         start_position = sp
         items = it
      end

invariant
   items.lower = 1

   not items.is_empty

end -- class EXPORT_LIST
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------