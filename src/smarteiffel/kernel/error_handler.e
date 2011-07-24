-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ERROR_HANDLER
   --
   -- The unique `error_handler' object for Warning, Error and Fatal Error
   -- handling.
   -- This handler uses an asynchronous strategy.
   --

insert
   GLOBALS
      undefine is_equal
      end
   SINGLETON

feature {ANY}
   error_counter, warning_counter: INTEGER
         -- Global counters.

   no_warning: BOOLEAN
         -- To avoid warning messages.

   is_empty: BOOLEAN is
         -- True when nothing stored in `explanation' and `positions'.
      do
         Result := explanation.is_empty and then positions.is_empty
      end

   set_no_warning is
      do
         no_warning := True
      end

   append (s: STRING) is
         -- Append text `s' to the current `explanation'.
      require
         not s.is_empty
      do
         explanation.append(s)
      ensure
         not is_empty
      end

   append_integer (i: INTEGER) is
         -- Append integer `i' to the current `explanation'.
      do
         i.append_in(explanation)
      ensure
         not is_empty
      end

   append_integer_64 (i: INTEGER_64) is
         -- Append integer `i' to the current `explanation'.
      do
         i.append_in(explanation)
      ensure
         not is_empty
      end

   extend (c: CHARACTER) is
         -- Append `c' to the current `explanation'.
      do
         explanation.extend(c)
      ensure
         not is_empty
      end

   add_position (p: POSITION) is
         -- If necessary, add `p' to the already known `positions'.
      do
         if p.is_unknown then
         else
            positions.add_last(p)
         end
      end

   add_type_mark (type_mark: TYPE_MARK) is
      require
         type_mark /= Void
      do
         type_mark.pretty_in(explanation)
      end

   add_type (type: TYPE) is
      require
         type /= Void
      do
         type.canonical_type_mark.pretty_in(explanation)
      end

   add_expression (expression: EXPRESSION) is
         -- Add a piece of `expression' in the message.
         -- Note: the `start_position' of `expression' is not automatically added by this call because it may be not 
         -- meaningful in some context (it is up to the caller to do it when useful).
      require
         expression /= Void
      do
         explanation.extend('`')
         pretty_printer.expression_in(explanation, expression)
         explanation.extend('%'')
      end

   add_instruction (instruction: INSTRUCTION) is
         -- Add a piece of `instruction' in the message.
         -- Note: the `start_position' of `instruction' is not automatically added by this call because it may be not 
         -- meaningful in some context (it is up to the caller to do it when useful).
      require
         instruction /= Void
      do
         explanation.extend('%N')
         pretty_printer.instruction_in(explanation, instruction)
         explanation.extend('%N')
      end

   add_feature_name (fn: FEATURE_NAME) is
         -- Useful to show `fn' which may be an infix or a prefix name as well as an ordinary feature name.
         -- Note: the `start_position' of `fn' is not automatically added by this call because it may be not 
         -- meaningful in some context (it is up to the caller to do it when useful).
      require
         fn /= Void
      do
         if fn.is_infix_name then
            append(once "infix %"")
            append(fn.to_string)
            extend('%"')
         elseif fn.is_prefix_name then
            append(once "prefix %"")
            append(fn.to_string)
            extend('%"')
         else
            extend('`')
            append(fn.to_string)
            extend('%'')
         end
      end

   add_context_info (ct: TYPE_MARK) is
      require
         ct.is_static
      do
         append(once " (The validation context is ")
         append(ct.written_mark)
         append(once " . The validation context is used to compute all anchored type marks.)")
      end

   print_as_warning is
         -- Print `explanation' as a Warning report.
         -- After printing, `explanation' and `positions' are reset.
      require
         not is_empty
      do
         if no_warning then
            cancel
         else
            do_print(once "Warning")
            sedb_breakpoint
         end
         warning_counter := warning_counter + 1
      ensure
         warning_counter = old warning_counter + 1
      end

   print_as_error is
         -- Print `explanation' as an Error report.
         -- After printing, `explanation' and `positions' are reset.
      require
         not is_empty
      do
         do_print(once "Error")
         sedb_breakpoint
         error_counter := error_counter + 1
         if error_counter >= 6 then
            echo.w_put_string(fz_error_stars)
            echo.w_put_string(once "Too many errors.%N")
            echo.before_exit_close
            die_with_code(exit_failure_code)
         end
      ensure
         error_counter = old error_counter + 1
      end

   print_as_fatal_error is
         -- Print `explanation' as a Fatal Error.
         -- Execution is stopped after this call.
      require
         not is_empty
      do
         do_print(once "Fatal Error")
         sedb_breakpoint
         if action /= Void then
            action.call([])
         else
            echo.before_exit_close
            die_with_code(exit_failure_code)
         end
      end

   print_as_internal_error is
         -- Print `explanation' as an Internal Error.
         -- Execution is crashed after this call.
      require
         not is_empty
      do
         do_print(once "Internal Error")
         sedb_breakpoint
         crash
      end

   cancel is
         -- Cancel a prepared report without printing it.
      do
         explanation.clear_count
         positions.clear_count
      ensure
         is_empty
      end

   cancel_positions is
         -- Cancel only the positions, keeping the Message.
      do
         positions.clear_count
      end

feature {ANY}
   when_fatal_error (a_action: like action) is
      do
         action := a_action
      end

feature {}
   action: PROCEDURE[TUPLE]

feature {}
   explanation: STRING is
         -- Current `explanation' text to be print with next Warning,
         -- the next Error or the next Fatal Error.
      once
         create Result.make(1024)
      end

   positions: FAST_ARRAY[POSITION] is
         -- The list of `positions' to be shown with next Warning,
         -- the next Error or the next Fatal Error.
      once
         create Result.with_capacity(16)
      end

   do_print (heading: STRING) is
      local
         i, cpt: INTEGER; cc: CHARACTER
      do
         echo.w_put_string(fz_error_stars)
         echo.w_put_string(heading)
         echo.w_put_character(':')
         echo.w_put_character(' ')
         --
         from
            i := explanation.lower
            cpt := 9 + heading.count
         until
            i > explanation.upper
         loop
            cc := explanation.item(i)
            i := i + 1
            if cpt > 60 then
               if cc = ' ' or else cc = '%N' then
                  echo.w_put_character('%N')
                  cpt := 0
               else
                  echo.w_put_character(cc)
                  cpt := cpt + 1
               end
            else
               echo.w_put_character(cc)
               inspect
                  cc
               when '%N' then
                  cpt := 0
               else
                  cpt := cpt + 1
               end
            end
         end
         echo.w_put_character('%N')
         echo.w_put_character('%N')
         if positions.count >= 2 then
            echo.w_put_string(once "The source lines involved by the message are the following:%N%N")
         end
         display_lines
         cancel
         echo.w_put_string(once "------%N")
      ensure
         is_empty
      end

   get_positions_on_same_line (p: FAST_ARRAY[POSITION]) is
         -- Find the suffix of `positions' such that all POSITIONS of
         -- the suffix are on the same line of the same source file.
         -- Remove this suffix from `positions' and put in into `p',
         -- reversed, discarding redundant positions.
      require
         not positions.is_empty
         p /= Void
         (create {REVERSE_COLLECTION_SORTER[POSITION]}).is_sorted(positions)
      local
         pos1, pos2: POSITION
         no_column_pos: POSITION
         stop: BOOLEAN
      do
         p.clear_count
         from
            pos1 := positions.last
            if pos1.column = 0 then
               no_column_pos := pos1
            else
               p.add_last(pos1)
            end
            positions.remove_last
            stop := positions.is_empty
         until
            stop
         loop
            pos2 := positions.last
            if pos2.same_line_as(pos1) then
               if pos2.column /= pos1.column then
                  p.add_last(pos2)
                  pos1 := pos2
               end
               positions.remove_last
               stop := positions.is_empty
            else
               stop := True
            end
         end
         if p.is_empty then
            check
               not no_column_pos.is_unknown
            end
            p.add_last(no_column_pos)
         end
      ensure
         (create {COLLECTION_SORTER[POSITION]}).is_sorted(p)
         p.first.line = p.last.line -- i.e. all positions of p are on the same line
      end

   print_error_header (cn: CLASS_NAME; file_path: STRING; line_number: INTEGER; pos: FAST_ARRAY[POSITION]) is
         -- Print a line of the form "Line xx column(s) yy, zz in CLASS_NAME (some/file/path):%N"
      require
         pos.count > 0
         (create {COLLECTION_SORTER[POSITION]}).is_sorted(pos)
      local
         i, col: INTEGER
      do
         echo.w_put_string("Line ")
         echo.w_put_integer(line_number)
         if pos.count > 1 then
            echo.w_put_string(" columns ")
            from
               i := pos.lower
               echo.w_put_integer(pos.item(i).column)
               i := i + 1
            until
               i > pos.upper
            loop
               echo.w_put_string(", ")
               echo.w_put_integer(pos.item(i).column)
               i := i + 1
            end
         elseif pos.count = 1 then
            col := pos.first.column
            if col > 0 then
               echo.w_put_string(" column ")
               echo.w_put_integer(col)
            end
         end
         echo.w_put_string(" in ")
         if cn /= Void then
            echo.w_put_string(cn.to_string)
         end
         if file_path /= Void then
            echo.w_put_string(" (")
            echo.w_put_string(file_path)
            echo.w_put_character(')')
         end
         echo.w_put_string(":%N")
      end

   detab_line (line: STRING): INTEGER is
         -- Replace all leading tabs of `line' with spaces, and return the number of spaces that must 
         -- be prepended to `line' to compensate for this change.
      require
         line.count > 0
      local
         i: INTEGER
      do
         from
            i := line.lower
         until
            i > line.upper or else not line.item(i).is_separator
         loop
            if line.item(i) = '%T' then
               line.put(' ', i)
               Result := Result + 2 - ((i + Result - 1) \\ 3)
            end
            i := i + 1
         end
      ensure
         line.count = old (line.count)
      end

   put_arrows_into (line: STRING; p: FAST_ARRAY[POSITION]) is
         -- Replace the characters of `line' that are at column numbers from `p' by '^'. Replace 
         -- all remaining non-tab characters by spaces.
      require
         (create {COLLECTION_SORTER[POSITION]}).is_sorted(p)
         line.count >= p.last.column
         p.first.line = p.last.line -- I.e. all positions of p are on the same line
      local
         i: INTEGER
      do
         from
            i := line.upper - 1
         until
            i < line.lower
         loop
            if line.item(i) /= '%T' then
               line.put(' ', i)
            end
            i := i - 1
         end
         if p.first.column > 0 then
            from
               i := p.upper
            until
               i < p.lower
            loop
               line.put('^', p.item(i).column)
               i := i - 1
            end
         end
      ensure
         line.count = old (line.count)
      end

   print_spaces (number: INTEGER) is
         -- Print `number' spaces.
      require
         number >= 0
      local
         i: INTEGER
      do
         from
            i := number
         until
            i = 0
         loop
            echo.w_put_character(' ')
            i := i - 1
         end
      end

   display_lines is
         -- Sort `positions' and display them.
      local
         pos: POSITION; s: REVERSE_COLLECTION_SORTER[POSITION]; cn: CLASS_NAME; li, offset: INTEGER
         file_path, the_line: STRING; line_positions: FAST_ARRAY[POSITION]
      do
         s.sort(positions)
         from
            create line_positions.with_capacity(2)
         until
            positions.is_empty
         loop
            get_positions_on_same_line(line_positions)
            pos := line_positions.first
            file_path := pos.path
            cn := pos.class_text_name
            li := pos.line
            print_error_header(cn, file_path, li, line_positions)
            if file_path /= Void and then li > 0 then
               the_line := get_line(file_path, li)
               if the_line /= Void then
                  the_line.extend('%N')
                  offset := detab_line(the_line)
                  print_spaces(offset)
                  echo.w_put_string(the_line)
                  print_spaces(offset)
                  put_arrows_into(the_line, line_positions)
                  echo.w_put_string(the_line)
               end
            end
         end
      ensure
         positions.is_empty
      end

   get_line (file_path: STRING; li: INTEGER): STRING is
      require
         not file_path.is_empty
         li > 0
      local
         i: INTEGER
      do
         echo.tfr_connect(tmp_file_read, file_path)
         if tmp_file_read.is_connected then
            from
            until
               tmp_file_read.end_of_input or else i = li
            loop
               tmp_file_read.read_line
               i := i + 1
            end
            if not tmp_file_read.end_of_input then
               Result := tmp_file_read.last_string
            end
            tmp_file_read.disconnect
         end
      end

end -- class ERROR_HANDLER
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