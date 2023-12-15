library(tidyverse)

data <- read_csv("sourcedata/product_info.csv")

skin=data%>%filter(primary_category=="Skincare")
names(skin)
target_ingredients <- c("Formaldeyde","Pthalates","Paraben", "Alcohol", "Silicon", "Sulfate","Fragrance","Hydroquinone")
ingredient_counts <- vector("list", length = length(target_ingredients))
names(ingredient_counts) <- target_ingredients
for (ingredient in target_ingredients) {
  ingredient_counts[[ingredient]] <- sapply(skin$ingredients, function(x) sum(str_count(x, fixed(ingredient))))
}
ingredient_counts_df <- as.data.frame(ingredient_counts)
ingredient_counts_long <- gather(ingredient_counts_df, key = "ingredient", value = "count")

bar_plot <- ggplot(ingredient_counts_long, aes(x = ingredient, y = count, fill = ingredient)) +
  geom_bar(stat = "identity") +
  labs(title = "Counts of Harmful Ingredients in Skincare Products",
       x = "Harmful Ingredients",
       y = "Total Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggsave("figures/skincare-ingredients.png", width = 10, height = 6, units = "in")
