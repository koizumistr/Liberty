-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class READLINE_TEXT_FIELD

inherit
   UI_TYPED_BRIDGE_TEXT_FIELD[READLINE_JOB]
   READLINE_WIDGET[UI_TEXT_FIELD]

create {READLINE_JOB}
   make

feature {READLINE_ITEM}
   run (context: READLINE_CONTEXT): BOOLEAN
      do
         ui.set_value(context.read(once "  | "))
         Result := True
      end

end -- class READLINE_TEXT_FIELD
--
-- Copyright (c) 2012-2014 Cyril ADRIAN <cyril.adrian@gmail.com>.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software
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
