library(tidyverse)
library(here)

rps <- read.csv("repro_efforts/Reproducibility_Efforts.csv")

rps_count <- rps %>% count(Publication.Year) 
rps_count %>%
  ggplot(aes(x = Publication.Year, y = n)) +
  geom_col(color = "#8EAC8E", fill = "#B2D8B2", width = 0.75) +
  labs(x = "Year of publication",
       y = "Number of projects") +
  scale_x_continuous(breaks = seq(
    min(rps$Publication.Year, na.rm = TRUE), 
    max(rps$Publication.Year, na.rm = TRUE), by = 1),
    expand = c(0, .1)) +
  scale_y_continuous(breaks = seq(0, max(rps_count$n), by = 1),
                     expand = c(0, .1)) +
  theme_minimal(base_size = 12) + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        panel.grid.major.x = element_blank()) 


rps %>% count(Publication.Year) %>%
  mutate(cumsum = cumsum(n)) %>%
  ggplot(aes(x = Publication.Year, y = cumsum)) +
  geom_line() +
  labs(title = "Cumulative Number of Reproducibility Projects by Year",
       x = "Year of Publication",
       y = "Cumulative Number of Projects") +  
  scale_x_continuous(breaks = seq(min(rps$Publication.Year, na.rm = TRUE), 
                                  max(rps$Publication.Year, na.rm = TRUE),
                                  by = 1)) +
  theme_minimal() + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 

