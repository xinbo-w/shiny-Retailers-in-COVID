# Retailers in COVID [Link](https://xinbo-wang.shinyapps.io/Retailers-in-COVID/) 
>Team members: [Xinbo Wang](https://github.com/xinbo-hubert-wang), Farhad Mughal, Mark Chen, Weizhong Yao

![png](https://github.com/xinbo-hubert-wang/shiny-Retailers-in-COVID/blob/main/Dashboard%20-%20Main.png)

## Overview
Retailers in COVID is a course project in my first semester of MSBA program at UMN. 
Since COVID-19 brough so much uncertainty in retail traffic, the retailers need to allocate their resources more wisely.
To help visualize the impact of COVID-19 on the retail industry so as to help resource allocation, my team built this [R-Shiny dashboard](https://xinbo-wang.shinyapps.io/Retailers-in-COVID/) 
utilizing the data from [Google Mobility](https://www.google.com/covid19/mobility).



## Content
The repository contains three core files.
### mobility_data_fetching_preparing.R
This is the R script that fetches the data from Google platform and make transformations to output the data for our dashboard.

### data_for_dashboard.csv
This is the data output by the script and to be visualized in the rmarkdown file.

### Retailers-in-COVID.Rmd
This is the rmarkdown file that can be knitted to form the R-Shiny dashboard shown in the link [R-Shiny dashboard](https://xinbo-wang.shinyapps.io/Retailers-in-COVID/) 

## How to Use the Dashboard
The green on the maps represents the counties that has a increased traffic in retailer stores and red spots are ones with increased traffic, compared to pre-COVID. 
The size of the spots represent change in percentage (larger spots = larger change).
![png](https://github.com/xinbo-hubert-wang/shiny-Retailers-in-COVID/blob/main/Dashboard%20-%20Main.png)
As you can see, the map is crowded by spots (counties). The dashboard is built with several widgets that can filter data.
### Filter by State
![png](https://github.com/xinbo-hubert-wang/shiny-Retailers-in-COVID/blob/main/Dashboard%20-%20CA.png)
### Filter by Population Density
![png](https://github.com/xinbo-hubert-wang/shiny-Retailers-in-COVID/blob/main/Dashboard%20-%20Density.png)
### Zoom In
![png](https://github.com/xinbo-hubert-wang/shiny-Retailers-in-COVID/blob/main/Dashboard%20-%20Zoom-In.png)

## Conclusion
Using our dashboard, retailers can allocate resources smartly according to retail traffic, especially in a time like COVID.
