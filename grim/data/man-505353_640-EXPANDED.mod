model([d1,d2,d3,d4,d5,d6,n1,n2],
	[f(1,n_man_1,[d1]),
	 f(1,n_adult_1,[d1]),
	 f(1,n_male_2,[d1]),
	 f(1,n_person_1,[d1]),
	 f(1,n_causal_agent_1,[d1]),
	 f(1,n_organism_1,[d1]),
	 f(1,n_living_thing_1,[d1]),
	 f(1,n_beard_1,[n1]),
	 f(1,n_facial_hair_1,[n1]),
	 f(1,n_hair_1,[n1]),
	 f(1,n_body_covering_1,[n1]),
	 f(1,n_covering_1,[n1]),
	 f(1,n_natural_object_1,[n1]),
	 f(1,n_hand_1,[n2]),
	 f(1,n_extremity_5,[n2]),
	 f(1,n_external_body_part_1,[n2]),
	 f(1,n_body_part_1,[n2]),
	 f(1,n_part_3,[n2]),
	 f(1,n_thing_12,[n2]),
	 f(1,n_pencil_1,[d2]),
	 f(1,n_writing_implement_1,[d2]),
	 f(1,n_implement_1,[d2]),
	 f(1,n_instrumentality_3,[d2]),
	 f(1,n_painting_1,[d3,d4]),
	 f(1,n_graphic_art_1,[d3,d4]),
	 f(1,n_art_1,[d3,d4]),
	 f(1,n_book_1,[d5]),
	 f(1,n_publication_1,[d5]),
	 f(1,n_work_2,[d5]),
	 f(1,n_product_2,[d5]),
	 f(1,n_creation_2,[d3,d4,d5]),
	 f(1,n_room_1,[d6]),
	 f(1,n_area_5,[d6]),
	 f(1,n_structure_1,[d6]),
	 f(1,n_artifact_1,[d2,d3,d4,d5,d6]),
	 f(1,n_whole_2,[d1,d2,d3,d4,d5,d6,n1]),
	 f(1,n_object_1,[d1,d2,d3,d4,d5,d6,n1]),
	 f(1,n_physical_entity_1,[d1,d2,d3,d4,d5,d6,n1,n2]),
	 f(1,n_entity_1,[d1,d2,d3,d4,d5,d6,n1,n2]),
	 f(2,s_touches,[(n2,d2),(d2,n2)]),
	 f(2,s_supports,[(d3,n2)]),
	 f(2,s_part_of,[(n2,d1),(n1,d1)]),
	 f(2,s_near,[(d5,d3),(d3,d5),(n2,d5),(d5,n2)])]).