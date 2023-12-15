.PHONY: clean run_figures report

clean:
	rm -rf figures
	mkdir -p figures

run_figures: Rscripts/reviews-by-cat.R sourcedata/product_info.csv \
	Rscripts/ratings-and-price-by-cat.R sourcedata/product_info.csv \
	Rscripts/women-pie-chart.R sourcedata/product_info.csv \
	Rscripts/htt-pie-chart.R sourcedata/product_info.csv \
	Rscripts/skincare-ingredients.R sourcedata/product_info.csv \
	Rscripts/vegan-proportion.R sourcedata/product_info.csv
		Rscript Rscripts/reviews-by-cat.R sourcedata/product_info.csv
		Rscript Rscripts/ratings-and-price-by-cat.R sourcedata/product_info.csv
		Rscript Rscripts/women-pie-chart.R sourcedata/product_info.csv
		Rscript Rscripts/htt-pie-chart.R sourcedata/product_info.csv
		Rscript Rscripts/skincare-ingredients.R sourcedata/product_info.csv
		Rscript Rscripts/vegan-proportion.R sourcedata/product_info.csv

report: clean run_figures report.Rmd
	Rscript -e "rmarkdown::render('report.Rmd', output_format='html_document')"
