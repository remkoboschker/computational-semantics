model([d1,d2,d3,d4,d5,d6,d7,d8],
      [f(1,n_man_1,[d1]),
       f(1,n_woman_1,[d2]),
       f(1,n_bench_1,[d3]),
       f(1,n_chair_1,[d4,d5]),
       f(1,n_table_2,[d6]),
       f(1,n_lamp_2,[d7]),
       f(1,n_garden_1,[d8]),
       f(1,a_wood_1,[d3,d4,d5,d6]),
       f(1,a_metal_1,[d6,d7]),
       f(1,a_old_1,[d1,d2]),
       f(2,s_touches,[(d1,d2),(d2,d1),(d1,d3),(d3,d1),(d2,d3),(d3,d2)]),
       f(2,s_supports,[(d3,d1),(d3,d2)]),
       f(2,s_near,[(d1,d4),(d4,d1),(d1,d6),(d6,d1)])]). 
