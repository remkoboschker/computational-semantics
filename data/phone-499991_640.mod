model([d1,d2,d3,d4,n1],
	[f(1,n_dial_telephone_1,[d1]),
	 f(1,n_telephone_1,[d1]),
	 f(1,n_electronic_equipment_1,[d1]),
	 f(1,n_equipment_1,[d1]),
	 f(1,n_pen_1,[d2]),
	 f(1,n_writing_implement_1,[d2]),
	 f(1,n_implement_1,[d2]),
	 f(1,n_sheet_2,[d3]),
	 f(1,n_paper_1,[d3]),
	 f(1,n_material_1,[d3]),
	 f(1,n_substance_1,[d3]),
	 f(1,n_matter_3,[d3]),
	 f(1,n_part_1,[d3]),
	 f(1,n_relation_1,[d3]),
	 f(1,n_abstraction_6,[d3]),
	 f(1,n_table_2,[d4]),
	 f(1,n_furniture_1,[d4]),
	 f(1,n_furnishing_2,[d4]),
	 f(1,n_earpiece_1,[n1]),
	 f(1,n_electro-acoustic_transducer_1,[n1]),
	 f(1,n_transducer_1,[n1]),
	 f(1,n_electrical_device_1,[n1]),
	 f(1,n_device_1,[n1]),
	 f(1,n_instrumentality_3,[d1,d2,d4,n1]),
	 f(1,n_artifact_1,[d1,d2,d4,n1]),
	 f(1,n_whole_2,[d1,d2,d4,n1]),
	 f(1,n_object_1,[d1,d2,d4,n1]),
	 f(1,n_physical_entity_1,[d1,d2,d3,d4,n1]),
	 f(1,n_entity_1,[d1,d2,d3,d4,n1]),
	 f(1,a_black_1,[d1,d2]),
	 f(1,a_white_1,[d3]),
	 f(1,a_brown_1,[d4]),
	 f(2,s_touches,[ (d1,d3), (d3,d1), (d2,d3), (d3,d2), (d3,d4), (d4,d3), (d1,d4), (d4,d1)]),
	 f(2,s_near,[ (d1,d2), (d2,d1)]),
	 f(2,s_part_of,[ (n1,d1)]),
	 f(2,s_supports,[ (d4,d1), (d4,d3)])]).