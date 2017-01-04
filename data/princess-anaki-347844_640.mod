model([d1,d2,n1],
	[f(1,n_cat_1,[d1]),
	 f(1,n_feline_1,[d1]),
	 f(1,n_carnivore_1,[d1]),
	 f(1,n_placental_1,[d1]),
	 f(1,n_mammal_1,[d1]),
	 f(1,n_vertebrate_1,[d1]),
	 f(1,n_chordate_1,[d1]),
	 f(1,n_animal_1,[d1]),
	 f(1,n_organism_1,[d1]),
	 f(1,n_living_thing_1,[d1]),
	 f(1,n_chair_1,[d2]),
	 f(1,n_seat_3,[d2]),
	 f(1,n_furniture_1,[d2]),
	 f(1,n_furnishing_2,[d2]),
	 f(1,n_instrumentality_3,[d2]),
	 f(1,n_artifact_1,[d2]),
	 f(1,n_whole_2,[d1,d2]),
	 f(1,n_object_1,[d1,d2]),
	 f(1,a_gray_1,[d1]),
	 f(1,a_brown_1,[d2]),
	 f(1,n_head_1,[n1]),
	 f(1,n_external_body_part_1,[n1]),
	 f(1,n_body_part_1,[n1]),
	 f(1,n_part_3,[n1]),
	 f(1,n_thing_12,[n1]),
	 f(1,n_physical_entity_1,[d1,d2,n1]),
	 f(1,n_entity_1,[d1,d2,n1]),
	 f(2,s_touches,[ (d1,d2), (d2,d1)]),
	 f(2,s_part_of,[ (n1,d1)]),
	 f(2,s_supports,[ (d2,d1)]),
	 f(2,s_occludes,[ (d1,d2)])],
	[g(d1,[10,169,338,354]),
	 g(d2,[1,1,330,636]),
	 g(n1,[142,170,151,171])]).