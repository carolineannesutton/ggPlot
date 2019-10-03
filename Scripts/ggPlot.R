library(tidyverse)

# read in data - make sure you remember "" that includes where to find data
# and create a dataframe. Have a look that the data make sense

gapminder <- read_csv("data/gapminder_data.csv")

# filter for 1977 and create at dataframe
gapminder_1977 <-filter(gapminder, year == 1977)
gapminder_1977


# making a plot - map aesthetics 
ggplot(data = gapminder_1977)

ggplot(data = gapminder_1977,
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent,
                     size = pop))


# ways to look at the data - get into the habit of checking
# good idea to check it out when it is read in
glimpse(gapminder_1977)
str(gapminder_1977)


# map geometries - copy script from above add the "+" it will look for
# sensible geometries to add.


ggplot(data = gapminder_1977,
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent,
                     size = pop)) +
  geom_point()


# need to scale on the x axis

ggplot(data = gapminder_1977,
       mapping = aes(x = gdpPercap,
                     y = lifeExp,
                     colour = continent,
                     size = pop)) +
  geom_point() +
  scale_x_log10()

# add a label

ggplot(data = gapminder_1977,
       mapping = aes(x = gdpPercap,
                     y = continent,
                     colour = continent,
                     size = pop),
                    label = year) +
  geom_point() +
  scale_x_log10()

# Challenge 7 create scatter plot 
ggplot(data = gapminder, 
       mapping = aes(x = year, y = lifeExp)) + 
      geom_point()

ggplot(data = gapminder, 
       mapping = aes(x = year, y = lifeExp, colour = continent)) + 
  geom_point()
