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
class LIBERTY_ETC_VISITOR_IMPL

inherit
	LIBERTY_ETC_VISITOR

create {ANY}
	make

feature {LIBERTY_ETC}
	tool_name: FIXED_STRING

	clusters: MAP[LIBERTY_ETC_CLUSTER, STRING] is
		do
			Result := all_clusters
		end

feature {LIBERTY_ETC_FACTORY} -- Lists
	visit_environment_variable_list (list: LIBERTY_ETC_LIST) is
		do
			list.do_all(agent {EIFFEL_NODE}.accept(Current))
		end

	visit_cluster_list (list: LIBERTY_ETC_LIST) is
		do
			list.do_all(agent {EIFFEL_NODE}.accept(Current))
		end

	visit_cluster_configuration_list (list: LIBERTY_ETC_LIST) is
		do
			list.do_all(agent {EIFFEL_NODE}.accept(Current))
		end

	visit_debug_configuration_list (list: LIBERTY_ETC_LIST) is
		do
			list.do_all(agent {EIFFEL_NODE}.accept(Current))
		end

	visit_debug_key_list (list: LIBERTY_ETC_LIST) is
		do
			list.do_all(agent {EIFFEL_NODE}.accept(Current))
		end

feature {LIBERTY_ETC_FACTORY} -- Non-Terminals
	visit_master (nt: LIBERTY_ETC_NON_TERMINAL) is
		local
			t: EIFFEL_TERMINAL_NODE
		do
			check
				nt.lower = 0
				nt.name_at(1).is_equal(once "KW entity name")
				nt.name_at(2).is_equal(once "Environment")
				nt.name_at(3).is_equal(once "Clusters")
			end
			t ::= nt.node_at(1)
			if not t.image.image.is_equal(tool_name) then
				errors.set(errors.level_fatal_error, "Invalid file content: bad Master name " + t.image.image
							  + " (expected " + tool_name + ")")
				check
					dead: False
				end
			end
			nt.node_at(2).accept(Current)
			nt.node_at(3).accept(Current)
		end

	visit_environment (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
			if not nt.is_empty then
				nt.node_at(1).accept(Current)
			end
		end

	visit_environment_variable (nt: LIBERTY_ETC_NON_TERMINAL) is
		local
			entity_name, entity_value: EIFFEL_TERMINAL_NODE
			entity_value_image: TYPED_EIFFEL_IMAGE[STRING]
		do
			check
				nt.lower = 0
				nt.name_at(0).is_equal(once "KW entity name")
				nt.name_at(2).is_equal(once "KW string")
			end
			entity_name ::= nt.node_at(0)
			entity_value ::= nt.node_at(2)
			entity_value_image ::= entity_value.image
			env.set(entity_name.image.image, entity_value_image.decoded)
		end

	visit_clusters (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
			if not nt.is_empty then
				check
					nt.lower = 0
					nt.name_at(1).is_equal(once "Cluster*")
				end
				nt.node_at(1).accept(Current)
			end
		end

	visit_cluster (nt: LIBERTY_ETC_NON_TERMINAL) is
		local
			cluster_name: EIFFEL_TERMINAL_NODE
		do
			check
				nt.lower = 0
				nt.name_at(0).is_equal(once "KW entity name")
				nt.name_at(1).is_equal(once "Location")
				nt.name_at(2).is_equal(once "Version")
				nt.name_at(3).is_equal(once "Needs")
			end
			cluster_name ::= nt.node_at(0)
			create current_cluster.make(cluster_name.image.image)
			--|*** TODO: check if the cluster already exists
			all_clusters.add(current_cluster, cluster_name.image.image)
			nt.node_at(1).accept(Current)
			nt.node_at(2).accept(Current)
			nt.node_at(3).accept(Current)
			current_cluster := Void
		end

	visit_location (nt: LIBERTY_ETC_NON_TERMINAL) is
		local
			location: EIFFEL_TERMINAL_NODE
			location_image: TYPED_EIFFEL_IMAGE[STRING]
		do
			check
				nt.lower = 0
				nt.name_at(1).is_equal(once "KW string")
			end
			location ::= nt.node_at(1)
			location_image ::= location.image
			current_cluster.set_location(location_image.decoded)
		end

	visit_version (nt: LIBERTY_ETC_NON_TERMINAL) is
		local
			version: EIFFEL_TERMINAL_NODE
			version_image: TYPED_EIFFEL_IMAGE[STRING]
		do
			check
				nt.lower = 0
				nt.name_at(1).is_equal(once "KW string")
			end
			version ::= nt.node_at(1)
			version_image ::= version.image
			current_cluster.set_version(version_image.decoded)
		end

	visit_needs (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

	visit_cluster_configuration (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

	visit_cluster_constraints (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

	visit_cluster_version_constraint (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

	visit_version_operator (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

	visit_cluster_details (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

	visit_assertion (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

	visit_assertion_level (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

	visit_debug (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

	visit_debug_configuration (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

	visit_debug_key (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

	visit_concurrency (nt: LIBERTY_ETC_NON_TERMINAL) is
		do
		end

feature {}
	make (a_tool_name: ABSTRACT_STRING) is
		require
			a_tool_name /= Void
		do
			tool_name := a_tool_name.intern
			create all_clusters.make
		ensure
			tool_name = a_tool_name.intern
		end

	errors: LIBERTY_ERRORS
	env: LIBERTY_ENVIRONMENT
	all_clusters: HASHED_DICTIONARY[LIBERTY_ETC_CLUSTER, STRING]
	current_cluster: LIBERTY_ETC_CLUSTER

invariant
	all_clusters /= Void
	tool_name /= Void

end -- class LIBERTY_ETC_VISITOR_IMPL