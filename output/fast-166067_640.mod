model([d1,d2,d3,d4,n1,n2,n3],
	[f(1,n_child_1,[d1]),
	 f(1,n_juvenile_1,[d1]),
	 f(1,n_bicycle_1,[d2]),
	 f(1,n_road_1,[d3]),
	 f(1,n_wall_7,[d4]),
	 f(1,a_green_1,[d2]),
	 f(1,a_beige_1,[d4]),
	 f(1,a_gray_1,[d3]),
	 f(1,a_brown_1,[d1]),
	 f(1,n_wheel_1,[n1,n2]),
	 f(1,n_machine_4,[n1,n2]),
	 f(1,n_mechanical_device_1,[n1,n2]),
	 f(1,n_head_1,[n3]),
	 f(1,n_way_6,[d3]),
	 f(1,n_person_1,[d1]),
	 f(1,n_causal_agent_1,[d1]),
	 f(1,n_organism_1,[d1]),
	 f(1,n_living_thing_1,[d1]),
	 f(1,n_fence_1,[d4]),
	 f(1,n_barrier_1,[d4]),
	 f(1,n_obstruction_1,[d4]),
	 f(1,n_structure_1,[d4]),
	 f(1,n_mechanism_5,[n1,n2]),
	 f(1,n_device_1,[n1,n2]),
	 f(1,n_wheeled_vehicle_1,[d2]),
	 f(1,n_container_1,[d2]),
	 f(1,n_vehicle_1,[d2]),
	 f(1,n_conveyance_3,[d2]),
	 f(1,n_instrumentality_3,[d2,n1,n2]),
	 f(1,n_artifact_1,[d2,d3,d4,n1,n2]),
	 f(1,n_whole_2,[d1,d2,d3,d4,n1,n2]),
	 f(1,n_object_1,[d1,d2,d3,d4,n1,n2]),
	 f(1,n_external_body_part_1,[n3]),
	 f(1,n_body_part_1,[n3]),
	 f(1,n_part_3,[n3]),
	 f(1,n_thing_12,[n3]),
	 f(1,n_physical_entity_1,[d1,d2,d3,d4,n1,n2,n3]),
	 f(1,n_entity_1,[d1,d2,d3,d4,n1,n2,n3]),
	 f(2,s_part_of,[(n1,d2),(n2,d2),(n3,d1)]),
	 f(2,s_touches,[(d1,d2),(d2,d3),(d3,d4),(d3,n1),(d3,n2)]),
	 f(2,s_supports,[(d2,d1),(d3,d2)]),
	 f(2,s_occludes,[(d1,d2),(d1,d3),(d1,d4),(d2,d1),(d2,d3),(d2,d4)])],
	[g(d1,[220,42,163,312]),
	 g(d2,[139,176,312,228]),
	 g(d3,[3,337,634,86]),
	 g(d4,[1,18,634,367]),
	 g(n1,[141,237,114,143]),
	 g(n2,[317,254,134,150]),
	 g(n3,[329,44,45,54])]).