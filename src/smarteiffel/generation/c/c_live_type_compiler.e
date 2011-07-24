-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_LIVE_TYPE_COMPILER

inherit
   LIVE_TYPE_VISITOR
      undefine
         is_equal
      end
   RUN_FEATURE_VISITOR
      undefine
         is_equal
      end

insert
   C_COMPILATION_MIXIN
      undefine
         is_equal
      end
   SINGLETON

create {ANY}
   make

feature {C_PRETTY_PRINTER}
   compile (live_type: LIVE_TYPE; depth: INTEGER) is
      require
         live_type /= Void
         depth >= 0
      local
         i: INTEGER; lt1, lt2: LIVE_TYPE; cc1, cc2: INTEGER
      do
         if not live_type.at_run_time or else is_compiled(live_type) then
            std_output.put_line(live_type.name.to_string + ": don't compile now")
         elseif depth = 0 then
            std_output.put_line(live_type.name.to_string + ": compile now")
            live_type.accept(Current)
         elseif not live_type.actual_clients.is_empty then
            from
               lt1 := live_type
               cc1 := live_type.actual_clients.count
               i := live_type.actual_clients.lower
            until
               i > live_type.actual_clients.upper
            loop
               std_output.put_line(live_type.name.to_string + ": " + live_type.actual_clients.lower.out + ".." + live_type.actual_clients.upper.out + " -> " + i.out + " (" + lt1.name.to_string + ")")
               lt2 := live_type.actual_clients.item(i)
               if lt2.at_run_time and then not is_compiled(lt2) then
                  cc2 := lt2.actual_clients.count
                  if cc2 > cc1 then
                     lt1 := lt2
                     cc1 := cc2
                  end
               end
               i := i + 1
            end
            if lt1 = live_type then
               lt1.accept(Current)
            else
               compile(lt1, depth - 1)
            end
         end
      ensure
         depth = 0 implies is_compiled(live_type)
      end

feature {}
   do_compile (live_type: LIVE_TYPE) is
      local
         i, feature_count: INTEGER; rf: RUN_FEATURE
      do
         cpp.set_live_type(live_type)
         cpp.split_c_file_now(live_type.live_features.count)
         agent_pool.c_define_agent_creation_for(live_type.type)
         if live_type.create_function_list /= Void then
            if live_type.create_function_list.is_empty then
               create_function_define(live_type, Void)
            else
               live_type.create_function_list.do_all(agent create_function_define(live_type, ?))
            end
         end

         echo.put_character('%T')
         echo.put_string(live_type.name.to_string)
         feature_count := live_type.live_features.count
         if live_type.precursor_run_features /= Void then
            feature_count := feature_count + live_type.precursor_run_features.count
         end
         if feature_count = 1 then
            echo.put_string(once " (1 feature).%N")
         else
            echo.put_string(once " (")
            echo.put_integer(feature_count)
            echo.put_string(once " features).%N")
         end

         from
            i := live_type.live_features.lower
         until
            i > live_type.live_features.upper
         loop
            rf := live_type.live_features.key(i).run_feature_for(live_type.type)
            rf.accept(Current)
            i := i + 1
         end

         if live_type.precursor_run_features /= Void then
            live_type.precursor_run_features.do_all(agent {RUN_FEATURE}.accept(Current))
         end

         if live_type.class_text.invariant_check and then live_type.class_invariant /= Void then
            live_type.class_invariant.define_check_class_invariant_c_function(live_type)
         end
         live_type.type.address_of_c_define
      end

   create_function_define (live_type: LIVE_TYPE; fs: FEATURE_STAMP) is
         -- Note that `fs' may be Void for the case of a create expression with no call.
      local
         boost: BOOLEAN; args: FORMAL_ARG_LIST; internal_c_local: INTERNAL_C_LOCAL
      do
         boost := ace.boost
         cpp.prepare_c_function
         if live_type.canonical_type_mark.is_reference then
            live_type.canonical_type_mark.c_type_for_target_in(function_signature)
         else
            live_type.canonical_type_mark.c_type_for_result_in(function_signature)
            function_signature.extend(' ')
         end
         function_signature.append(once "create")
         live_type.id.append_in(function_signature)
         if fs /= Void then
            function_signature.append(live_type.type.get_feature_name(fs).to_string)
         end
         function_signature.extend('(')
         if fs /= Void then
            args := fs.anonymous_feature(live_type.type).arguments
         end
         if ace.profile then
            function_signature.append(once "se_local_profile_t*parent_profile")
         end
         if boost then
            if args /= Void then
               if ace.profile then
                  function_signature.extend(',')
               end
               args.compile_to_c_in(live_type.type, function_signature)
            elseif not ace.profile then
               function_signature.append(once "void")
            end
         else
            if ace.profile then
               function_signature.extend(',')
            end
            function_signature.append(once "se_dump_stack*caller")
            if args /= Void then
               function_signature.extend(',')
               args.compile_to_c_in(live_type.type, function_signature)
            end
         end
         function_signature.extend(')')
         --
         if fs /= Void and then ace.profile then
            smart_eiffel.local_profile
         end
         internal_c_local := cpp.pending_c_function_lock_local(live_type.type, once "new")
         if fs /= Void and then ace.profile then
            smart_eiffel.start_profile(fs.run_feature_for(live_type.type))
         end
         if not boost then
            function_body.append(once "se_frame_descriptor fd=%
            %{%"create expression wrapper%",0,0,%"%",1};%N%
                 %se_dump_stack ds;%N%
            %ds.fd=&fd;%Nds.p=0;%N%
                           %ds.caller=caller;%N%
                           %ds.exception_origin=NULL;%N%
                           %ds.locals=NULL;%N")
         end
         if live_type.canonical_type_mark.is_reference then
            gc_handler.allocation_of(internal_c_local, live_type)
         else
            internal_c_local.append_in(function_body)
            function_body.append(once "=M")
            live_type.id.append_in(function_body)
            function_body.append(once ";%N")
         end
         if fs /= Void then
            cpp.push_create_expression(live_type.type, fs, internal_c_local)
            fs.run_feature_for(live_type.type).mapping_c
            cpp.pop
            if fs /= Void and then ace.profile then
               smart_eiffel.stop_profile
            end
         end
         function_body.append(once "return (")
         if live_type.type.is_reference then
            function_body.append(once "(T")
            live_type.id.append_in(function_body);
            function_body.append(once "*)")
         end
         internal_c_local.append_in(function_body)
         function_body.append(once ");%N")
         internal_c_local.unlock
         cpp.dump_pending_c_function(True)
      end

   define_c_signature (run_feature: RUN_FEATURE) is
      require
         run_feature /= Void
         run_feature.type_of_current.live_type.at_run_time
         cpp.pending_c_function
      local
         no_check, profile: BOOLEAN
      do
         no_check := ace.no_check
         profile := ace.profile
         -- Define heading of corresponding C function.
         -- Extra comment to debug C code :
         function_signature.append(once "/*")
         function_signature.append(run_feature.type_of_current.name.to_string)
         function_signature.append(once "*/")
         --
         if run_feature.result_type = Void then
            function_signature.append(once "void")
         else
            run_feature.result_type.c_type_for_result_in(function_signature)
         end
         function_signature.append(once " r")
         run_feature.type_of_current.live_type.id.append_in(function_signature)
         run_feature.name.mapping_c_in(function_signature)
         function_signature.extend('(')
         if no_check then
            function_signature.append(once "se_dump_stack*caller")
            if profile or else run_feature.use_current or else run_feature.arguments /= Void then
               function_signature.extend(',')
            end
         end
         if profile then
            function_signature.append(once "se_local_profile_t*parent_profile")
            if run_feature.use_current or else run_feature.arguments /= Void then
               function_signature.extend(',')
            end
         end
         if run_feature.use_current then
            run_feature.type_of_current.canonical_type_mark.c_type_for_target_in(function_signature)
            function_signature.append(once " C")
            if run_feature.arguments /= Void then
               function_signature.extend(',')
            end
         end
         if run_feature.arguments = Void then
            if no_check or else profile then
            elseif not run_feature.use_current then
               function_signature.append(once "void")
            end
         else
            run_feature.arguments.compile_to_c_in(run_feature.type_of_current, function_signature)
         end
         function_signature.extend(')')
      ensure
         cpp.pending_c_function
      end

   c_frame_descriptor (run_feature: RUN_FEATURE) is
         -- Initialize all `c_frame_descriptor' variables accordingly.
      require
         ace.no_check
      local
         c_frame_descriptor_format, c_frame_descriptor_locals: STRING
      do
         c_frame_descriptor_format := cpp.c_frame_descriptor_format
         c_frame_descriptor_locals := cpp.c_frame_descriptor_locals
         c_frame_descriptor_format.clear_count
         c_frame_descriptor_locals.clear_count
         if run_feature.use_current then
            run_feature.type_of_current.canonical_type_mark.c_frame_descriptor_in(c_frame_descriptor_format)
         end
         if run_feature.arguments /= Void then
            run_feature.arguments.c_frame_descriptor(run_feature.type_of_current, c_frame_descriptor_format, c_frame_descriptor_locals)
         end
         if run_feature.is_once_function then
            c_frame_descriptor_locals.append(once "(void**)&")
            once_routine_pool.unique_result_in(c_frame_descriptor_locals, run_feature.base_feature)
            c_frame_descriptor_locals.extend(',')
            c_frame_descriptor_format.append(as_result)
            run_feature.result_type.c_frame_descriptor_in(c_frame_descriptor_format)
         elseif run_feature.result_type /= Void then
            c_frame_descriptor_locals.append(once "(void**)&R,")
            c_frame_descriptor_format.append(as_result)
            run_feature.result_type.c_frame_descriptor_in(c_frame_descriptor_format)
         end
         if run_feature.local_vars /= Void then
            run_feature.local_vars.c_frame_descriptor(run_feature.type_of_current, c_frame_descriptor_format, c_frame_descriptor_locals)
         end
      end

   c_define_opening (run_feature: RUN_FEATURE) is
         -- Define opening section in C function.
      local
         t: TYPE_MARK; no_check: BOOLEAN; lt: LIVE_TYPE; rf: RUN_FEATURE;
         clc, i, result_type_id, class_invariant_flag: INTEGER
         internal_c_local: INTERNAL_C_LOCAL
      do
         smart_eiffel.push_context(run_feature.base_feature)
         no_check := ace.no_check
         if no_check then
            c_frame_descriptor(run_feature)
         end
         -- (0) --------------------------- Exception handling :
         if run_feature.rescue_compound /= Void then
            function_body.append(once "struct rescue_context rc;%N")
         end
         -- (1) -------------------- Local variable for Result:
         if run_feature.result_type /= Void then
            if not run_feature.is_once_function then
               t := run_feature.result_type
               t.c_type_for_result_in(function_body)
               function_body.append(once " R=")
               t.c_initialize_in(function_body)
               function_body.append(once ";%N")
            end
         end
         -- (2) ----------------------- User's local variables:
         if run_feature.local_vars /= Void then
            run_feature.local_vars.c_declare(run_feature.type_of_current, run_feature.rescue_compound /= Void)
         end
         -- (3) ------------------- Local variables for profile:
         if ace.profile then
            smart_eiffel.local_profile
         end
         if no_check then
            -- (4) ------------------------------- Prepare locals:
            clc := cpp.c_frame_descriptor_format.occurrences('%%')
            if clc > 0 then
               clc := clc #// 2
               if run_feature.use_current then
                  clc := clc - 1
               end
            end
            if clc > 0 then
               function_body.append(once "void**locals[")
               clc.append_in(function_body)
               function_body.append(once "];%N")
            end
            -- (5) ----------------------------------- Prepare ds:
            c_initialize_frame_information(run_feature, clc)
            -- (6) ------------------------ Initialise Dump Stack:
            cpp.set_dump_stack_top_for(run_feature.type_of_current, once "&ds", once "link")
         end
         -- (7) ---------------------------------- Add profile:
         if ace.profile then
            smart_eiffel.start_profile(run_feature)
         end
         -- (8) --------------------- Execute old expressions:
         if run_feature.old_list /= Void then
            from
               i := run_feature.old_list.lower
            until
               i > run_feature.old_list.upper
            loop
               run_feature.old_list.item(i).compile_to_c_old_memory(run_feature.type_of_current)
               i := i + 1
            end
         end
         -- (9) -------------------------- Exception handling :
         if run_feature.rescue_compound /= Void then
            function_body.append(once "handle(SE_HANDLE_EXCEPTION_SET,NULL);if(SETJMP(rc.jb)!=0){/*rescue*/%N")
            run_feature.rescue_compound.compile_to_c(run_feature.type_of_current)
            function_body.append(once "internal_exception_handler(Routine_failure);%N}%N")
         end
         -- (10) ------------ Initialize Result/local expanded :
         if run_feature.result_type /= Void then
            if run_feature.result_type.is_user_expanded then
               lt := run_feature.result_type.type.live_type
               rf := lt.default_create_run_feature
               if rf /= Void then
                  internal_c_local := cpp.pending_c_function_lock_local(lt.type, once "resexp")
                  result_type_id := lt.id
                  internal_c_local.append_in(function_body)
                  function_body.append(once "=M")
                  result_type_id.append_in(function_body)
                  function_body.append(once ";%N")
                  cpp.push_create_instruction(run_feature.type_of_current, rf, Void, internal_c_local)
                  rf.mapping_c
                  cpp.pop
                  if run_feature.is_once_function then
                     once_routine_pool.unique_result_in(function_body, run_feature.base_feature)
                  else
                     function_body.append(once "R")
                  end
                  function_body.extend('=')
                  internal_c_local.append_in(function_body)
                  function_body.append(once ";%N")
                  internal_c_local.unlock
               end
               -- Even when there is no default creation procedure to apply, we must call the class
               -- invariant:
               class_invariant_flag := cpp.class_invariant_call_opening(lt.type, True)
               if class_invariant_flag > 0 then
                  if run_feature.result_type.need_c_struct then
                     function_body.extend('&')
                  end
                  if run_feature.is_once_function then
                     once_routine_pool.unique_result_in(function_body, run_feature.base_feature)
                  else
                     function_body.extend('R')
                  end
                  cpp.class_invariant_call_closing(class_invariant_flag, True)
               end
            end
         end
         if run_feature.local_vars /= Void then
            run_feature.local_vars.initialize_expanded(run_feature.type_of_current)
         end
         -- (11) --------------------------- Retry start label :
         if run_feature.rescue_compound /= Void then
            function_body.append(once "retry_tag:%N")
         end
         -- (12) ---------------------- Require assertion code :
         if run_feature.type_of_current.class_text.require_check and then run_feature.require_assertion /= Void then
            run_feature.require_assertion.compile_to_c(run_feature.type_of_current)
         end
         -- (13) ------------------------- Save rescue context :
         if run_feature.rescue_compound /= Void then
            function_body.append(once "rc.next = rescue_context_top;%N%
                                                    %rescue_context_top = &rc;%N")
            if no_check then
               function_body.append(once "rc.top_of_ds=&ds;%N")
               cpp.set_dump_stack_top_for(run_feature.type_of_current, once "&ds", once "link")
            end
         end
      end

   put_c_name_tag (run_feature: RUN_FEATURE) is
      require
         ace.no_check
      local
         fn: FEATURE_NAME; tag: STRING
      do
         --|*** Afficher tous les synonymes avec une boucle ??? ***.
         fn := run_feature.base_feature.first_name
         if not fn.is_simple_feature_name then
            tag := run_feature.name.infix_or_prefix
            if tag /= Void then
               function_body.extend('%"')
               function_body.append(tag)
               function_body.extend(' ')
               function_body.extend('%"')
            end
            manifest_string_pool.string_to_c_code(run_feature.name.to_string, function_body)
            function_body.append(once "%" (%"")
         end
         tag := fn.infix_or_prefix
         if tag /= Void then
            function_body.extend('%"')
            function_body.append(tag)
            function_body.extend(' ')
            function_body.extend('%"')
         end
         manifest_string_pool.string_to_c_code(fn.to_string, function_body)
         function_body.extend('%"')
         function_body.extend(' ')
         function_body.append(run_feature.type_of_current.name.to_string)
         if not fn.is_simple_feature_name then
            function_body.extend(')')
         end
         function_body.extend('%"')
      end

   c_initialize_frame_information (run_feature: RUN_FEATURE; c_locals_count: INTEGER) is
      require
         ace.no_check
      local
         c_frame_descriptor_format, c_frame_descriptor_locals: STRING; i, j: INTEGER; c: CHARACTER
      do
         c_frame_descriptor_format := cpp.c_frame_descriptor_format
         c_frame_descriptor_locals := cpp.c_frame_descriptor_locals
         function_body.append(once "static se_frame_descriptor fd={")
         put_c_name_tag(run_feature)
         function_body.extend(',')
         if run_feature.use_current then
            function_body.extend('1')
         else
            function_body.extend('0')
         end
         function_body.extend(',')
         c_locals_count.append_in(function_body)
         function_body.append(once ",%"")
         function_body.append(c_frame_descriptor_format)
         function_body.append(once "%",1};%Nse_dump_stack ds;%Nds.fd=&fd;%N%
             %ds.current=")
         if run_feature.use_current then
            function_body.append(once "(void*)&C")
         else
            function_body.append(once "(void*)0")
         end
         function_body.append(once ";%N")
         cpp.put_position_in_ds(run_feature.start_position)
         function_body.append(once "ds.caller=caller;%N")
         if c_locals_count <= 0 then
            function_body.append(once "ds.locals=NULL;%N")
         else
            function_body.append(once "ds.locals=locals;%N")
         end
         function_body.append(once "ds.exception_origin=NULL;%N")
         from
            j := 1
         until
            i = c_locals_count
         loop
            function_body.append(once "locals[")
            i.append_in(function_body)
            function_body.append(once "]=")
            from
               c := c_frame_descriptor_locals.item(j)
            until
               c = ','
            loop
               function_body.extend(c)
               j := j + 1
               c := c_frame_descriptor_locals.item(j)
            end
            j := j + 1
            function_body.append(once ";%N")
            i := i + 1
         end
      end

   c_define_closing (run_feature: RUN_FEATURE) is
         -- Define closing section in the corresponding C function (code for ensure checking, free memory of
         -- expanded, run stack pop, etc.).
      do
         -- (1) --------------------------- Ensure Check Code:
         if run_feature.ensure_assertion /= Void then
            run_feature.ensure_assertion.compile_to_c(run_feature.type_of_current)
         end
         -- (2) ----------------------------- Class Invariant:
         if run_feature.use_current then
            if run_feature.name.to_string /= as_dispose then
               cpp.current_class_invariant(run_feature.type_of_current)
            end
         end
         -- (3) ---------------------------------- For rescue:
         if run_feature.rescue_compound /= Void then
            function_body.append(once "rescue_context_top = rc.next;handle(SE_HANDLE_EXCEPTION_CLEAR,NULL);%N")
         end
         -- (4) ------------------------------- Run Stack Pop:
         if ace.no_check then
            cpp.set_dump_stack_top_for(run_feature.type_of_current, once "caller", once "unlink")
         end
         -- (5) ------------------------------------ Profiling:
         if ace.profile then
            smart_eiffel.stop_profile
         end
         smart_eiffel.pop_context(run_feature.base_feature)
      end

feature {LIVE_TYPE}
   visit_live_type (visited: LIVE_TYPE) is
      do
         compile_live_type(visited)
      end

feature {RUN_FEATURE_1}
   visit_run_feature_1 (visited: RUN_FEATURE_1) is
      do
      end

feature {RUN_FEATURE_2}
   visit_run_feature_2 (visited: RUN_FEATURE_2) is
      do
         if visited.need_c_function then
            cpp.prepare_c_function
            define_c_signature(visited)
            c_define_opening(visited)
            function_body.append(once "R=C->")
            visited.put_c_field_name
            function_body.append(once ";%N")
            c_define_closing(visited)
            function_body.append(once "return R;%N")
            cpp.dump_pending_c_function(True)
         end
      end

feature {RUN_FEATURE_3}
   visit_run_feature_3 (visited: RUN_FEATURE_3) is
      do
         if visited.use_current then
            cpp.incr_procedure_count
         else
            cpp.incr_real_procedure_count
         end
         if ace.boost and then visited.empty_body_side_effect_free_in_boost then
            -- No C function defined.
         else
            cpp.prepare_c_function
            define_c_signature(visited)
            c_define_opening(visited)
            if visited.routine_body /= Void then
               visited.routine_body.compile_to_c(visited.type_of_current)
            end
            c_define_closing(visited)
            cpp.dump_pending_c_function(True)
         end
      end

feature {RUN_FEATURE_4}
   visit_run_feature_4 (visited: RUN_FEATURE_4) is
      do
         if visited.use_current then
            cpp.incr_function_count
         else
            cpp.incr_real_function_count
         end
         cpp.prepare_c_function
         define_c_signature(visited)
         c_define_opening(visited)
         if visited.routine_body /= Void then
            visited.routine_body.compile_to_c(visited.type_of_current)
         end
         c_define_closing(visited)
         function_body.append(once "return R;%N")
         cpp.dump_pending_c_function(True)
      end

feature {RUN_FEATURE_5}
   visit_run_feature_5 (visited: RUN_FEATURE_5) is
      do
         once_routine_pool.c_define_o_flag(visited)
         cpp.prepare_c_function
         define_c_signature(visited)
         c_define_opening(visited)
         if visited.routine_body /= Void then
            once_routine_pool.c_test_o_flag(visited)
            visited.routine_body.compile_to_c(visited.type_of_current)
            function_body.append(once "}}")
         end
         c_define_closing(visited)
         cpp.dump_pending_c_function(True)
      end

feature {RUN_FEATURE_6}
   visit_run_feature_6 (visited: RUN_FEATURE_6) is
      do
         once_routine_pool.c_define_o_result(visited)
         if not visited.is_precomputable_once then
            once_routine_pool.c_define_o_flag(visited)
            cpp.prepare_c_function
            define_c_signature(visited)
            c_define_opening(visited)
            if visited.routine_body /= Void then
               once_routine_pool.c_test_o_flag(visited)
               visited.routine_body.compile_to_c(visited.type_of_current)
               once_routine_pool.c_test_o_flag_recursion(visited)
            end
            c_define_closing(visited)
            function_body.append(once "return ")
            once_routine_pool.unique_result_in(function_body, visited.base_feature)
            function_body.append(once ";%N")
            cpp.dump_pending_c_function(True)
         end
      end

feature {RUN_FEATURE_7}
   visit_run_feature_7 (visited: RUN_FEATURE_7) is
      local
         bf: EXTERNAL_PROCEDURE; native: NATIVE; bcn: STRING
      do
         bf := visited.base_feature
         native := bf.native
         if visited.does_need_c_wrapper(native) then
            cpp.prepare_c_function
            define_c_signature(visited)
            c_define_opening(visited)
            if bf.is_generated_eiffel then
               if visited.routine_body /= Void then
                  visited.routine_body.compile_to_c(visited.type_of_current)
               end
            else
               bcn := bf.class_text.name.to_string
               cpp.push_inside_some_wrapper(bf)
               native.c_mapping_procedure(visited, bcn, bf.first_name.to_string)
               cpp.pop
            end
            c_define_closing(visited)
            cpp.dump_pending_c_function(True)
         end
      end

feature {RUN_FEATURE_8}
   visit_run_feature_8 (visited: RUN_FEATURE_8) is
      local
         bf: EXTERNAL_FUNCTION; native: NATIVE; bcn: STRING
      do
         bf := visited.base_feature
         native := bf.native
         if visited.does_need_c_wrapper(native) then
            cpp.prepare_c_function
            define_c_signature(visited)
            c_define_opening(visited)
            if bf.is_generated_eiffel then
               if visited.routine_body /= Void then
                  visited.routine_body.compile_to_c(visited.type_of_current)
               end
            else
               bcn := bf.class_text.name.to_string
               cpp.push_inside_some_wrapper(bf)
               function_body.append(once "R=")
               native.c_mapping_function(visited, bcn, bf.first_name.to_string)
               function_body.append(once ";%N")
               cpp.pop
            end
            c_define_closing(visited)
            function_body.append(once "return R;%N")
            cpp.dump_pending_c_function(True)
         end
      end

feature {RUN_FEATURE_9}
   visit_run_feature_9 (visited: RUN_FEATURE_9) is
      local
         msg: STRING
      do
         if ace.relax then
            -- The deferred feature warning will be made later if the feature is actually in the live code.
            error_handler.append("Feature %"")
            error_handler.append(visited.name.to_string)
            error_handler.append("%" is deferred in type ")
            error_handler.append(visited.type_of_current.name.to_string)
            error_handler.append(". This type should be marked as deferred.")
            error_handler.print_as_warning
         end
         define_c_signature(visited)
         error_handler.add_position(visited.start_position)
         error_handler.append("This routine is actually deferred is still in the live code set. %
                              %(You will have a crash at run-time if the dynamic type of Current is ")
         error_handler.append(visited.type_of_current.name.to_string)
         error_handler.append(".)")
         error_handler.print_as_warning
         cpp.prepare_c_function
         c_define_opening(visited)
         msg := "Deferred {"
         msg.append(visited.type_of_current.name.to_string)
         msg.append(once "}.")
         msg.append(visited.name.to_string)
         msg.append(once " called.")
         cpp.put_error0(msg)
         c_define_closing(visited)
         cpp.dump_pending_c_function(True)
      end

end -- class C_LIVE_TYPE_COMPILER
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------