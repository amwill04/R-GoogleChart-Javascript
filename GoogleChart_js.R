dynamic_gvis <- function(chart, file) {

  js <-c("google.load('visualization', '1', {'packages':['corechart']});\n")

  for (x in 1:length(chart)) {
    if (class(chart)[1] == "gvis") {
      chart_type <- chart$type
      chart_id <- chart$chartid
      chart_data <- chart$html$chart['jsData']
    } else {
      chart_type <- chart[[x]][1]$type
      chart_id <- chart[[x]][2]$chartid
      chart_data <- chart[[x]][3]$html$chart['jsData']
    }
    chart_api_load <- paste("google.setOnLoadCallback(drawChart", chart_id, ");", sep = "")
    chart_draw <- paste("function drawChart", chart_id, "() {
                           var data = gvisData", chart_id, "();
                           var options = {};


                               var chart = new google.visualization.",chart_type, "(
                               document.getElementById('", chart_id, "')
                               );
                               chart.draw(data,options);

                               $(window).smartresize(function () {
                                 chart.draw(data, options);
                               });

                          }", sep = "")
    google_chart <- paste(chart_api_load, chart_data,chart_draw, sep = "\n")

    js <- c(js, google_chart)

  }
  write(js, file)
}
