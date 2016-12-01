model([c1,p1,r1,n1,n2,n3,n4,n5],
	[f(1,n_rock_1,[r1]),
	 f(1,n_cat_1,[c1]),
	 f(1,n_feline_1,[c1]),
	 f(1,n_person_1,[p1]),
	 f(1,n_causal_agent_1,[p1]),
	 f(1,n_leg_1,[n1,n2]),
	 f(1,n_hand_1,[n3,n4]),
	 f(1,n_extremity_5,[n3,n4]),
	 f(1,n_head_1,[n5]),
	 f(1,n_natural_object_1,[r1]),
	 f(1,n_carnivore_1,[c1]),
	 f(1,n_placental_1,[c1]),
	 f(1,n_mammal_1,[c1]),
	 f(1,n_limb_1,[n1,n2]),
	 f(1,n_extremity_1,[n1,n2]),
	 f(1,n_external_body_part_1,[n1,n2,n3,n4,n5]),
	 f(1,n_body_part_1,[n1,n2,n3,n4,n5]),
	 f(1,n_part_3,[n1,n2,n3,n4,n5]),
	 f(1,n_thing_12,[n1,n2,n3,n4,n5]),
	 f(1,n_vertebrate_1,[c1]),
	 f(1,n_chordate_1,[c1]),
	 f(1,n_animal_1,[c1]),
	 f(1,n_organism_1,[c1,p1]),
	 f(1,n_living_thing_1,[c1,p1]),
	 f(1,n_whole_2,[c1,p1,r1]),
	 f(1,n_object_1,[c1,p1,r1]),
	 f(1,n_physical_entity_1,[c1,n1,n2,n3,n4,n5,p1,r1]),
	 f(1,n_entity_1,[c1,n1,n2,n3,n4,n5,p1,r1]),
	 f(2,s_part_of,[(n1,p1),(n2,p1),(n3,p1),(n4,p1),(n5,c1)]),
	 f(2,s_touches,[(c1,n1),(c1,n2),(c1,n3),(c1,n4),(c1,p1),(n1,n2),(n3,n5),(n4,n5),(p1,n5),(r1,n2),(r1,p1)]),
	 f(2,s_supports,[(p1,c1),(r1,p1)]),
	 f(2,s_occludes,[(c1,p1),(p1,r1)])],
	[g(c1,[220,62,198,254]),
	 g(n1,[2,255,252,221]),
	 g(n2,[205,256,336,218]),
	 g(n3,[231,175,40,74]),
	 g(n4,[282,46,166,198]),
	 g(n5,[244,63,173,174]),
	 g(p1,[0,0,571,476]),
	 g(r1,[475,357,158,121])]).