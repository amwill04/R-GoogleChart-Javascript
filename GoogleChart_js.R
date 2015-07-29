dynamic_gvis <- function(chart, file) {

  js <-c("google.load('visualization', '1', {'packages':['corechart']});\n")

  for (x in 1:(length(chart)/3)) {
    chart_type <- chart[[x]][1]$type
    chart_id <- chart[[x]][1]$chartid
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
    google_chart <- paste(chart_api_load, chart_draw, sep = "\n")

    js <- c(js, google_chart)

  }
  write(js, file)
}
