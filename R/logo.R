#' Add Fred Hutch DaSL logo
#'
#' Logo placed at the bottom right corner of a ggplot
#'
#' @param x_unit Numeric value indicating the amount of horizontal shifting.
#'   Higher values shift towards the right, lower values shift towards the left
#' @param y_unit Numeric value indicating the amount of vertical shifting.
#'   Greater values result in downward shifting, smaller values result in an
#'   upward shifting.
#' @param height_unit Numeric value specifying width
#' @param width_unit Numeric value specifying width
#'
#' @return A list with ggplot2 components : `annotation_custom()`,
#'   `coord_cartesian()`, `theme()`)
#' @export
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#'
#' ggplot(diamonds[sample(nrow(diamonds), 1000), ], aes(carat, price)) +
#' geom_point(aes(colour = color)) +
#' scale_colour_palette_d(hutch_palette) +
#' dasl_logo(x_unit = 25, y_unit = 10)
#' }
dasl_logo <- function(x_unit = 25, y_unit = 20,
                      height_unit = 12, width_unit = NULL) {
  # Borrowed from
  # https://www.markhw.com/blog/logos
  # https://stackoverflow.com/q/76354700/14804653
  list(
    ggplot2::annotation_custom(render_png(system.file("logo", "dasl-logo.png", package = "hutchplot"),
                                          x_unit, y_unit,
                                          height_unit, width_unit)),
    ggplot2::coord_cartesian(clip = "off"),
    ggplot2::theme(plot.margin = grid::unit(c(1, 1, 1.5, 1), "lines"))
  )
}


# Render raster object
render_png <- function(file_name,
                       x_unit = NULL, y_unit = NULL,
                       height_unit = NULL, width_unit = NULL) {
  grid::rasterGrob(png::readPNG(file_name),
                   interpolate = TRUE,
                   # Position grob on right border of plot area and
                   # shift image in x direction
                   x = grid::unit(1, "npc") + grid::unit(x_unit, "pt"),
                   # Position grob on bottom border of plot area and
                   # shift image in y direction
                   y = grid::unit(0, "npc") - grid::unit(y_unit, "pt"),
                   # Adjust image size
                   height = grid::unit(height_unit, "pt"),
                   width = NULL,
                   hjust = 1,
                   vjust = 1
  )
}
