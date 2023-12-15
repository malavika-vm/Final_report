library(tidyverse)

data <- read_csv("sourcedata/product_info.csv")
htt <- data %>%
  filter(secondary_category == "High Tech Tools")
htt_tertiary_counts <- htt %>%
  group_by(tertiary_category) %>%
  summarise(total_observations = n())
htt_pie_chart_gg <- ggplot(htt_tertiary_counts, aes(x = "", y = total_observations, fill = tertiary_category)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  theme_void() +  # Remove unnecessary elements like axis labels
  ggtitle("Observations Distribution for Tertiary Categories in High Tech Tools")

print(htt_pie_chart_gg)

ggsave("figures/htt-pie-chart.png", width = 10, height = 6, units = "in")
