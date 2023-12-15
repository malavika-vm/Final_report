library(tidyverse)
data <- read_csv("sourcedata/product_info.csv")

women_data <- data %>%
  filter(secondary_category == "Women")
tertiary_counts <- women_data %>%
  group_by(tertiary_category) %>%
  summarise(total_observations = n())
pie_chart_gg <- ggplot(tertiary_counts, aes(x = "", y = total_observations, fill = tertiary_category)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  theme_void() +  # Remove unnecessary elements like axis labels
  ggtitle("Observations Distribution for Tertiary Categories in Women")
print(pie_chart_gg)

ggsave("figures/women-pie-chart.png", width = 10, height = 6, units = "in")
