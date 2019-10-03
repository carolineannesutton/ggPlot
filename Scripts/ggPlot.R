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


 # just draws one line
ggplot(data = gapminder, 
       mapping = aes(x = year, y = lifeExp)) + 
  geom_line()

#lets group by country

ggplot(data = gapminder, aes(x = year, y = lifeExp, 
                             group = country, color = continent)) +
  geom_line()

  
#add black points

ggplot(data = gapminder, aes(x = year, y = lifeExp, 
                             group = country, color = continent)) +
  geom_line()+
  geom_point(colour ="black")

# same but different code

ggplot(data = gapminder, aes(x = year, y = lifeExp, 
                             group = country) +
  geom_line(ase(colour = continents))+
  geom_point())


# Stats

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point())
  
# x axis scale

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  scale_x_log10() +
  geom_point()

# bit of overplotting - transparant points

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  scale_x_log10() +
  geom_point(alpha = 0.3) +
  # create a trendline
geom_smooth(method = "lm", size = 0.1, colour = "yellow"))


# colour by continent

ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  scale_x_log10() +
  geom_point(aes(colour = continent)) +
  # override the colour and set colours manually
  scale_colour_manual(values = c(Europe ="red", Africa = "purple", Asia ="yellow", Oceania ="blue",
                                 Americas ="orange")))
 
 # change colour and size
  ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  scale_x_log10() +
  geom_point(colour = "red", size = 2)+
  geom_smooth(method = "lm", size = 0.1)

  # challenge 10 
  # Modify your solution to Challenge 9 so that the points are now a different shape 
  #and are colored by continent with new trendlines. Hint: 
  #The color argument can be used inside the aesthetic.
  
  ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, colour = continent)) +
    scale_x_log10() +
    geom_point(size = 1, shape = "triangle")+
    geom_smooth(method = "lm", size = 0.1)
  
  # each continent a different shape
  
  ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, shape = continent,
                                         colour = continent)) +
    scale_x_log10() +
    geom_point(size = 1)+
    geom_smooth(method = "lm", size = 0.1)
  
# almost the same but choosing colour down lower to only colour the trendlines
  
  ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
    scale_x_log10() +
    geom_point(size = 1, shape = "triangle")+
    geom_smooth(method = "lm", size = 0.1, aes(colour = continent))
  
  # scale the colour
  ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, colour = continent)) +
    scale_x_log10() +
    geom_point(size = 2, shape = "triangle")+
    geom_smooth(method = "lm", size = 1)+
    scale_color_brewer(palette = "Set1")
  
  # make choice on shape
  
  ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, colour = continent,
                                         shape = continent)) +
    geom_point(size = 4)+
    scale_x_log10() +
   scale_shape_manual(values = c(7, 8,3,10,18))
  
  # use other shapes from a colour palette
  
  ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp, colour = continent,
                                         shape = continent)) +
    geom_point(size = 2)+
    scale_x_log10() +
    scale_color_brewer(palette = "OrRd")

  
#Facetting must remember the squiggly "~"
  
a_countries <- gapminder %>% 
  filter(str_starts(country,"A"))

# facet by country

ggplot(
  data = a_countries,
  mapping = aes( x = year, y = lifeExp, colour = continent, group = country)
  ) +
  geom_line() +
  facet_wrap(~country)

# using the gapminder facet by year
ggplot(
 data = gapminder,
  mapping = aes(x = gdpPercap, y = lifeExp,
                colour = continent, size = pop, group = year, label = country)
 )+
  geom_point() +
  scale_x_log10()+
  facet_wrap(~year)+
  #add  text label
  geom_text(data = gapminder_rich)
 
#set up a data frame for the rich countries 
gapminder_rich <- filter(gapminder_1977, gdpPercap > 30000)


ggplot(
  data = gapminder_1977,
  mapping = aes(x = gdpPercap, y = lifeExp,
                colour = continent, size = pop, group = year, label = country)
)+
  geom_point() +
  scale_x_log10()+
  facet_wrap(~year)+
  #add some text label
  geom_text(data = gapminder_rich, size = 4)

# going back to the facet plot  by country - save it as a dataframe

roughplot <- ggplot(
  data = a_countries,
  mapping = aes( x = year, y = lifeExp, colour = continent, group = country)
) +
  geom_line() +
  facet_wrap(~country)

roughplot +
  scale_color_brewer(palette = "Dark2")

roughplot +
  labs(title = "Figure 1",
       x = "year", y = "Life Expectancy", colour ="Continent")


roughplot +
  labs(title = "Figure 1: Life Expectancy over time for Countries that begin with 'A'", x = "Year", y = "Life Expectancy",
       colour = "Continent", caption = "Data from Gapminder") +
theme(
    panel.grid.major = element_blank(),
    plot.title = element_text(size = 14),
    axis.line = element_line(colour = "blue", size = 2)
  )


# must tell where to save it. It saves the last plot that was made unless you specify a particulare object
# can specify type of file jpg or png, as well as the actual dimensions
ggsave("Figures/First_plot.jpg", plot = roughplot, width = 12, height = 19, units = "cm", dpi = 200)

# in the console to find your working directory
# type : getwd()

