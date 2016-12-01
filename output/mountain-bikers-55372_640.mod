model([d1,d2,d3,d4,n1,n2,n3],
	[f(1,n_man_1,[d1]),
	 f(1,n_male_2,[d1]),
	 f(1,n_bicycle_1,[d2]),
	 f(1,n_forest_2,[d3]),
	 f(1,n_biome_1,[d3]),
	 f(1,n_land_4,[d3]),
	 f(1,n_community_6,[d3]),
	 f(1,n_mountain_1,[d4]),
	 f(1,n_natural_elevation_1,[d4]),
	 f(1,n_geological_formation_1,[d4]),
	 f(1,n_wheel_1,[n1]),
	 f(1,n_machine_4,[n1]),
	 f(1,n_mechanical_device_1,[n1]),
	 f(1,n_helmet_2,[n2]),
	 f(1,n_head_1,[n3]),
	 f(1,n_headdress_1,[n2]),
	 f(1,n_clothing_1,[n2]),
	 f(1,n_consumer_goods_1,[n2]),
	 f(1,n_covering_2,[n2]),
	 f(1,n_commodity_1,[n2]),
	 f(1,n_group_1,[d3]),
	 f(1,n_abstraction_6,[d3]),
	 f(1,n_mechanism_5,[n1]),
	 f(1,n_adult_1,[d1]),
	 f(1,n_person_1,[d1]),
	 f(1,n_causal_agent_1,[d1]),
	 f(1,n_organism_1,[d1]),
	 f(1,n_living_thing_1,[d1]),
	 f(1,n_wheeled_vehicle_1,[d2]),
	 f(1,n_container_1,[d2]),
	 f(1,n_vehicle_1,[d2]),
	 f(1,n_conveyance_3,[d2]),
	 f(1,n_external_body_part_1,[n3]),
	 f(1,n_body_part_1,[n3]),
	 f(1,n_part_3,[n3]),
	 f(1,n_thing_12,[n3]),
	 f(1,n_device_1,[n1]),
	 f(1,n_instrumentality_3,[d2,n1]),
	 f(1,n_artifact_1,[d2,n1,n2]),
	 f(1,n_whole_2,[d1,d2,n1,n2]),
	 f(1,n_object_1,[d1,d2,d3,d4,n1,n2]),
	 f(1,n_physical_entity_1,[d1,d2,d3,d4,n1,n2,n3]),
	 f(1,n_entity_1,[d1,d2,d3,d4,n1,n2,n3]),
	 f(2,s_part_of,[(n1,d2),(n3,d1)]),
	 f(2,s_touches,[(d1,d2),(d1,n2),(n2,n3)]),
	 f(2,s_supports,[(d1,n2),(d2,d1)]),
	 f(2,s_occludes,[(d1,d2),(d1,d4),(d2,d1),(n2,d1),(n2,d4)])],
	[g(d1,[66,85,141,368]),
	 g(d2,[80,241,121,223]),
	 g(d3,[276,195,362,203]),
	 g(d4,[1,33,636,182]),
	 g(n1,[129,323,70,139]),
	 g(n2,[103,87,47,25]),
	 g(n3,[102,100,45,38])]).