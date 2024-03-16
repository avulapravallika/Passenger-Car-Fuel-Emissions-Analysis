library(tidyverse)
library(GGally)
library(ggplot2)
library(tinytex)

# Read csv file
df <- read.csv("cars.csv", as.is=FALSE)
str(df)

#Removing zero values and considering only non zero values
is.na(df$WLTPCO2) <- df$WLTPCO2 == 0
#viewing the manufacturers causing the most air pollution
data <- df[with(df,order(-WLTPCO2)),]
view(data)
#Removing zero values and considering only non zero values
is.na(df$noise_level) <- df$noise_level == 0
#viewing the manufacturers causing the most noise pollution
data <- df[with(df,order(-noise_level)),]
view(data)

#Removing zero values and considering only non zero values
is.na(df$WLTPCO2) <- df$WLTPCO2 == 0
#Plotting the models causing the most air pollution
g <- df %>% 
  arrange(desc(WLTPCO2)) %>%
  slice(1:15) %>%
  ggplot(., aes(x=model, y=WLTPCO2))+
  geom_bar(stat='identity', col='red')

g + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +coord_flip()

#Removing zero values and considering only non zero values
is.na(df$noise_level) <- df$noise_level == 0
#Plotting the models causing the most noise pollution
w <- top_n(df, n=20, (noise_level)) %>%
  ggplot(., aes(x=model, y=noise_level))+
  geom_bar(stat='identity')
w + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +coord_flip()

#Removing zero values and considering only non zero values
is.na(df$WLTPCO2) <- df$WLTPCO2 == 0

#identifying the car with low emissions by order the the table in ascending order with
#respect to co2 emmissions
data <- df[with(df,order(WLTPCO2)),]
x <- data %>% select(manufacturer,WLTPCO2)
view(data)
y <- data %>% select(model,WLTPCO2)
y
z<- data %>% select(description,WLTPCO2)
z
t <- data %>% select(transmission,WLTPCO2)
t
u <- data %>% select(engine_capacity,WLTPCO2)
u
v<- data %>% select(fuel_type,WLTPCO2)
v
f <- data %>% select(powertrain,WLTPCO2)
f
#-------------------------------------------------------------------------------
#Removing zero values and considering only non zero values
is.na(df$engine_power) <- df$engine_power == 0
#Plotting the manufacturers with respect to engine power
q <- ggplot(df, aes(x=manufacturer,y=engine_power))+
  geom_col()+  coord_flip()+
  labs(title=paste("car manufacturers with respect to engine power"))+
  theme(legend.position= "top") + guides(fill=guide_legend(reverse=TRUE))

q+ theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

#plotting a scatterplot displaying fuel type with respect to co2 emmissions and noise levels
ggplot(df, aes(x = WLTPCO2, y = noise_level)) + 
  labs(title=paste("Scatterplot displaying fuel type with respect to co2 emmissions and noise levels"))+
  geom_point(aes(color = factor(fuel_type))) +
  stat_smooth(method=lm)

# creating scatterplot of WLTPCO2 vs. Emissions_CO
plot(df$WLTPCO2,df$Emissions_CO, col='darkgreen', pch=19)
# Adding scatterplot of THC_emissions vs emissions_NOx
points(df$THC_emissions, df$emissions_NOx, col='black', pch=19)

# creating scatterplot of WLTP_metric_low vs. WLTP_metric_medium
plot(df$WLTP_metric_low,df$WLTP_metric_medium, col='blue', pch=10)
# Adding scatterplot of WLTP_metric_high vs WLTP_metric_extra_high
points(df$WLTP_metric_high, df$WLTP_metric_extra_high, col='red', pch=10)


