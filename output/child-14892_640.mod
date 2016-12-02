model([c1,s1,b1,n1,n2],
	[f(1,n_child_1,[c1]),
	 f(1,n_juvenile_1,[c1]),
	 f(1,n_person_1,[c1]),
	 f(1,n_causal_agent_1,[c1]),
	 f(1,n_sidewalk_1,[s1]),
	 f(1,n_walk_5,[s1]),
	 f(1,n_path_2,[s1]),
	 f(1,n_way_6,[s1]),
	 f(1,n_pigeon_1,[b1]),
	 f(1,n_columbiform_bird_1,[b1]),
	 f(1,n_gallinaceous_bird_1,[b1]),
	 f(1,n_bird_1,[b1]),
	 f(1,n_vertebrate_1,[b1]),
	 f(1,n_chordate_1,[b1]),
	 f(1,n_animal_1,[b1]),
	 f(1,n_organism_1,[b1,c1]),
	 f(1,n_living_thing_1,[b1,c1]),
	 f(1,n_hat_1,[n1]),
	 f(1,n_headdress_1,[n1]),
	 f(1,n_clothing_1,[n1]),
	 f(1,n_consumer_goods_1,[n1]),
	 f(1,n_covering_2,[n1]),
	 f(1,n_commodity_1,[n1]),
	 f(1,n_artifact_1,[n1,s1]),
	 f(1,n_whole_2,[b1,c1,n1,s1]),
	 f(1,n_object_1,[b1,c1,n1,s1]),
	 f(1,n_head_1,[n2]),
	 f(1,n_external_body_part_1,[n2]),
	 f(1,n_body_part_1,[n2]),
	 f(1,n_part_3,[n2]),
	 f(1,n_thing_12,[n2]),
	 f(1,n_physical_entity_1,[b1,c1,n1,n2,s1]),
	 f(1,n_entity_1,[b1,c1,n1,n2,s1]),
	 f(2,s_part_of,[(n2,c1)]),
	 f(2,s_touches,[(c1,n1),(c1,s1),(n1,n2)]),
	 f(2,s_supports,[(c1,n1),(s1,c1)]),
	 f(2,s_occludes,[(b1,s1),(c1,s1),(n1,c1),(n1,s1)])],
	[g(b1,[2,149,171,96]),
	 g(c1,[410,33,213,354]),
	 g(n1,[445,33,97,57]),
	 g(n2,[447,35,104,72]),
	 g(s1,[2,15,636,401])]).