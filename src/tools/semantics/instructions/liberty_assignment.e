-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
deferred class LIBERTY_ASSIGNMENT

inherit
	LIBERTY_INSTRUCTION

feature {ANY}
	writable: LIBERTY_WRITABLE
	expression: LIBERTY_EXPRESSION

feature {}
	make (a_writable: like writable; a_expression: like expression) is
		require
			a_writable /= Void
			a_expression /= Void
		do
			writable := a_writable
			expression := a_expression
		ensure
			writable = a_writable
			expression = a_expression
		end

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_ASSIGNMENT_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_assignment(Current)
		end

invariant
	writable /= Void
	expression /= Void

end
