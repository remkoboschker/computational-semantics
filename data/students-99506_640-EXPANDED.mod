model([d1,d2,d3,d4,d5,c1,c2,c3,c4,c5,t1,p1,p2],
	[f(1,n_student_1,[d1,d2,d3,d4,d5]),
	 f(1,n_enrollee_1,[d1,d2,d3,d4,d5]),
	 f(1,n_person_1,[d1,d2,d3,d4,d5]),
	 f(1,n_causal_agent_1,[d1,d2,d3,d4,d5]),
	 f(1,n_organism_1,[d1,d2,d3,d4,d5]),
	 f(1,n_living_thing_1,[d1,d2,d3,d4,d5]),
	 f(1,n_computer_1,[c1,c2,c3,c4,c5]),
	 f(1,n_machine_1,[c1,c2,c3,c4,c5]),
	 f(1,n_device_1,[c1,c2,c3,c4,c5]),
	 f(1,n_table_2,[t1]),
	 f(1,n_furniture_1,[t1]),
	 f(1,n_furnishing_2,[t1]),
	 f(1,n_instrumentality_3,[c1,c2,c3,c4,c5,t1]),
	 f(1,n_painting_1,[p1,p2]),
	 f(1,n_graphic_art_1,[p1,p2]),
	 f(1,n_art_1,[p1,p2]),
	 f(1,n_creation_2,[p1,p2]),
	 f(1,n_artifact_1,[c1,c2,c3,c4,c5,p1,p2,t1]),
	 f(1,n_whole_2,[c1,c2,c3,c4,c5,d1,d2,d3,d4,d5,p1,p2,t1]),
	 f(1,n_object_1,[c1,c2,c3,c4,c5,d1,d2,d3,d4,d5,p1,p2,t1]),
	 f(1,n_physical_entity_1,[c1,c2,c3,c4,c5,d1,d2,d3,d4,d5,p1,p2,t1]),
	 f(1,n_entity_1,[c1,c2,c3,c4,c5,d1,d2,d3,d4,d5,p1,p2,t1]),
	 f(1,a_grey_4,[d1]),
	 f(1,a_blue_1,[d2]),
	 f(1,a_yellow_1,[d3]),
	 f(1,a_green_1,[d4]),
	 f(1,a_white_2,[t1]),
	 f(1,a_black_1,[c1,c2,c3,c4,c5]),
	 f(1,a_colorful_1,[p1,p2]),
	 f(2,s_near,[(d1,c1),(c1,d1),(d2,c2),(c2,d2),(d3,c3),(c3,d3),(d4,c4),(c4,d4),(d5,c5),(c5,d5),(d1,d2),(c1,c2),(d2,d3),(c2,c3),(d3,d4),(c3,c4),(d4,d5),(c4,c5)]),
	 f(2,s_supports,[(t1,c1),(t1,c2),(t1,c3),(t1,c4),(t1,c5)]),
	 f(2,s_touches,[(t1,c1),(t1,c2),(t1,c3),(t1,c4),(t1,c5),(c1,t1),(c2,t1),(c3,t1),(c4,t1),(c5,t1)])]).