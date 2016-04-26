#' d3funnel
#' @param data should be a data.frame with two columns, 
#' the first column will be used as label(character), and the second column(numeric) is used as value
#' 
#' @export
#' @import htmltools
#' @import htmlwidgets
d3funnel <- function(data, ..., chart.width = 300, chart.height = 300){
  if (is.data.frame(data)) {
    colnames(data) <- c('k', 'v')
  } else {
    stop("Unsupported type passed to argument 'data'.")
  }
  params = list(
    data = data, 
    options = list(..., chart.height = chart.height, chart.width = chart.width)
  )
  params = Filter(Negate(is.null), params)
  htmlwidgets::createWidget('d3funnel', params,
    sizingPolicy = htmlwidgets::sizingPolicy(
      viewer.fill = FALSE 
    )
  )
}

#' @export
d3funnelOutput <- function(outputId, width = "300px", height = "300px") {
  htmlwidgets::shinyWidgetOutput(outputId, "d3funnel", width, height)
}

#' @export
renderD3funnel <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, d3funnelOutput, env, quoted = TRUE)
}
