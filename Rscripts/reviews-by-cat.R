library(tidyverse)
data <- read_csv("sourcedata/product_info.csv")

ggplot(data, aes(x = primary_category, y = reviews, fill = factor(rating > 3.5))) +
  geom_bar(stat = "identity") +
  labs(title = "Stacked Bar Plot of Reviews by Primary Category",
       x = "Primary Category",
       y = "Number of Reviews",
       fill = "Rating > 3.5") +
  scale_fill_manual(values = c("black", "cadetblue3"), labels = c("Below 3.5", "Above 3.5")) +
  theme_minimal()+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+ theme(plot.title = element_text(hjust = 0.5)) +
  theme(axis.text = element_text(size = 10), axis.title = element_text(size = 12)) +
  theme(legend.text = element_text(size = 10), legend.title = element_text(size = 12))

ggsave("figures/reviews-by-cat.png", width = 10, height = 6, units = "in")


