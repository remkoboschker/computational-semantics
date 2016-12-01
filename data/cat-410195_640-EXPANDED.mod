model([d1,d2,d3,n1],
	[f(1,n_cat_1,[d1,d2]),
	 f(1,n_feline_1,[d1,d2]),
	 f(1,n_chair_1,[d3]),
	 f(1,a_red_1,[d3]),
	 f(1,a_black_1,[d1]),
	 f(1,a_beige_1,[d2]),
	 f(1,n_throw_4,[n1]),
	 f(1,n_bedclothes_1,[n1]),
	 f(1,n_cloth_covering_1,[n1]),
	 f(1,n_seat_3,[d3]),
	 f(1,n_covering_2,[n1]),
	 f(1,n_furniture_1,[d3]),
	 f(1,n_furnishing_2,[d3]),
	 f(1,n_carnivore_1,[d1,d2]),
	 f(1,n_placental_1,[d1,d2]),
	 f(1,n_mammal_1,[d1,d2]),
	 f(1,n_instrumentality_3,[d3]),
	 f(1,n_artifact_1,[d3,n1]),
	 f(1,n_vertebrate_1,[d1,d2]),
	 f(1,n_chordate_1,[d1,d2]),
	 f(1,n_animal_1,[d1,d2]),
	 f(1,n_organism_1,[d1,d2]),
	 f(1,n_living_thing_1,[d1,d2]),
	 f(1,n_whole_2,[d1,d2,d3,n1]),
	 f(1,n_object_1,[d1,d2,d3,n1]),
	 f(1,n_physical_entity_1,[d1,d2,d3,n1]),
	 f(1,n_entity_1,[d1,d2,d3,n1]),
	 f(2,s_touches,[(d1,d2),(d1,d3),(d1,n1),(d2,d3),(d2,n1),(d3,n1)]),
	 f(2,s_supports,[(d3,d1),(d3,d2),(d3,n1),(n1,d1),(n1,d2)]),
	 f(2,s_occludes,[(d1,d2),(d1,d3),(d1,n1),(d2,d3),(d2,n1),(n1,d1),(n1,d3)])],
	[g(d1,[18,84,341,325]),
	 g(d2,[340,59,251,339]),
	 g(d3,[2,-1,491,283]),
	 g(n1,[3,266,636,212])]).