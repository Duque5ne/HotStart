head(analysis)

install.packages("stringr")
library(stringr)


library(tidyverse)
library(readxl)

plot <- ggplot(analysis, aes(x = `term/label`, y = `Client Text Box Input`,
                             fill = FDR, size = `Gene Count`)) +
  geom_point(shape = 21, color = "black") +
  labs(x = "", y = "Input count", title = "Gene ontology") +
  theme_gray() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    axis.line.x = element_blank(),
    axis.ticks.x = element_blank(),
    plot.title = element_text(size = 18, face = "bold"),
    panel.grid.major.x = element_line(color = "gray80"),  # Customize major grid lines
    panel.grid.minor.x = element_blank()  # Remove minor grid lines
  ) +
  scale_fill_gradient(low = "aquamarine", high = "aquamarine4") +
  scale_size_continuous(range = c(2, 10))  # Set the range for dot sizes

# Wrap the x-axis labels to display them on multiple lines
plot_with_custom_font_and_wrapped_labels <- plot +
  scale_x_discrete(labels = function(x) str_wrap(x, width = 20))

print(plot_with_custom_font_and_wrapped_labels)
