model([d1,d2,d3,n1,n2,n3],
	[f(1,n_child_1,[d1,d2]),
	 f(1,n_juvenile_1,[d1,d2]),
	 f(1,n_cat_1,[d3]),
	 f(1,n_feline_1,[d3]),
	 f(1,n_head_1,[n1,n2,n3]),
	 f(1,n_external_body_part_1,[n1,n2,n3]),
	 f(1,n_person_1,[d1,d2]),
	 f(1,n_causal_agent_1,[d1,d2]),
	 f(1,n_carnivore_1,[d3]),
	 f(1,n_placental_1,[d3]),
	 f(1,n_mammal_1,[d3]),
	 f(1,n_body_part_1,[n1,n2,n3]),
	 f(1,n_part_3,[n1,n2,n3]),
	 f(1,n_thing_12,[n1,n2,n3]),
	 f(1,n_vertebrate_1,[d3]),
	 f(1,n_chordate_1,[d3]),
	 f(1,n_animal_1,[d3]),
	 f(1,n_organism_1,[d1,d2,d3]),
	 f(1,n_living_thing_1,[d1,d2,d3]),
	 f(1,n_whole_2,[d1,d2,d3]),
	 f(1,n_object_1,[d1,d2,d3]),
	 f(1,n_physical_entity_1,[d1,d2,d3,n1,n2,n3]),
	 f(1,n_entity_1,[d1,d2,d3,n1,n2,n3]),
	 f(2,s_part_of,[(n1,d1),(n2,d2),(n3,d3)]),
	 f(2,s_touches,[(d1,d3),(d1,n3)]),
	 f(2,s_occludes,[(d2,d1),(d3,d1)])],
	[g(d1,[4,95,365,233]),
	 g(d2,[367,39,271,336]),
	 g(d3,[2,293,382,132]),
	 g(n1,[98,102,97,132]),
	 g(n2,[452,42,103,124]),
	 g(n3,[6,296,65,75])]).