## code to prepare `hutch_palette` dataset goes here
library(palettes)

hutch_palette <- pal_palette(
  hutch_colors = c("#1B365D", "#00C1D5", "#AA4AC4", "#FFB500",
                   "#0A799A", "#F4F4F4",  "#FFFFFF")
)

usethis::use_data(hutch_palette, overwrite = TRUE)
