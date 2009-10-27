-- Copyright (C) 2009 Cyril ADRIAN
--
class LIBERTY_AST_LOOP

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	from_clause: LIBERTY_AST_FROM is
		do
			Result ::= nodes.item(0)
		end

	invariant_clause: LIBERTY_AST_INVARIANT is
		do
			Result ::= nodes.item(1)
		end

	variant_clause: LIBERTY_AST_VARIANT is
		do
			Result ::= nodes.item(2)
		end

	expression: LIBERTY_AST_EXPRESSION is
		do
			Result ::= nodes.item(4)
		end

	instructions: EIFFEL_LIST_NODE is
		do
			Result ::= nodes.item(6)
		end

feature {ANY}
	count: INTEGER is 8

	name: STRING is "Loop"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 8 >> }
		end

end
