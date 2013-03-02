-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTRAVERSE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = in_order_low_level)  or else
				(a_value = pre_order_low_level)  or else
				(a_value = post_order_low_level)  or else
				(a_value = level_order_low_level) )
		end

feature -- Setters
	default_create,
	set_in_order is
		do
			value := in_order_low_level
		end

	set_pre_order is
		do
			value := pre_order_low_level
		end

	set_post_order is
		do
			value := post_order_low_level
		end

	set_level_order is
		do
			value := level_order_low_level
		end

feature -- Queries
	in_order: BOOLEAN is
		do
			Result := (value=in_order_low_level)
		end

	pre_order: BOOLEAN is
		do
			Result := (value=pre_order_low_level)
		end

	post_order: BOOLEAN is
		do
			Result := (value=post_order_low_level)
		end

	level_order: BOOLEAN is
		do
			Result := (value=level_order_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	in_order_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IN_ORDER"
 			}"
 		end

	pre_order_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PRE_ORDER"
 			}"
 		end

	post_order_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_POST_ORDER"
 			}"
 		end

	level_order_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_LEVEL_ORDER"
 			}"
 		end


end -- class GTRAVERSE_TYPE_ENUM