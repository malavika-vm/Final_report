library(tidyverse)
library(viridis)

data <- read_csv("sourcedata/product_info.csv")

ordered_categories <- data %>%
  group_by(secondary_category) %>%
  summarise(avg_rating = mean(rating)) %>%
  arrange(avg_rating) %>%
  pull(secondary_category)
data$secondary_category <- factor(data$secondary_category, levels = ordered_categories)
scatter_plot <- ggplot(data, aes(x = secondary_category, y = rating, group = 1,color=price_usd)) +
  geom_point(alpha=0.7) +
  labs(title = "Ordered Ratings by Secondary Category",
       x = "Secondary Category",
       y = "Rating") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+scale_color_viridis_c(option = "plasma", direction = -1) 
ggsave("figures/ratings-and-price-by-cat.png", width = 10, height = 6, units = "in")
