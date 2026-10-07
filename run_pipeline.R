# Run the whole pipeline: Rscript run_pipeline.R (from the project root)

steps <- c("src/week_5_lab_tasks.Rmd", # builds the combined Christchurch Airbnb dataset, downloading and merging nine months of listings data, filtering to Christchurch, adding a month+year column, and producing summary statistics.
           "src/week_8_lab_airbnb.Rmd", "src/week_8_lab_tenancy.Rmd", # clean both the Week 5 Airbnb dataset and a new rental bond dataset from Tenancy Services, documenting your cleaning decisions and keeping key columns for the join that happens in Week 9.
           "src/week_9_lab_tasks.Rmd") # geocode the Airbnb dataset's coordinates into Stats NZ area codes using the Koordinates API, join it with the bond dataset on area code and time, then answer three questions: median Airbnb price in Christchurch Central, where the short- vs long-term rental price gap is largest, and how Airbnb listings compare to rental properties by location.

for (step in steps) {
  message("Running ", step)
  
  result <- tryCatch(rmarkdown::render(step), error = function(e) e)
  
  if (inherits(result, "error")) {
    stop("Pipeline failed at ", step, ": ", conditionMessage(result))
  } else {
    pdf_file <- sub("\\.Rmd$", "\\.pdf", step)
    file.copy(pdf_file, file.path("out", basename(pdf_file)), overwrite = TRUE)
    file.remove(pdf_file) # Optional: clean up the local copy in src/
  }
}
message("Pipeline complete.")