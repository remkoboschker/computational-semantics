model([d1,d2,d3,d4,n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12],
      [f(1,n_swan_1,[d1]),
       f(1,a_white_2,[d1]),
       f(1,n_gull_2,[d2]),
       f(1,a_gray_1,[d2]),
	f(1,n_pavement_1,[d3]),
	f(1,a_black_1,[d3]),
	f(1,n_sand_1,[d4]),
	f(1,a_yellow_1,[d4]),
	f(1,n_head_1,[n1,n2]),
	f(1,n_beak_1,[n3,n4]),
	f(1,n_wing_1,[n5,n6,n7,n8]),	
	f(1,n_leg_1,[n9,n10,n11,n12]),
	f(2,s_supports,[(d3,d1),(d4,n9),(d4,n10),(n9,d2),(n10,d2)]),
	f(2,s_part_of,[(n1,d1),(n2,d2),(n3,n1),(n4,n2),(n5,d1),(n6,d1),(n7,d2),(n8,d2),(n9,d2),(n10,d2)]),
	f(2,s_touches,[(n3,n5),(n3,n6),(n1,n6)]),
	f(2,s_occludes,[(d3,d4),(n5,n3),(n1,n6),(d1,d3),(n9,d4),(n10,d4),(n11,d3),(n12,d3)])]).
	
