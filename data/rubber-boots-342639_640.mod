model([d1,d2,d3,d4,d5],
	[f(1,n_rubber_boot_1,[d1,d2,d3,d4]),
	 f(1,n_boot_1,[d1,d2,d3,d4]),
	 f(1,n_footwear_2,[d1,d2,d3,d4]),
	 f(1,n_welcome_mat_1,[d5]),
	 f(1,n_mat_1,[d5]),
	 f(1,n_floor_cover_1,[d5]),
	 f(1,n_covering_2,[d1,d2,d3,d4,d5]),
	 f(1,n_artifact_1,[d1,d2,d3,d4,d5]),
	 f(1,n_whole_2,[d1,d2,d3,d4,d5]),
	 f(1,n_object_1,[d1,d2,d3,d4,d5]),
	 f(1,n_physical_entity_1,[d1,d2,d3,d4,d5]),
	 f(1,n_entity_1,[d1,d2,d3,d4,d5]),
	 f(1,a_yellow_1,[d1,d2]),
	 f(1,a_blue_1,[d3,d4]),
	 f(1,a_brown_1,[d5]),
	 f(2,s_touches,[ (d1,d5), (d2,d5), (d3,d5), (d4,d5), (d5,d1), (d5,d2), (d5,d3), (d5,d4)]),
	 f(2,s_near,[ (d1,d2), (d2,d3), (d3,d4), (d2,d1), (d3,d2), (d4,d3)]),
	 f(2,s_supports,[ (d5,d1), (d5,d2), (d5,d3), (d5,d4)])]).