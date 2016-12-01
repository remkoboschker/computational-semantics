model([c1,c2,c3,b1,r1,f1,l1,bp1,n1,n2],
      [f(1,n_child_1,[c1,c2,c3]),
       f(1,n_bicycle_1,[b1]),
       f(1,n_backpack_1,[bp1]),
       f(1,n_road_1,[r1]),
       f(1,n_forest_2,[f1]),
       f(1,n_laundry_1,[l1]),
       f(1,n_male_2,[c1,c2,c3]),
       f(1,a_red_1,[b1]),
       f(1,a_green_1,[f1]),
       f(1,n_wheel_1,[n1,n2]),
       f(2,s_part_of,[(n1,b1),(n2,b1)]),
       f(2,s_touches,[(b1,r1),(bp1,c1),(c1,b1),(c2,b1),(c2,c1),(c2,r1),(c3,b1),(c3,c2),(c3,r1),(f1,l1),(r1,n1),(r1,n2)]),
       f(2,s_supports,[(b1,c1),(b1,c2),(b1,c3),(c1,bp1),(f1,l1),(r1,b1),(r1,c2),(r1,c3)]),
       f(2,s_occludes,[(b1,r1),(bp1,f1),(bp1,r1),(c1,b1),(c1,bp1),(c1,c2),(c1,f1),(c1,r1),(c2,b1),(c2,c1),(c2,c3),(c2,f1),(c2,r1),(c3,b1),(c3,c2),(c3,f1),(c3,l1),(c3,r1),(l1,f1)]),
       f(1,n_object_1,[b1,bp1,l1,n1,n2,r1]),
       f(1,n_container_1,[b1,bp1]),
       f(1,n_artifact_1,[b1,bp1,l1,n1,n2,r1]),
       f(1,n_bag_1,[bp1]),
       f(1,n_whole_2,[b1,bp1,l1,n1,n2,r1]),
       f(1,n_way_6,[r1]),
       f(1,n_physical_entity_1,[b1,bp1,c1,c2,c3,l1,n1,n2,r1]),
       f(1,n_person_1,[c1,c2,c3]),
       f(1,n_clothing_1,[l1]),
       f(1,n_mechanism_5,[n1,n2]),
       f(1,n_group_1,[f1]),
       f(1,n_device_1,[n1,n2]),
       f(1,n_wheeled_vehicle_1,[b1]),
       f(1,n_instrumentality_3,[b1,bp1,n1,n2]),
       f(1,n_entity_1,[b1,bp1,c1,c2,c3,f1,l1,n1,n2,r1])],
      [g(b1,[153,155,428,309]),
       g(bp1,[143,136,51,102]),
       g(c1,[185,51,67,295]),
       g(c2,[230,44,105,374]),
       g(c3,[275,32,146,333]),
       g(f1,[2,2,635,156]),
       g(l1,[402,97,142,57]),
       g(n1,[176,233,132,153]),
       g(n2,[395,267,184,196]),
       g(r1,[1,167,635,308])]). 