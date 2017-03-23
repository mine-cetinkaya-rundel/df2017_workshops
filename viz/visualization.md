# Data Visualizaiton

[Git repo for workshop](https://github.com/mine-cetinkaya-rundel/df2017_workshops.git)

The goal is to **facilitate or communicate insight about our data**, such as patterns, trends and correlations that may be missed in tables of numbers. This works because we are very good at detecting patterns in visual data - more of the brain is devoted to processing informaiton from the eyes than from any other sensory organ.

## Reference: [Ten guidelines for effective data visualization in scientific publications](http://www.sciencedirect.com/science/article/pii/S1364815210003270)

**Gideline 1**. Create the simplest graph that conveys the information you want to convey
**Guideline 2**. Consider the type of encoding object and attribute used to create a plot
**Guideline 3**. Focus on visualizing patterns or on visualizing details, depending on the purpose of the plot
**Guideline 4**. Select meaningful axis ranges
**Guideline 5**. Data transformations and carefully chosen graph aspect ratios can be used to emphasize rates of change for time-series data

![Guidelines 1,3,4,5](http://ars.els-cdn.com/content/image/1-s2.0-S1364815210003270-gr1a.jpg)

**Guideline 6**. Plot overlapping points in a way that density differences become apparent in scatter plots
**Guideline 7**. Use lines when connecting sequential data in time-series plots
**Guideline 8**. Aggregate larger datasets in meaningful ways
**Guideline 9**. Keep axis ranges as similar as possible to compare variables
**Guideline 10**. Select an appropriate color scheme based on the type of data

![ Guidelines 6,7,8,9,10](http://ars.els-cdn.com/content/image/1-s2.0-S1364815210003270-gr1b.jpg)

## Using `ggplot2` for static visulizaitons

- Concept: **Grammar of graphics** - use a grammar to map data to visual elements
- Concept: **Stepwise construction** - visualizations are constructed by adding **layers** onto an empty **canvas**

## Using `shiiny` for interactive visualization

- Concept: **Reactive programming** - create an evnironment in which there is automatic propagation of changes to observers
- Concept: **Code organization** - there is a forntend (`ui.R`), a backend for data that is processed only once per session (`globalss.R`) and a backend for data that must be updated in a reactive way (`server.R`)

## Steps in buidling an interactive visualizaiton application

- Identify the data visualizaiton objectives
- Storyboard and sketch out the visualziaiton plan
- Write code to pre-proocess data for visualization (only needs to be updated if the data changes)
- Write code to crocess data that needs to be updated only once per session in `globals.R`
- Create layout and inputs in `ui.R`
- Write code to render outputs in `server.R` - this is where `ggplot2` graphics are created
- Write code to display outputs in `ui.R`
- Style and add polish to the applicaiton by adding CSS or graphics

## Next steps

- Review the use of `ggplot2` and try out the exercises in this [tutorial](http://tutorials.iq.harvard.edu/R/Rgraphics/Rgraphics.html)
- Look at the `shiny` [gallery](https://shiny.rstudio.com/gallery/) in the "Start Simple" section. Try to reproduce the five applications without referring to the given code.
