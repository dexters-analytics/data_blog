# EXPLORATION 


# DataExplorer ----
library(DataExplorer)
library(tidyverse)
library(nycflights13)
library(tidyquant)
theme_set(theme_tq())


data_list <- list(airlines, airports, flights, planes, weather)
plot_str(data_list, type = "r")


merge_airlines <- merge(flights, airlines, by = "carrier", all.x = TRUE)
merge_planes <- merge(merge_airlines, planes, by = "tailnum", all.x = TRUE, suffixes = c("_flights", "_planes"))
merge_airports_origin <- merge(merge_planes, airports, by.x = "origin", by.y = "faa", all.x = TRUE, suffixes = c("_carrier", "_origin"))
final_data <- merge(merge_airports_origin, airports, by.x = "dest", by.y = "faa", all.x = TRUE, suffixes = c("_origin", "_dest")) %>% tibble()

final_data


# Testing Functions ----
introduce(final_data) %>% pivot_longer(rows:memory_usage)

plot_intro(final_data, ggtheme = theme_tq())



DataExplorer::drop_columns(final_data, "speed") %>% 
    plot_intro(ggtheme = theme_tq())


plot_missing(final_data, ggtheme = theme_tq())

final_data_processed <- final_data %>% 
    drop_columns(ind = "speed") %>% 
    select(model:engine) %>% 
    set_missing(value = list(0, "Missing"))
    

final_data_processed %>% glimpse()

introduce(final_data_processed) %>% pivot_longer(rows:memory_usage)
final_data_processed %>% plot_missing() 

plot_intro(final_data_processed, ggtheme = theme_tq())

plot_missing(final_data_processed, ggtheme = theme_tq())




