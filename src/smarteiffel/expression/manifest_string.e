-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MANIFEST_STRING
   --
   -- Any kind of manifest strings: classic STRING as well as UNICODE_STRING
   -- writtent using the classic way as well as multi-line verbatim
   -- manifest strings. Also note that the onceness status of the
   -- corresponding manifest string is also part of the MANIFEST_STRING
   -- object knowledge.
   --

inherit
   MANIFEST_EXPRESSION
      redefine is_equal
      end
   HASHABLE

creation {PARSER}
   make

creation {TOKEN_BUFFER, INTROSPECTION_HANDLER}
   from_identifier

feature {ANY}
   is_manifest_string, extra_bracket_flag: BOOLEAN is True

   is_manifest_array, is_void: BOOLEAN is False

   start_position: POSITION
         -- Of the first opening '%"' character or of the "once"  keyword
         -- if any.

   once_flag: BOOLEAN
         -- Is it a once manifest string?

   unicode_flag: BOOLEAN
         -- Is it a unicode manifest string?

   to_string: STRING
         -- The content of the Eiffel string from the programmer's point of
         -- view (i.e. what is inside the manifest string at run time).
         -- (See also `source_view'.)

   unicode_string: UNICODE_STRING
         -- Computed using the `to_string' parsed information in the case of an U"foo" notation.

   is_static: BOOLEAN is
      do
         Result := once_flag
      end

   is_equal (other: like Current): BOOLEAN is
      do
         if other = Current then
            Result := True
         elseif unicode_flag then
            if other.unicode_flag then
               Result := to_string.is_equal(other.to_string)
            end
         elseif other.unicode_flag then
         else
            Result := to_string.is_equal(other.to_string)
         end
      end

   hash_code: INTEGER is
      do
         if hash_code_memory = 0 then
            hash_code_memory := to_string.hash_code
         end
         Result := hash_code_memory
      end

   resolve_in (type: TYPE): TYPE is
      do
         Result := declaration_type
      end

   declaration_type: TYPE is
      do
         if unicode_flag then
            Result := smart_eiffel.type_unicode_string
         else
            Result := smart_eiffel.type_string
         end
      end

   compile_to_c (type: TYPE) is
      do
         if once_flag then
            cpp.pending_c_function_body.append(once_variable)
         elseif unicode_flag then
            manifest_string_pool.se_ums_c_call_in(cpp.pending_c_function_body, Current)
         else
            manifest_string_pool.se_ms_c_call_in(cpp.pending_c_function_body, Current)
         end
      end

   mapping_c_target (type, target_formal_type: TYPE) is
      do
         cpp.pending_c_function_body.append(once "((")
         target_formal_type.canonical_type_mark.c_type_for_target_in(cpp.pending_c_function_body)
         cpp.pending_c_function_body.extend(')')
         compile_to_c(type)
         cpp.pending_c_function_body.extend(')')
      end

   mapping_c_arg (type: TYPE) is
      do
         compile_to_c(type)
      end

   safety_check (type: TYPE) is
      do
      end

   count: INTEGER is
      do
         Result := to_string.count
      end

   compile_target_to_jvm, compile_to_jvm (type: TYPE) is
      local
         idx: INTEGER
      do
         if once_flag then
            idx := fieldref_idx
            code_attribute.opcode_getstatic(idx, 1)
         else
            code_attribute.opcode_push_manifest_string(to_string)
         end
      end

   jvm_branch_if_true, jvm_branch_if_false (type: TYPE): INTEGER is
      do
         check
            False
         end
      end

   jvm_assign_creation, jvm_assign (type: TYPE) is
      do
         check
            False
         end
      end

   specialize_in (type: TYPE): like Current is
      do
         Result := Current
      end

   specialize_thru (parent_type: TYPE; parent_edge: PARENT_EDGE; new_type: TYPE): like Current is
      do
         Result := Current
      end

   specialize_2 (type: TYPE): like Current is
      local
         utf8_parser: UTF8_PARSER
      do
         if unicode_flag and then unicode_string = Void then
            create unicode_string.make(to_string.count * 2)
            utf8_parser.decode(to_string, unicode_string)
            if utf8_parser.first_error /= Void then
               error_handler.append("Invalid unicode string at index ")
               error_handler.add_position(start_position)
               error_handler.append_integer(utf8_parser.first_error_index)
               error_handler.append(" of this Unicode manifest string. ")
               error_handler.append(utf8_parser.first_error)
               error_handler.print_as_error
            end
         end
         Result := Current
      end

   has_been_specialized: BOOLEAN is True

   collect (t: TYPE): TYPE is
      do
         if unicode_flag then
            Result := smart_eiffel.type_unicode_string
         else
            Result := smart_eiffel.type_string
         end
         once_variable := manifest_string_pool.collect(Current, once_flag, unicode_flag, Result)
      end

   side_effect_free (type: TYPE): BOOLEAN is
      do
         Result := once_flag -- (No memory allocation.)
      end

   adapt_for (t: TYPE): like Current is
      do
         Result := Current
      end

   non_void_no_dispatch_type (type: TYPE): TYPE is
      do
         Result := resolve_in(type)
      end

   simplify (type: TYPE): MANIFEST_STRING is
      do
         Result := Current
      end

   precedence: INTEGER is
      do
         Result := atomic_precedence
      end

   bracketed_pretty, pretty (indent_level: INTEGER) is
      do
         if once_flag then
            pretty_printer.keyword(once "once")
         end
         if unicode_flag then
            pretty_printer.put_character('U')
         end
         if source_view = Void then
            -- (Code of `pretty' is also used to print error messages.)
            check
               not smart_eiffel.short_or_class_check_flag
               not smart_eiffel.pretty_flag
            end
            pretty_printer.put_character('%"')
            pretty_printer.put_string(to_string)
            pretty_printer.put_character('%"')
         else
            pretty_printer.put_string(source_view)
         end
      end

   pretty_target (indent_level: INTEGER) is
      do
         pretty_printer.put_character('(')
         pretty(indent_level)
         pretty_printer.put_character(')')
         pretty_printer.put_character('.')
      end

   short (type: TYPE) is
      local
         i: INTEGER
      do
         if once_flag then
            short_printer.hook_or(fz_once, once "once ")
         end
         short_printer.hook_or("open_ms", "%"")
         from
            i := source_view.lower + 1
         until
            i = source_view.upper
         loop
            short_printer.put_character(source_view.item(i))
            i := i + 1
         end
         short_printer.hook_or("close_ms", "%"")
      end

   short_target (type: TYPE) is
      do
         bracketed_short(type)
         short_printer.put_dot
      end

   accept (visitor: MANIFEST_STRING_VISITOR) is
      do
         visitor.visit_manifest_string(Current)
      end

feature {CODE, EFFECTIVE_ARG_LIST}
   inline_dynamic_dispatch_ (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
      do
         code_accumulator.add_sedb(start_position, 'S')
         code_accumulator.current_context.add_last(Current)
      end

feature {CST_ATT_STRING, E_ROUTINE, WRITABLE_ATTRIBUTE}
   pretty_without_once (indent_level: INTEGER) is
      local
         once_flag_memory: BOOLEAN
      do
         once_flag_memory := once_flag
         once_flag := False
         pretty(indent_level)
         once_flag := once_flag_memory
      end

feature {EIFFEL_PARSER, WHEN_ITEM_1, CLASS_CHECKER}
   set_once_flag (flag: BOOLEAN) is
      do
         once_flag := flag
      ensure
         once_flag = flag
      end

feature {MANIFEST_STRING}
   set_alias_link (al: like alias_link) is
      require
         al /= Void
      do
         alias_link := al
      ensure
         alias_link = al
      end

feature {PARSER}
   set_source_view (sv: like source_view) is
      do
         check
            sv /= Void = (smart_eiffel.short_or_class_check_flag or smart_eiffel.pretty_flag)
         end
         source_view := sv
      ensure
         source_view = sv
      end

feature {MANIFEST_STRING, MANIFEST_STRING_POOL}
   alias_link: like Current
         -- May be non Void to indicate that `alias_link' has exactely the same initial storage information as
         -- `Current'. In this situation, both `Current' and `alias_link' have exactely the same `initial_storage_id'
         -- mangling.

   initial_storage_id: STRING
         -- Mangling value used to distinghish the initial storage information from all other possible MANIFEST_STRINGs.
         -- (Actually when some MANIFEST_STRING have the same initial storage information than another one, the storage
         -- itself is shared into a global variable. The corresponding global variable is used only and only if
         -- there is really an actual alias collected.)

feature {MANIFEST_STRING_POOL}
   once_variable: STRING
         -- Used when `once_flag' is True. This is the name used for the corresponding global variable in the generated code (C
         -- or in the bytecode as well).

   set_initial_storage_id (ag: like initial_storage_id) is
      require
         ag /= Void
      do
         initial_storage_id := ag
      ensure
         initial_storage_id = ag
      end

   storage_alias_of (other: like Current) is
      require
         other.initial_storage_id /= Void
      do
         alias_link := other
         initial_storage_id := other.initial_storage_id
         other.set_alias_link(Current)
      ensure
         alias_link = other
         other.alias_link = Current
         initial_storage_id = other.initial_storage_id
      end

   fieldref_idx: INTEGER is
      do
         Result := constant_pool.idx_fieldref_for_manifest_string(once_variable)
      end

feature {MINI_BUFFER, MANIFEST_STRING_VISITOR}
   source_view: STRING
         -- The manifest string as it appear in the Eiffel source file including opening and closing '%"' (see
         -- also `to_string'). This information is only computed for formatting tools (`pretty' or `short'
         -- for example).

feature {}
   hash_code_memory: INTEGER
         -- To cache `hash_code' value.

   make (sp: like start_position; of: like once_flag; uf: like unicode_flag; ts: like to_string) is
      require
         not sp.is_unknown
         ts /= Void
      do
         start_position := sp
         once_flag := of
         unicode_flag := uf
         to_string := ts.twin
      ensure
         start_position = sp
         once_flag = of
         unicode_flag = uf
         to_string /= ts and then to_string.is_equal(ts)
      end

   from_identifier (sp: like start_position; hs: HASHED_STRING) is
      require
         not sp.is_unknown
         hs /= Void
      do
         start_position := sp
         once_flag := False
         unicode_flag := False
         to_string := hs.to_string
      end

invariant
   not start_position.is_unknown

   to_string /= Void

end -- class MANIFEST_STRING
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