class LIBERTY_COMPILER

create {LIBERTYC}
   make

feature {ANY}
   root_type: LIBERTY_ACTUAL_TYPE
   root_feature_name: LIBERTY_FEATURE_NAME
   root_feature: LIBERTY_FEATURE_DEFINITION

   check_level: LIBERTY_MAIN_CHECK_LEVEL
   is_debug: BOOLEAN

feature {}
   all_types: SET[LIBERTY_ACTUAL_TYPE]

feature {LIBERTYC}
   compile_classes is
         -- Compile all the classes used by the program, if they need rebuilding.
      do

      end

   finalize is
         -- Builds (links) the final executable.
         -- Also adds specific runtime frameworks, such as a tailored GC etc.
      do
      end

feature {}
   make (a_universe: like universe; a_root_type: like root_type; a_root_feature_name: like root_feature_name;
         a_check_level: like check_level; a_debug: like is_debug) is
      require
         a_universe /= Void
         a_root_type /= Void
         a_root_feature_name /= Void
      do
         universe := a_universe

         check_level := a_check_level
         is_debug := a_debug

         root_type := a_root_type
         root_feature_name := a_root_feature_name

         ensure_built(a_root_type)
         if not a_root_type.has_feature(a_root_feature_name) then
            std_error.put_string("Unknown feature ")
            std_error.put_string(a_root_feature_name.full_name)
            std_error.put_string(" in type ")
            std_error.put_line(a_root_type.full_name)
            die_with_code(1)
         end
         root_feature := a_root_type.feature_definition(a_root_feature_name)

         create {HASH_SET[LIBERTY_ACTUAL_TYPE]} all_types.make
         all_types.add(root_type)
      ensure
         universe = a_universe
         check_level = a_check_level
         is_debug = a_debug
         root_type = a_root_type
         root_feature_name = a_root_feature_name
      end

   universe: LIBERTY_UNIVERSE

   ensure_built (a_type: LIBERTY_ACTUAL_TYPE) is
      do
         universe.build_types(root_type, root_feature_name, a_type)
      end

invariant
   universe /= Void
   root_type /= Void
   root_feature_name /= Void
   root_feature /= Void
   all_types /= Void
   all_types.fast_has(root_type)

end -- class LIBERTY_COMPILER
