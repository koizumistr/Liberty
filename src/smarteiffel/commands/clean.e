-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CLEAN
   --
   -- The `clean' command.
   --

inherit
   COMMAND_LINE_TOOLS

creation {}
   make

feature {ANY}
   command_line_name: STRING is "clean"

   command_line_help_summary: STRING is "[
      Usage: clean <Root-Name> ...

      Remove files generated by Liberty Eiffel tools.

      Option summary:

      Information:
        -help               Display this help information
        -no_remove          Print the name of files that would be removed,
                             but do not remove them.e
        -version            Display Liberty Eiffel version information
        -verbose            Display detailed information about what the program is
                             doing

      ]"

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN is
      do
         check
            False
         end
      end

   valid_argument_for_ace_mode: STRING is
      do
         check
            False
         end
      end

feature {}
   make is
      local
         i: INTEGER; arg, root: STRING
      do
         if argument_count < 1 then
            system_tools.bad_use_exit(command_line_name, command_line_help_summary)
         end
         search_for_verbose_flag

         -- First loop on all arguments in order to remove all flags from `command_arguments':
         from
            i := 1 -- To skip the command name.
         until
            i > command_arguments.upper
         loop
            arg := command_arguments.item(i)
            if is_some_flag(arg) then
               if is_verbose_flag(arg) then
                  command_arguments.remove(i)
               elseif is_help_flag(arg) then
                  command_arguments.remove(i)
               elseif is_version_flag(arg) then
                  command_arguments.remove(i)
               elseif flag_match(once "no_remove", arg) then
                  no_remove_flag := True
                  command_arguments.remove(i)
               else
                  unknown_flag_exit(arg)
               end
            else
               i := i + 1
            end
         end

         -- Second loop for remaining items of `command_arguments':
         from
            i := 1 -- To skip the command name.
         until
            i > command_arguments.upper
         loop
            arg := command_arguments.item(i)
            check
               not is_some_flag(arg) -- Removed in previous loop.
            end
            root := arg.twin
            remove_c2c_products(root)
            remove_java_products(root)
            if not root.as_lower.is_equal(root) then
               root.to_lower
               remove_c2c_products(root)
               remove_java_products(root)
            end
            i := i + 1
         end
      end

   no_remove_flag: BOOLEAN
         -- Memory of the "-no_remove" flag.


   remove_possible_suffix (name: STRING) is
      require
         name /= Void
      local
         i: INTEGER
      do
         i := name.reverse_index_of('.', name.count)
         if i > 0 then
            name.remove_tail(name.count - i + 1)
         end
      end

   remove_c2c_products (name: STRING) is
      local
         i: INTEGER; path: STRING
         bd: BASIC_DIRECTORY; ft: FILE_TOOLS
         no_split: C_SPLITTER_NO_SPLIT
         split_by_type: C_SPLITTER_BY_LIVE_TYPE
         split_legacy: C_SPLITTER_LEGACY
         should_clean: FAST_ARRAY[STRING]
      do
         remove_possible_suffix(name)
         if name.count > 0 then
            -- Remove C files and associated draft & object files:
            bd.connect_to_current_working_directory
            if not bd.is_connected then
               echo.w_put_string(once "Something weird happened: could not connect to the current working directory!")
               die_with_code(1)
            end
            create no_split.make
            create split_by_type.make
            create split_legacy.make
            from
               create should_clean.make(0)
               bd.read_entry
            until
               bd.end_of_input
            loop
               if no_split.should_clean(name, bd.last_entry)
                     or else split_by_type.should_clean(name, bd.last_entry)
                     or else split_legacy.should_clean(name, bd.last_entry) then
                  should_clean.add_last(bd.last_entry.twin)
               end
               bd.read_entry
            end
            bd.disconnect
            path := once "....... local private buffer ........."
            from
               i := should_clean.lower
            until
               i > should_clean.upper
            loop
               path.copy(should_clean.item(i))
               if ft.is_readable(path) then
                  remove_or_no_remove(path)
               end
               i := i + 1
            end
            --
            path.copy(name)
            path.append(once ".h")
            remove_or_no_remove(path)
            --
            path.copy(name)
            path.append(once ".c")
            remove_or_no_remove(path)
            --
            path.copy(name)
            path.append(once ".secd")
            remove_or_no_remove(path)
            --
            path.copy(name)
            path.append(once ".id")
            remove_or_no_remove(path)
            --
            path.copy(name)
            path.append(once ".make")
            remove_or_no_remove(path)
            --
            path.copy(name)
            path.append(once ".bat")
            remove_or_no_remove(path)
            --
            path.copy(name)
            path.append(once ".BAT")
            remove_or_no_remove(path)
            --
            path.copy(name)
            path.append(once ".com")
            remove_or_no_remove(path)
            --
            path.copy(name)
            path.append(once ".CMD")
            remove_or_no_remove(path)
            --
            path.copy(name)
            path.append(once ".scf")
            remove_or_no_remove(path)
            --
            path.copy(name)
            path.append(once "_external_cpp.h")
            remove_or_no_remove(path)
            --
            path.copy(name)
            path.append(once "_external_cpp.cpp")
            remove_or_no_remove(path)
            --
            path.copy(name)
            path.append(once "_external_cpp.o")
            remove_or_no_remove(path)
            --
            path.copy(name)
            path.append(once "_external_cpp.obj")
            remove_or_no_remove(path)
            --
            path.copy(name)
            path.append(once ".o")
            remove_or_no_remove(path)
            --
            path.copy(name)
            path.append(once ".obj")
            remove_or_no_remove(path)
            --
            path.copy(name)
            path.append(once ".sym")
            remove_or_no_remove(path)
            --
            path.copy(name)
            path.append(once ".SYM")
            remove_or_no_remove(path)
         end
      end

   remove_java_products (name: STRING) is
      local
         item_count, class_item_count: INTEGER; path, entry_name: STRING; basic_directory: BASIC_DIRECTORY
         do_not_remove_flag: BOOLEAN
      do
         path := once "....... local private buffer ........."
         entry_name := once "....... local private buffer ........."
         basic_directory.ensure_system_notation

         remove_possible_suffix(name)
         --
         path.copy(name)
         path.append(once ".jar")
         remove_or_no_remove(path)
         basic_directory.connect_to(name)
         if basic_directory.is_connected then
            -- First loop to check that this directory only contains *.class files:
            from
               basic_directory.read_entry
            until
               basic_directory.end_of_input
            loop
               entry_name.copy(basic_directory.last_entry)
               item_count := item_count + 1
               if is_special_entry_name(entry_name) then
                  -- We can skip that.
               elseif entry_name.has_suffix(once ".class") then
                  class_item_count := class_item_count + 1
               elseif is_possible_source_file(entry_name) then
                  do_not_remove_flag := True
                  echo.put_string("Source file %"")
                  path.copy(name)
                  basic_directory.compute_file_path_with(path, entry_name)
                  path.copy(basic_directory.last_entry)
                  echo.put_string(path)
                  echo.put_string("%" not produced by compile_to_jvm.%N")
               elseif is_directory_of_class_files(name, entry_name) then
                  echo.put_string("Directory %"")
                  path.copy(name)
                  (create {BASIC_DIRECTORY}).compute_subdirectory_with(path, entry_name)
                  echo.put_string((create {BASIC_DIRECTORY}).last_entry)
                  echo.put_string("%" contains only *.class files.%N")
               else
                  -- No risk:
                  do_not_remove_flag := True
               end
               basic_directory.read_entry
            end
            basic_directory.disconnect
            if do_not_remove_flag then
               echo.put_string("Directory %"")
               echo.put_string(name)
               echo.put_string("%" is not a directory generated by compile_to_jvm.%N")
            else
               -- We can now remove all the `compile_to_jvm' generated files:
               basic_directory.connect_to(name)
               if basic_directory.is_connected then
                  -- Second loop to perform `remove_or_no_remove' calls:
                  from
                     basic_directory.read_entry
                  until
                     basic_directory.end_of_input
                  loop
                     entry_name.copy(basic_directory.last_entry)
                     if is_special_entry_name(entry_name) then
                        -- We can skip that.
                     elseif entry_name.has_suffix(once ".class") then
                        path.copy(name)
                        basic_directory.compute_file_path_with(path, entry_name)
                        path.copy(basic_directory.last_entry)
                        remove_or_no_remove(path)
                     else
                        remove_directory_of_class_files(name, entry_name)
                     end
                     basic_directory.read_entry
                  end
                  basic_directory.disconnect
               end
               remove_or_no_remove_empty_directory(name)
            end
         end
      end

   remove_or_no_remove (path: STRING) is
      do
         if no_remove_flag then
            if (create {FILE_TOOLS}).is_readable(path) then
               if echo.is_verbose then
                  echo.put_string(once "File %"")
                  echo.put_string(path)
                  echo.put_string(once "%" would be removed without -no_remove flag.%N")
               else
                  std_output.put_string(path)
                  std_output.put_string(once "%N")
               end
            end
         else
            echo.file_removing(path)
         end
      end

   remove_or_no_remove_empty_directory (empty_directory_path: STRING) is
      do
         if no_remove_flag then
            if (create {FILE_TOOLS}).is_readable(empty_directory_path) then
               if echo.is_verbose then
                  echo.put_string(once "Directory %"")
                  echo.put_string(empty_directory_path)
                  echo.put_string(once "%" would be removed without -no_remove flag.%N")
               else
                  std_output.put_string(empty_directory_path)
                  std_output.put_string(once "%N")
               end
            end
         else
            echo.put_string("Removing directory %"")
            echo.file_removing(empty_directory_path)
            echo.put_string("%".%N")
            if (create {BASIC_DIRECTORY}).remove_directory(empty_directory_path) then
               echo.put_string("Directory %"")
               echo.file_removing(empty_directory_path)
               echo.put_string("%" removed.%N")
            else
               echo.put_string("Removal of directory %"")
               echo.file_removing(empty_directory_path)
               echo.put_string("%" failed.%N")
            end
         end
      end

   is_possible_source_file (name: STRING): BOOLEAN is
      require
         not name.is_empty
      local
         i: INTEGER
      do
         i := name.reverse_index_of('.', name.count)
         if i /= 0 then
            Result := i < name.count
         end
      end

   is_directory_of_class_files (name, entry_name: STRING): BOOLEAN is
      require
         not name.is_empty
         not entry_name.is_empty
      local
         path, entry: STRING; basic_directory: BASIC_DIRECTORY
      do
         path := once "....... local private buffer ........."
         entry := once "....... local private buffer ........."
         basic_directory.compute_subdirectory_with(name, entry_name)
         path.copy(basic_directory.last_entry)
         if not path.is_empty then
            basic_directory.connect_to(path)
            if basic_directory.is_connected then
               from
                  Result := True
                  basic_directory.read_entry
               until
                  (not Result) or else basic_directory.end_of_input
               loop
                  entry.copy(basic_directory.last_entry)
                  if is_special_entry_name(entry) or else entry.has_suffix(once ".class") then
                     check
                        Result
                     end
                  else
                     Result := False
                     echo.put_string("File %"")
                     basic_directory.compute_file_path_with(path, entry)
                     echo.put_string(basic_directory.last_entry)
                     echo.put_string("%" not produced by compile_to_jvm.%N")
                  end
                  basic_directory.read_entry
               end
            end
            basic_directory.disconnect
         end
      end

   is_special_entry_name (name: STRING): BOOLEAN is
      do
         inspect
            name
         when ".", ".." then
            Result := True
         else
            -- Not a special name.
         end
      end

   remove_directory_of_class_files (name, entry_name: STRING) is
      require
         is_directory_of_class_files(name, entry_name)
      local
         path, entry: STRING; basic_directory: BASIC_DIRECTORY
      do
         path := once "....... local private buffer ........."
         entry := once "....... local private buffer ........."
         basic_directory.compute_subdirectory_with(name, entry_name)
         path.copy(basic_directory.last_entry)
         if not path.is_empty then
            basic_directory.connect_to(path)
            if basic_directory.is_connected then
               from
                  basic_directory.read_entry
               until
                  basic_directory.end_of_input
               loop
                  entry.copy(basic_directory.last_entry)
                  if not is_special_entry_name(entry) then
                     basic_directory.compute_file_path_with(path, entry)
                     entry.copy(basic_directory.last_entry)
                     remove_or_no_remove(entry)
                  end
                  basic_directory.read_entry
               end
            end
            basic_directory.disconnect
            basic_directory.compute_subdirectory_with(name, entry_name)
            path.copy(basic_directory.last_entry)
            remove_or_no_remove_empty_directory(path)
         end
      end

end -- class CLEAN
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
