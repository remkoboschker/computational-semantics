model([d1,d2,d3,d4,d5,d6,d7],
      [f(1,n_pelican_1,[d1,d2,d3,d4]),
       f(1,n_boat_1,[d5]),
       f(1,n_buoy_1,[d6]),
       f(1,n_water_1,[d7]),
       f(2,s_near,[(d3,d4)]),
       f(1,a_blue_1,[d5,d7]),
       f(1,a_grey_1,[d1,d2,d3,d4]),
       f(2,s_touches,[(d1,d5),(d2,d5),(d3,d5),(d4,d5),(d5,d7),(d6,d7)])
      ]).
