model([d1,d2,d3,n1,n2],
	[f(1,n_bicycle_1,[d1]),
	 f(1,n_man_1,[d2]),
	 f(1,n_male_2,[d2]),
	 f(1,n_lawn_1,[d3]),
	 f(1,n_field_1,[d3]),
	 f(1,n_tract_1,[d3]),
	 f(1,n_geographical_area_1,[d3]),
	 f(1,n_region_3,[d3]),
	 f(1,n_wheel_1,[n1,n2]),
	 f(1,n_machine_4,[n1,n2]),
	 f(1,n_mechanical_device_1,[n1,n2]),
	 f(1,n_mechanism_5,[n1,n2]),
	 f(1,n_device_1,[n1,n2]),
	 f(1,n_adult_1,[d2]),
	 f(1,n_person_1,[d2]),
	 f(1,n_causal_agent_1,[d2]),
	 f(1,n_organism_1,[d2]),
	 f(1,n_living_thing_1,[d2]),
	 f(1,n_wheeled_vehicle_1,[d1]),
	 f(1,n_container_1,[d1]),
	 f(1,n_vehicle_1,[d1]),
	 f(1,n_conveyance_3,[d1]),
	 f(1,n_location_1,[d3]),
	 f(1,n_instrumentality_3,[d1,n1,n2]),
	 f(1,n_artifact_1,[d1,n1,n2]),
	 f(1,n_whole_2,[d1,d2,n1,n2]),
	 f(1,n_object_1,[d1,d2,d3,n1,n2]),
	 f(1,n_physical_entity_1,[d1,d2,d3,n1,n2]),
	 f(1,n_entity_1,[d1,d2,d3,n1,n2]),
	 f(2,s_part_of,[(n1,d1),(n2,d1)]),
	 f(2,s_touches,[(d1,d3),(d2,d3)]),
	 f(2,s_supports,[(d3,d1),(d3,d2)]),
	 f(2,s_occludes,[(d1,d2),(d1,d3),(d2,d3)])],
	[g(d1,[28,19,338,276]),
	 g(d2,[193,157,399,153]),
	 g(d3,[1,7,636,353]),
	 g(n1,[30,21,125,167]),
	 g(n2,[234,86,131,173])]).