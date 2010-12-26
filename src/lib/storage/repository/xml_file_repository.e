-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class XML_FILE_REPOSITORY [O_ -> STORABLE]
   --
   -- To be used with a file that contains the repository (and only that)
   --
inherit
   XML_REPOSITORY_IMPL[O_]

create {ANY}
   connect_to

feature {ANY} -- Updating and committing
   commit is
      do
         commit_stream.connect_to(filename)
         write_to_stream(commit_stream)
         commit_stream.disconnect
      end

   is_commitable: BOOLEAN is
      do
         Result := commit_stream /= Void and then is_connected
      end

   update is
      do
         update_stream.connect_to(filename)
         read_from_stream(update_stream)
         update_stream.disconnect
      end

   is_updateable: BOOLEAN is
      do
         Result := update_stream /= Void and then is_connected
      end

   is_connected: BOOLEAN is
      do
         Result := filename /= Void
      end

feature {ANY} -- Creation
   connect_to (a_filename: like filename) is
         -- Connect to a repository with streams as physical store.
      local
         ft: FILE_TOOLS
      do
         make
         if ft.file_exists(a_filename) then
            filename := a_filename
            if ft.is_readable(a_filename) then
               create update_stream.make
               update
            end
            commitable_tester.connect_for_appending_to(a_filename)
            if commitable_tester.is_connected then
               create commit_stream.make
               commitable_tester.disconnect
            end
         else
            commitable_tester.connect_to(a_filename)
            if commitable_tester.is_connected then
               filename := a_filename
               create commit_stream.make
               commitable_tester.disconnect
               create update_stream.make
            end
         end
      end

feature {}
   filename: STRING
   update_stream: TEXT_FILE_READ
   commit_stream: TEXT_FILE_WRITE

   commitable_tester: TEXT_FILE_WRITE is
      once
         create Result.make
      end

end -- class XML_FILE_REPOSITORY
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
