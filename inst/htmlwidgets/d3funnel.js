HTMLWidgets.widget({
  name: "d3funnel",
  type: "output",
  renderValue: function(el, x) {
    // convert data.frame to arrays
    var dat = [];
    HTMLWidgets.dataframeToD3(x.data).forEach(function(v){dat.push([v.k, v.v])});
    x.data = dat;
    (new D3Funnel(el)).draw(x.data, x.options);
  }
});
