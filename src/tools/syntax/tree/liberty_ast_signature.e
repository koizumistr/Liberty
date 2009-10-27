-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_SIGNATURE

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	feature_names: EIFFEL_LIST_NODE is
		do
			Result ::= nodes.item(0)
		end

	has_result_type: BOOLEAN is
		do
			Result := count = 3 or else count = 6
			check
				Result implies nodes.last.name.is_equal(once "Type_Definition")
			end
		end

	result_type: LIBERTY_AST_TYPE_DEFINITION is
		require
			has_result_type
		do
			Result ::= nodes.last
		end

	has_parameters: BOOLEAN is
		do
			Result := count >= 4
			check
				Result implies nodes.item(2).name.is_equal(once "Definition+")
			end
		end

	parameters: EIFFEL_LIST_NODE is
		require
			has_parameters
		do
			Result ::= nodes.item(2)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "Signature"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1, 3, 4, 6 >> }
		end

end
