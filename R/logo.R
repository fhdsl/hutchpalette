
#' Add Fred Hutch DaSL logo
#'
#' Logo placed at the bottom right corner of a ggplot
#'
#' @return A list with ggplot2 components : `annotation_custom()`, `coord_cartesian()`, `theme()`)
#' @export
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' ggplot(diamonds[sample(nrow(diamonds), 1000), ], aes(carat, price)) +
#' geom_point(aes(colour = color)) +
#' scale_colour_palette_d(hutch_palette) +
#' dasl_logo()
#' }
dasl_logo <- function() {
  list(
    ggplot2::annotation_custom(render_png(system.file("logo", "dasl-logo.png",
                                             package = "hutchplot"))),
    ggplot2::coord_cartesian(clip = "off"),
    ggplot2::theme(plot.margin = grid::unit(c(1, 1, 1.5, 1), "lines"))
  )
}

# Render raster object
render_png <- function(file_name) {
  grid::rasterGrob(png::readPNG(file_name),
                   interpolate = TRUE,
                   # Position grob on right border of plot area and
                   # shift image in x direction
                   x = grid::unit(1, "npc") + grid::unit(25, "pt"),
                   # Position grob on bottom border of plot area and
                   # shift image in y direction
                   y = grid::unit(0, "npc") - grid::unit(20, "pt"),
                   # Adjust image size
                   height = grid::unit(12, "pt"),
                   hjust = 1,
                   vjust = 1
  )
}
