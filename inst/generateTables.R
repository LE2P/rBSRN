A3_quantities <- c(
  "global 2 (pyranometer)" =	2,
  "direct" =	3,
  "diffuse sky" =	4,
  "long-wave downward" =	5,
  "air temperature" =	21,
  "relative humidity" =	22,
  "pressure" =	23,
  "uv-a-global" =	121,
  "uv-b-direct" =	122,
  "uv-b-global" =	123,
  "uv-b-diffuse" =	124,
  "uv-b-reflected" =	125,
  "short-wave reflected" =	131,
  "long-wave upward" =	132,
  "net radiation (net radiometer)" =	141,
  "global 2 (pyranometer)" =	2000700,
  "short-wave reflected" =	131000700,
  "long-wave upward" =	132000700,
  "long-wave downward" =	5000700,
  "air temperature" =	21000700,
  "relative humidity" =	22000700,
  "short-wave reflected" =	131003000,
  "short-wave spec. bd. 1" =	104,
  "short-wave spec. bd. 1" =	104,
  "short-wave spec. bd. 3" =	112,
  "total cloud amount with instrument" =	301,
  "cloud base height with instrument" =	302,
  "cloud liquid water" =	303
)

save(A3_quantities, file = './data/A3_quantities.rda')

A4_surfaces <- c(
  'glacier - accumulation area' = 1,
  'glacier - ablation area' = 2,
  'iceshelf' = 3,
  'sea ice' = 4,
  'water - river' = 5,
  'water - lake' = 6,
  'water - ocean' = 7,
  'desert - rock' = 8,
  'desert - sand' = 9,
  'desert - gravel' = 10,
  'concrete' = 11,
  'asphalt' = 12,
  'cultivated' = 13,
  'tundra' = 14,
  'grass' = 15,
  'shrub' = 16,
  'forest - evergreen' = 17,
  'forest - deciduous' = 18,
  'forest - mixed' = 19,
  'rock' = 20,
  'sand' = 21
)

save(A4_surfaces, file = './data/A4_surfaces.rda')

A5_topographies <- c(
  'flat - urban' = 1,
  'flat - rural' = 2,
  'hilly - urban' = 3,
  'hilly - rural' = 4,
  'mountain top - urban' = 5,
  'mountain top - rural' = 6,
  'mountain valley - urban' = 7,
  'mountain valley - rural' = 8
)

save(A5_topographies, file = './data/A5_topographies.rda')

A6_pyrgeometers <- c(
  'Manufacturer & battery circuit'= 1,
  'Corrected manufacturer & battery circuit' = 2,
  'Temperature measurement with sigma Tc^4' = 3,
  'Other' = 4
)

save(A6_pyrgeometers, file = './data/A6_pyrgeometers.rda')

A7_pyrgeometers <- c(
  'Dome shaded' = 1,
  'Instrument ventilated' = 2,
  'Temperature measurement with sigma Tc^4' = 3,
  'Shaded & ventilated' = 4,
  'Shaded & sigma Tc^4' = 5,
  'Ventilated & sigma Tc^4' = 6,
  'Shaded & ventilated & sigma Tc^4' = 7,
  'Other' = 8
)

save(A7_pyrgeometers, file = './data/A7_pyrgeometers.rda')

