-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CLIENT_LIST
   --
   -- To store a list of clients class like : {FOO, BAR}
   --

inherit
   VISITABLE
      redefine is_equal
      end

insert
   GLOBALS
      redefine is_equal
      end

creation {ANY}
   make, merge, omitted

feature {ANY}
   start_position: POSITION
         -- Of the the opening bracket when list is really written.

   is_omitted: BOOLEAN is
      do
         Result := start_position.is_unknown
      end

   pretty (indent_level: INTEGER) is
      do
         if is_omitted then
            if pretty_printer.zen_mode then
               -- No print.
            else
               pretty_printer.put_string(once "{ANY}")
            end
         elseif class_name_list = Void then
            pretty_printer.put_string(once "{}")
         else
            pretty_printer.put_character('{')
            class_name_list.pretty(indent_level)
            pretty_printer.put_character('}')
         end
      end

   gives_permission_to (cn: CLASS_NAME): BOOLEAN is
         -- Check whether the `cn' class is a member (or a subclass as well) of the `Current' client
         -- list. (No error report done here in `error_handler').
      require
         cn /= Void
         not_done_to_report_errors: error_handler.is_empty -- required by CLASS_NAME_LIST.gives_permission_to
      do
         if is_omitted then
            -- It is equivalent to {ANY}
            Result := True
         elseif cn.to_string = as_typed_internals then
            Result := True
         elseif cn.to_string = as_native_array_internals then
            Result := True
         elseif class_name_list = Void then
            check
               not start_position.is_unknown
               not Result
            end
         else
            Result := class_name_list.gives_permission_to(cn)
         end
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

   gives_permission_to_any: BOOLEAN is
         -- Check whether the `Current' client list gives permission to all
         -- classes. (No error report done here in `error_handler').
      do
         if is_omitted then
            Result := True -- Because it is as : {ANY}.
         elseif class_name_list = Void then
            check
               not start_position.is_unknown
               not Result
            end
         else
            Result := class_name_list.gives_permission_to_any
         end
      ensure
         (old (error_handler.is_empty)) implies error_handler.is_empty
      end

   gives_no_permission: BOOLEAN is
         -- Check whether the `Current' client list gives no permission at all
         -- (No error report done here in `error_handler').
      do
         if is_omitted then
            check
               not Result
            end
         else
            Result := class_name_list = Void
         end
      ensure
         (old (error_handler.is_empty)) implies error_handler.is_empty
      end

   is_equal (other: like Current): BOOLEAN is
      do
         Result := (other = Current or else
                    other.class_name_list = class_name_list or else
                    class_name_list /= Void and then
                    other.class_name_list /= Void and then
                    class_name_list.is_equal(other.class_name_list))
      ensure then
         Result = (wider_than(other) and other.wider_than(Current))
      end

   accept (visitor: CLIENT_LIST_VISITOR) is
      do
         visitor.visit_client_list(Current)
      end

feature {ANONYMOUS_FEATURE_MIXER, CLIENT_LIST_VISITOR}
   append_in (b: STRING) is
      do
         if is_omitted then
            b.append(once "{ANY}")
         else
            if class_name_list = Void then
               b.append(once "{}")
            else
               b.extend('{')
               class_name_list.append_in(b)
               b.extend('}')
               b.extend(' ')
            end
         end
      end

feature {ANY}
   eiffel_view: STRING is
         -- The Eiffel view of the allowed classe(s) list. (Because of clients list merging, the
         -- `Current' clients list may be located on many Eiffel source files. This function is also
         -- useful to remind default abbreviated notation as omitted list or empty list.)
      local
         i: INTEGER
      do
         if eiffel_view_memory = Void then
            if is_omitted then
               eiffel_view_memory := once "{ANY}"
            elseif class_name_list = Void then
               eiffel_view_memory := once "{}"
            else
               create eiffel_view_memory.make(64)
               eiffel_view_memory.extend('{')
               from
                  i := 1
               until
                  i > class_name_list.count
               loop
                  eiffel_view_memory.append(class_name_list.item(i).to_string)
                  i := i + 1
                  if i <= class_name_list.count then
                     eiffel_view_memory.extend(',')
                     eiffel_view_memory.extend(' ')
                  end
               end
               eiffel_view_memory.extend('}')
            end
         end
         Result := eiffel_view_memory
      ensure
         Result /= Void
      end

feature {CLASS_TEXT, CLIENT_LIST, FEATURE_CALL}
   locate_in_error_handler is
         -- Add one or more related positions in the `error_handler'.
      do
         if class_name_list = Void then
            error_handler.add_position(start_position)
         else
            class_name_list.locate_in_error_handler
         end
      end

feature {CLIENT_LIST, ANONYMOUS_FEATURE_MIXER}
   wider_than (other: like Current): BOOLEAN is
      do
         if Current = other then
            Result := True
         elseif gives_permission_to_any then
            Result := True
         elseif other = Void or else other.gives_permission_to_any then
            check
               not Result
            end
         elseif other.gives_no_permission then
            Result := True
         elseif gives_no_permission then
            check
               not Result
            end
         else
            Result := class_name_list.wider_than(other.class_name_list)
         end
      end

feature {EXPORT_LIST, ANONYMOUS_FEATURE_MIXER}
   merge_with (other: like Current): like Current is
         -- Is actually the union of `Current' and `other'.
      require
         other /= Void
      local
         sp: POSITION
      do
         if Current = other then
            Result := Current
         elseif gives_permission_to_any then
            Result := Current
         elseif other.gives_permission_to_any then
            Result := other
         elseif gives_no_permission then
            Result := other
         elseif other.gives_no_permission then
            Result := Current
         else
            -- We really have to create a new one:
            sp := start_position
            if sp.is_unknown then
               sp := other.start_position
            end
            create Result.merge(sp, class_name_list, other.class_name_list)
         end
      end

feature {CLIENT_LIST, CLIENT_LIST_VISITOR}
   class_name_list: CLASS_NAME_LIST

feature {}
   make (sp: like start_position; cnl: like class_name_list) is
         -- When the client list is really written.
      require
         not sp.is_unknown
      do
         start_position := sp
         class_name_list := cnl
         debug
            if eiffel_view /= Void then
            end
         end
      ensure
         start_position = sp
         class_name_list = cnl
      end

   omitted is
         -- When the client list is omitted. (Remind that when the client list is omitted, it is like
         -- {ANY}.)
      do
      end

   merge (sp: like start_position; cnl1, cnl2: like class_name_list) is
      require
         not sp.is_unknown
      do
         start_position := sp
         create class_name_list.merge(cnl1, cnl2)
         debug
            eiffel_view_memory := Void
            if eiffel_view /= Void then
            end
         end
      end

   eiffel_view_memory: STRING
         -- To cache the Result of `eiffel_view'.

invariant
   class_name_list /= Void implies class_name_list.count > 0

end -- class CLIENT_LIST
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights blow)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
