model([d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12],
	[f(1,n_boy_1,[d1]),
	 f(1,n_male_2,[d1]),
	 f(1,n_person_1,[d1]),
	 f(1,n_causal_agent_1,[d1]),
	 f(1,n_shorts_1,[d2]),
	 f(1,n_trouser_1,[d2]),
	 f(1,n_shirt_1,[d3]),
	 f(1,n_garment_1,[d2,d3]),
	 f(1,n_clothing_1,[d2,d3]),
	 f(1,n_consumer_goods_1,[d2,d3]),
	 f(1,n_covering_2,[d2,d3]),
	 f(1,n_commodity_1,[d2,d3]),
	 f(1,a_blue_1,[d2]),
	 f(1,a_striped_1,[d3]),
	 f(1,n_pigeon_1,[d3,d4,d5,d6,d7,d8,d9,d10,d11]),
	 f(1,n_columbiform_bird_1,[d3,d4,d5,d6,d7,d8,d9,d10,d11]),
	 f(1,n_gallinaceous_bird_1,[d3,d4,d5,d6,d7,d8,d9,d10,d11]),
	 f(1,n_bird_1,[d3,d4,d5,d6,d7,d8,d9,d10,d11]),
	 f(1,n_vertebrate_1,[d3,d4,d5,d6,d7,d8,d9,d10,d11]),
	 f(1,n_chordate_1,[d3,d4,d5,d6,d7,d8,d9,d10,d11]),
	 f(1,n_animal_1,[d3,d4,d5,d6,d7,d8,d9,d10,d11]),
	 f(1,n_organism_1,[d1,d3,d4,d5,d6,d7,d8,d9,d10,d11]),
	 f(1,n_living_thing_1,[d1,d3,d4,d5,d6,d7,d8,d9,d10,d11]),
	 f(1,n_street_1,[d12]),
	 f(1,n_thoroughfare_1,[d12]),
	 f(1,n_road_1,[d12]),
	 f(1,n_way_6,[d12]),
	 f(1,n_artifact_1,[d2,d3,d12]),
	 f(1,n_whole_2,[d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12]),
	 f(1,n_object_1,[d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12]),
	 f(1,n_physical_entity_1,[d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12]),
	 f(1,n_entity_1,[d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12]),
	 f(2,s_touches,[(d1,d2),(d2,d1),(d1,d3),(d3,d1),(d2,d3),(d3,d2),(d1,d12),(d12,d1),(d3,d12),(d12,d3),(d4,d12),(d12,d4),(d5,d12),(d12,d5),(d6,d12),(d12,d6),(d7,d12),(d12,d7),(d8,d12),(d12,d8),(d9,d12),(d12,d9)]),
	 f(2,s_supports,[(d1,d2),(d1,d3),(d12,d1),(d12,d3),(d12,d4),(d12,d5),(d12,d6),(d12,d7),(d12,d8),(d12,d9)]),
	 f(2,s_near,[(d2,d1),(d3,d1),(d7,d1),(d6,d1),(d5,d1),(d8,d1),(d11,d1),(d1,d2),(d3,d2),(d1,d3),(d2,d3),(d5,d6),(d6,d5)])]).