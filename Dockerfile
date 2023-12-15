FROM rocker/verse
RUN R -e "install.packages('tidyverse')"
RUN mkdir /home/rstudio/Rscripts
RUN mkdir /home/rstudio/sourcedata
COPY Rscripts /home/rstudio/Rscripts
COPY sourcedata /home/rstudio/sourcedata
COPY Makefile /home/rstudio/
COPY report.Rmd /home/rstudio/
