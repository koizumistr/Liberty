class GI_UNION_INFO
        -- A GObject metadata object representing a union.

        -- A union has methods and fields. Unions can optionally have a
        -- discriminator, which is a field deciding what type of real union
        -- fields

        -- As unions in the C language has fields but not methods this wrapper
        -- made indexable over its fields throught proper inheritance of INDEXABLE,
        -- while providing indexable-like features over the functions provided.

        -- GI_UNION_INFO could have been made a proper multiple heir of INDEXABLE
        -- but the added complexity of the resulting code would not have brought
        -- any appreciable benefits.

inherit
        GI_REGISTERED_TYPE_INFO
                redefine out_in_tagged_out_memory end

        INDEXABLE[GI_FIELD_INFO]
                rename
                        lower as fields_lower
                        upper as fields_upper
                        count as fields_count
                        is_empty as has_no_fields
                        valid_index as valid_field_index
                        item as field
                        first as first_field
                        last as last_field
                        for_each as for_each _field
                        for_all as for_all_fields
                        exists as exists_field
                        aggregate as aggregate_fields
                        undefine copy, is_equal
                redefine out_in_tagged_out_memory
                end

insert
        GIUNIONINFO_EXTERNALS
                redefine out_in_tagged_out_memory end
create {GI_INFO_FACTORY, WRAPPER} from_external_pointer

feature {ANY} -- Fields
        fields_lower: INTEGER 0
        fields_upper: INTEGER do Result := fields_count-1 end
        fields_count: INTEGER
                -- The number of fields that this object type has.
        do
                Result := g_union_info_get_n_fields(handle)
        end

        has_no_fields: BOOLEAN
                do
                        Result := fields_count=0
                end

        field (n: INTEGER): GI_FIELD_INFO
                -- The field object at index n.
        do
                create Result.from_external_pointer(g_union_info_get_field(handle,n))
                -- g_union_info_get_field returns the GIFieldInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
        ensure not_void: Result/=Void
        end

        first_field: GI_FIELD_INFO do Result:=field(fields_lower) end
        last_field: GI_FIELD_INFO do Result:=field(fields_upper) end

        new_fields_iterator: ITERATOR_OVER_UNION_FIELDS
                do
                        create Result.from_union(Current)
                end

feature {ANY} -- Methods
        methods_lower: INTEGER 0
        methods_upper: INTEGER do Result := methods_count-1 end
        methods_count: INTEGER
                -- The number of methods Current object has
        do
                Result := g_union_info_get_n_methods (handle)
        end

        method (n: INTEGER): GI_FUNCTION_INFO
                -- The method object at index `n'
        do
                create Result.from_external_pointer(g_union_info_get_method(handle,n))
                -- returns  the GIFunctionInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
        ensure not_void: Result/=Void
        end

        find_method (a_name: ABSTRACT_STRING): GI_FUNCTION_INFO
                -- The method with `a_name'. Void if no method exists with that name
        require
                not_void_name: a_name/=Void
                not_empty_name: not a_name.is_empty
        local p: POINTER
        do
                p := g_union_info_find_method(handle,a_name.to_external)
                if p.is_not_null then
                        create Result.from_external_pointer(p)
                end
                -- g_union_info_find_method returns a GIFunctionInfo. Free the struct by calling g_base_info_unref() when done. [transfer full]
        end

        for_each_method (an_action: ROUTINE[TUPLE[GI_FUNCTION_INFO]])
        local i: INTEGER
        do
                from i:=methods_lower until i>methods_upper loop
                        an_action.call([method(i)])
                        i:=i+1
                end
        end

        for_all_methods (a_test: FUNCTION[TUPLE[GI_FUNCTION_INFO],BOOLEAN]): BOOLEAN
                local i: INTEGER
                do
                        from Result := True; i := methods_lower
                        until not Result or else i > methods_upper
                        loop
                                Result := a_test.item([method(i)])
                                i := i + 1
                        end
                end

        exists_method (test: PREDICATE[TUPLE[GI_FUNCTION_INFO]]): BOOLEAN
        local i: INTEGER
        do
                from i:=methods_lower until Result or else i>methods_upper
                loop
                        Result := test.item([method(i)])
                        i:=i+1
                end
        end

feature {ANY}
        is_discriminated: BOOLEAN
                -- Does Current union contain a discriminator field?
        do
                Result:= g_union_info_is_discriminated(handle).to_boolean
        end

        discriminator_offset: INTEGER
                -- Offset of the discrimantor
        require is_discriminated
        do
                Result := g_union_info_get_discriminator_offset(handle)
        end

        discriminator_type: GI_TYPE_INFO
                -- the type information of the union discriminator.
        require is_discriminated
        do
                create Result.from_external_pointer(g_union_info_get_discriminator_type (handle))
                -- g_union_info_get_discriminator_type returns : the GITypeInfo, free it with g_base_info_unref() when done. [transfer full]
        ensure not_void: Result/=Void
        end

        discriminator (n: INTEGER) : GI_CONSTANT_INFO
                -- the discriminator value assigned for n-th union field, i.e. n-th
                -- union field is the active one if discriminator contains this
                -- constant.
        do
                create Result.from_external_pointer(g_union_info_get_discriminator(handle,n))
                --g_union_info_get_discriminator returns the GIConstantInfo, free it with g_base_info_unref() when done. [transfer full]
        end

        size: NATURAL
                -- The total size of the union in bytes
        do
                Result := g_union_info_get_size(handle)
        end

        alignment: NATURAL
                -- The required alignment of the union in bytes.
        do
                Result := g_union_info_get_alignment(handle)
        end

feature {ANY}
        out_in_tagged_out_memory
                do
                        not_yet_implemented
                end

end -- class GI_UNION_INFO

-- Copyright (C) 2013 Paolo Redaelli <paolo.redaelli@gmail.com>
--
-- This library is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public License
-- as published by the Free Software Foundation; either version 2.1 of
-- the License, or (at your option) any later version.
--
-- This library is distributed in the hope that it will be useful, but
-- WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this library; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
-- 02110-1301 USA
