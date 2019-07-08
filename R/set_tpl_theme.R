#' The TPL [ggplot2] theme
#'
#' \code{set_tpl_theme} provides a [ggplot2] theme formatted according to the
#' TPL website.
#'
#' @param style The default theme style for the R session. "print" or "map".
#' @import extrafont
#' @import ggrepel
#' @md
#' @export

set_tpl_theme <- function(style = "print", font = "adobe") {

  # set default theme

    if (style == "print") {
    ggplot2::theme_set(theme_tpl_print())
  } else if (style == "Texas") {
    ggplot2::theme_set(theme_tpl_texas())
  } else {
    stop('Style does not exist. Try "print" or "Texas".',
         call. = FALSE
      )
  }

# add font

  if (font == "adobe") {
    ggplot2::theme_update(text = ggplot2::element_text(family = "Adobe Caslon Pro"))
    # ggplot2::update_geom_defaults("label", list(family = "Adobe Caslon Pro"))
    # ggplot2::update_geom_defaults("text_repel", list(family = "Adobe Caslon Pro"))
    # ggplot2::update_geom_defaults("label_repel", list(family = "Adobe Caslon Pro"))

  } else if (font == "lato") {
    ggplot2::theme_update(text = ggplot2::element_text(family = "Lato"))
    # ggplot2::update_geom_defaults("label", list(family = "Lato"))
    # ggplot2::update_geom_defaults("text_repel", list(family = "Lato"))
    # ggplot2::update_geom_defaults("label_repel", list(family = "Lato"))
  } else {
    stop('Font does not exist. Try "adobe" (Adobe Caslon Pro) or "lato" (Lato).',
         call. = FALSE)
  }

# select color palette

# set color scales for continuous

    options(
      ggplot2.continuous.colour = "gradient",
      ggplot2.continuous.fill = "gradient"
        )

# set colors for single bars, etc.

    ggplot2::update_geom_defaults("bar", list(fill = "#151348"))
    ggplot2::update_geom_defaults("col", list(fill = "#151348"))
    ggplot2::update_geom_defaults("point", list(colour = "#151348"))
    ggplot2::update_geom_defaults("line", list(colour = "#151348"))
    ggplot2::update_geom_defaults("step", list(colour = "#151348"))
    ggplot2::update_geom_defaults("path", list(colour = "#151348"))
    ggplot2::update_geom_defaults("boxplot", list(fill = "#151348"))
    ggplot2::update_geom_defaults("density", list(fill = "#151348"))
    ggplot2::update_geom_defaults("violin", list(fill = "#151348"))

# set colors for stats

    ggplot2::update_stat_defaults("count", list(fill = "#151348"))
    ggplot2::update_stat_defaults("boxplot", list(fill = "#151348"))
    ggplot2::update_stat_defaults("density", list(fill = "#151348"))
    ggplot2::update_stat_defaults("ydensity", list(fill = "#151348"))

}

# set_tpl_theme(style = "print", font = "adobe")
#
# ggplot2::ggplot(iris, ggplot2::aes(x=Species,y=Sepal.Width,fill=Species)) +
#   ggplot2::geom_col(position = "dodge") +
#   scale_fill_ordinal() +
#   ggplot2::labs(title = "Title",
#        subtitle ="Subtitle",
#        caption = ggplot2::element_blank())
# grid.arrange(plot, tpl_logo_text(), ncol = 1, heights = c(30, 1))