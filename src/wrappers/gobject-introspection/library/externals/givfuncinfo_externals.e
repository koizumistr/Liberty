-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GIVFUNCINFO_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	g_vfunc_info_get_address (an_info: POINTER; an_implementor_gtype: NATURAL_32; an_error: POINTER): POINTER is
 		-- g_vfunc_info_get_address
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_vfunc_info_get_address"
		}"
		end

	g_vfunc_info_get_flags (an_info: POINTER): INTEGER is
 		-- g_vfunc_info_get_flags
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_vfunc_info_get_flags"
		}"
		end

	g_vfunc_info_get_invoker (an_info: POINTER): POINTER is
 		-- g_vfunc_info_get_invoker
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_vfunc_info_get_invoker"
		}"
		end

	g_vfunc_info_get_offset (an_info: POINTER): INTEGER_32 is
 		-- g_vfunc_info_get_offset
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_vfunc_info_get_offset"
		}"
		end

	g_vfunc_info_get_signal (an_info: POINTER): POINTER is
 		-- g_vfunc_info_get_signal
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_vfunc_info_get_signal"
		}"
		end

	g_vfunc_info_invoke (an_info: POINTER; an_implementor: NATURAL_32; an_in_args: POINTER; a_n_in_args: INTEGER_32; an_out_args: POINTER; a_n_out_args: INTEGER_32; a_return_value: POINTER; an_error: POINTER): INTEGER_32 is
 		-- g_vfunc_info_invoke
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "g_vfunc_info_invoke"
		}"
		end


end -- class GIVFUNCINFO_EXTERNALS
