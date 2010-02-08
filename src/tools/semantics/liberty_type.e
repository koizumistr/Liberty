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
deferred class LIBERTY_TYPE
	--
	-- The type referenced in entity definitions
	--

inherit
	HASHABLE
		undefine out_in_tagged_out_memory
		end

feature {ANY}
	actual_type: LIBERTY_ACTUAL_TYPE is
		require
			is_actual_type_set
		deferred
		end

	is_actual_type_set: BOOLEAN is
		deferred
		end

	full_name: FIXED_STRING is
		deferred
		ensure
			Result /= Void
		end

	export_only: BOOLEAN
			-- True if the type is only ever used as an export marker (in feature, creation, or export clauses)

feature {LIBERTY_UNIVERSE, LIBERTY_TYPE_RESOLVER, LIBERTY_TYPE}
	unset_export_only is
		do
			export_only := False
		ensure
			not export_only
		end

feature {LIBERTY_ACTUAL_TYPE}
	full_name_in (buffer: STRING) is
		require
			buffer /= Void
		deferred
		end

feature {LIBERTY_TYPE_LISTENER}
	add_listener (a_listener: LIBERTY_TYPE_LISTENER) is
		require
			a_listener /= Void
			not has_listener(a_listener)
			not is_actual_type_set
		do
			listeners.add_last(a_listener)
		ensure
			has_listener(a_listener)
		end

	remove_listener (a_listener: LIBERTY_TYPE_LISTENER) is
		require
			a_listener /= Void
			has_listener(a_listener)
		do
			listeners.remove(listeners.fast_first_index_of(a_listener))
		ensure
			not has_listener(a_listener)
		end

	has_listener (a_listener: LIBERTY_TYPE_LISTENER): BOOLEAN is
		require
			a_listener /= Void
		do
			Result := listeners /= Void and then listeners.fast_has(a_listener)
		end

feature {}
	fire_actual_type_set is
		local
			i: INTEGER
		do
			from
				i := listeners.lower
			until
				i > listeners.upper
			loop
				listeners.item(i).on_actual_type_set(Current)
				i := i + 1
			end
			listeners := Void
		end

feature {}
	listeners: COLLECTION[LIBERTY_TYPE_LISTENER]

invariant
	not is_actual_type_set implies listeners /= Void

end
