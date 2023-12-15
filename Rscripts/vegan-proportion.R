library(tidyverse)

data <- read_csv("sourcedata/product_info.csv")

vegan<- data[grepl("Vegan", data$highlights, ignore.case = TRUE), ]
t=as.data.frame(table(vegan$primary_category))
u=as.data.frame(table(data$primary_category))[-7,]
y=t$Freq/u$Freq
prop=cbind(t,y)
ggplot(prop, aes(x = Var1, y = y)) +
  geom_bar(stat = "identity",fill="cadetblue") +
  labs(title = "Proportion of Vegan Products by Category",
       x = "Primary Category",
       y = "Proportion",
       fill = "Metric") +
  theme_minimal()

ggsave("figures/vegan-proportion.png", width = 10, height = 6, units = "in")
