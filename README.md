# R-GoogleChart-Javascript
Uses R to produce google charts data table while also adding responsive resizing to the chart.

# Installation

Run

source_url("https://raw.githubusercontent.com/amwill04/R-GoogleChart-Javascript/master/R/GoogleChart_js.R")

To use this function googleVis must be pre-installed.

# Use

To use this function first run googleVis function on data you wish to plot assigning it to a variable.

e.g. m <- gvisBarChart(df, xvar, yvar, chartId)

I recommend adding a custom chartID to the chart. This is not necessary for the function to work but will make writing the html and div elements a lot easier.

if you wish to run for multiple charts then simply add them to a list.

e.g. charts <- list(m, n)

The javascript that is produced includes a jquery plugin written by Paul Irish so your html file will need to reference these within the header as well as the google scripts and jquery scripts.

<script src="jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="debounce.js"></script>
