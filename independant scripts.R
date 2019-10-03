#this will work only when you already have tidyverse running from the other scrip 
# ggPllot. Its is best to make sure scripts are independant. if you restart R this
#script will not run unless you load tidyverse AND set a dataframe called "gapminder"



gapminder_mean <- gapminder %>% 
  group_by(continent, year) %>% 
             summarise(mean_lifexp = mean(lifeExp))
