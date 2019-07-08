config <- utilsR::read_yaml("./config.yaml")

cmp <- config$maps$base

cntys <- ggplot2::map_data("county") %>%
  subset(region == "texas")

state <- ggplot2::map_data("state")

ditch_the_axes <- ggplot2::theme(
  axis.text = ggplot2::element_blank(),
  axis.line = ggplot2::element_blank(),
  axis.ticks = ggplot2::element_blank(),
  panel.border = ggplot2::element_blank(),
  panel.grid = ggplot2::element_blank(),
  axis.title = ggplot2::element_blank()
)

#' @title base map
#' @param data the data to use
base_map <- function(data) {
  
  ggplot2::ggplot() +
    ggplot2::geom_polygon(data = data, 
                          ggplot2::aes(x = long, y = lat, fill = region, group = group), color = cmp$color, fill = cmp$fill) +
    ggplot2::coord_fixed(1.3) +
    ggplot2::guides(fill = FALSE) +
    ggplot2::theme_bw() +
    ditch_the_axes
}

#' @title United States base map
usa_base_map <- function() {
  
  base_map(data = state)
  
}

#' @title Texas base map
tx_base_map <- function(data = cntys) {
  
  base_map(data = cntys)
  
}