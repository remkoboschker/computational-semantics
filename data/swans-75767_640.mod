model([d1,d2,d3,d4,p1,p2,w1],
      [f(1,n_black_swan_1,[d1,d2,d3,d4]),
       f(1,n_plant_2,[p1,p2]),
       f(1,n_lake_1,[w1]),
       f(1,a_black_1,[d1,d2,d3]),
       f(1,a_grey_1,[d4]),
       f(1,a_green_1,[p1,p2,w1]),
       f(2,s_supports,[(w1,d1),(w1,d2),(w1,d3),(w1,d4),(w1,p1),(w1,p2)]),
       f(2,s_touches,[(d1,w1),(d2,w1),(d3,w1),(d4,w1),(p1,w1),(p2,w1),(w1,d1),(w1,d2),(w1,d3),(w1,d4),(w1,p1),(w1,p2)]),
       f(2,s_near,[(d4,d3),(d3,d4),(p1,p2),(p2,p1)])]). 
