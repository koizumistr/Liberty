class TEST_VECTOR0

inherit
	EIFFELTEST_TOOLS

creation 
	make
	
feature

	make is
		local
			m: GSL_VECTOR_REAL_64
		do
			create m.make_zero(10)

			assert(m.count = 10)

			assert(m.all_default)
			
		end

end -- TEST_VECTOR0