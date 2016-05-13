## d3funnel

This is an experimental R package that provides support for [D3-funnel](https://github.com/jakezatecky/d3-funnel) as a HTML widget.

_xiiik@twitter

### Installation

You can install from github

```r
devtools::install_github('funnng/d3funnel')
```

### Usage

It is pretty simple

```r
library("shiny")
library("d3funnel")
shinyApp(
  ui = fluidPage(d3funnelOutput('plot')),
  server = function(input, output) {
    output$plot <- renderD3funnel({
      d3funnel(data.frame(a=c('vist','order','paid'), b=c(116634,2007,435)))
    })
  }
)
```

### options

Not yet implemented


### License

MIT license.


