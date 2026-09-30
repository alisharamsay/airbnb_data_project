# Run the whole pipeline: Rscript run_pipeline.R (from the project root)

steps <- c("src/week_5_lab_tasks.Rmd", "src/week_8_lab_airbnb.Rmd",
           "src/week_8_lab_tenancy.Rmd", "src/week_9_lab_tasks.Rmd")

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