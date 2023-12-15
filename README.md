# Product Reviews on Sephora and their significance
I have selected a dataset on the product information extracted from Sephora, a cosmetics and beauty products retailer. The following are the variables present in the data

1. product id
2. product name
3. brand id
4. brand name
5. loves_count: no of of likes the product receives
6. ratings: between 1-5
7. reviews: no. of reviews
8. ingrediants
9. prices_usd
10. limited edition: yes or no
11. new: yes or no
12. out of stock: yes or no
13. sephora exclusive: yes or no
14. highlights: key features of the product
15. primary category
16. secondary category
17. tertiary category
## Objectives
- Assess the performance of limited edition and sephora exclusive line of products
- Check correlation between the number of likes a product gets and how frequently is it out of stock or not
- Analyse the prices and the number of reviews each product gets across various categories of products
## Follow these steps to create a report of this project using Docker:

### 1.Clone Repository into your local computer
Open a terminal on your PC and go to a working directory :  
```git clone https://github.com/malavika-vm/Final_report```  
Now you have saved all these files in your working directory. You will see a file names Final_report. 
### 2.Build a docker image 
```cd Final_report```  

```docker build -t bios611:1.0 .```  
### 3.Run the image to get to the container
```docker run --rm -v $(pwd):/home/rstudio -e PASSWORD=sephora_project -p 8787:8787 -it bios611:1.0```  
### 4.Open browser and copy the URL
``` http://localhost:8787```  
id: rstudio  
password: sephora_project  
Validate your steps by checking that the home directory contains the following folders/files:  
- Rscripts
- report.Rmd
- sourcedata
- Makefile
  
### 5.Go to the R terminal to create the report
Type 'make report'  
You will now see a report.html file in the home directory. Open it in the web browser to see the final report.  
## Thank You
