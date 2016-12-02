model([d1,d2,d3,n1,n2,n3],
	[f(1,n_cat_1,[d1,d2]),
	 f(1,n_feline_1,[d1,d2]),
	 f(1,n_carnivore_1,[d1,d2]),
	 f(1,n_placental_1,[d1,d2]),
	 f(1,n_mammal_1,[d1,d2]),
	 f(1,n_vertebrate_1,[d1,d2]),
	 f(1,n_chordate_1,[d1,d2]),
	 f(1,n_animal_1,[d1,d2]),
	 f(1,n_organism_1,[d1,d2]),
	 f(1,n_living_thing_1,[d1,d2]),
	 f(1,n_whole_2,[d1,d2]),
	 f(1,n_lawn_1,[d3]),
	 f(1,n_field_1,[d3]),
	 f(1,n_tract_1,[d3]),
	 f(1,n_geographical_area_1,[d3]),
	 f(1,n_region_3,[d3]),
	 f(1,n_location_1,[d3]),
	 f(1,n_object_1,[d1,d2,d3]),
	 f(1,a_black_1,[d1,d2]),
	 f(1,a_green_1,[d3]),
	 f(1,n_head_1,[n1,n2]),
	 f(1,n_external_body_part_1,[n1,n2]),
	 f(1,n_tail_1,[n3]),
	 f(1,n_process_5,[n3]),
	 f(1,n_body_part_1,[n1,n2,n3]),
	 f(1,n_part_3,[n1,n2,n3]),
	 f(1,n_thing_12,[n1,n2,n3]),
	 f(1,n_physical_entity_1,[d1,d2,d3,n1,n2,n3]),
	 f(1,n_entity_1,[d1,d2,d3,n1,n2,n3]),
	 f(2,s_part_of,[(n1,d1),(n2,d2),(n3,d2)]),
	 f(2,s_touches,[(d1,d3),(d2,d3)]),
	 f(2,s_supports,[(d3,d1),(d3,d2)]),
	 f(2,s_occludes,[(d1,d3),(d2,d3),(d3,d1),(d3,d2)])],
	[g(d1,[0,75,160,184]),
	 g(d2,[320,9,313,398]),
	 g(d3,[3,24,635,394]),
	 g(n1,[62,78,96,112]),
	 g(n2,[334,26,177,210]),
	 g(n3,[526,9,92,133])]).