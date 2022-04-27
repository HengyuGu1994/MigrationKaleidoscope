# MigrationKaleidoscope

In migration networks, the **origin-destination (OD)** bilateral flows and each site’s **in- and outflow volumes** are like two sides of the same coin; though popular visualisation approaches such as the chord diagram excel in describing the former, the latter mostly remains less depicted aspect. <br />

By applying the Voronoi-based migration **Kaleidoscope diagram** and integrating it with the **sunburst treemap** [(Jahn et al., 2021)](https://github.com/m-jahn/WeightedTreemaps), the function visualises migration from different time periods and focalises on the relative status of each migration body as origin or destination. <br />

By attributing different colours to groups and differentiating in- and outflows with *deep and light shades*, information about each body’s weight in the migration network is gained from their size in the diagrams, and variable as well as invariable patterns are observed from the trends. 

<img src="https://github.com/Zhibin-Xu/MigrationKaleidoscope/blob/main/MigrationKaleidoscope.png" width=50% height=50%>

<img src="https://github.com/Zhibin-Xu/MigrationKaleidoscope/blob/main/StackedBarplot.png" width=50% height=50%>

## Introduction
>  [Gu and Xu (2022)](https://doi.org/10.1177/23998083221082916) present a diachronic visualisation of China’s internal migration patterns at the country, region and province level simultaneously. They achieve this through an innovative repurposing and expansion of the Voronoi-based Kaleidoscope diagram developed by the [German Federal Statistical Office (2022)](https://www.destatis.de/EN/Themes/Economy/Prices/Consumer-Price-Index/price-kaleidoscope-overview.html) for monitoring price trends of goods and services ... The three short articles published as “Featured graphics” in this issue provide excellent examples of what we are looking for in future submissions.<br />
>  
>  ——***Environment and Planning B: Urban Analytics and City Science*** Editorial, [First Published April 19, 2022](https://doi.org/10.1177/23998083221096895)

## Installation

Use the following code to install from GitHub.

```bash
devtools::install_github("Zhibin-Xu/MigrationKaleidoscope")
```

## Usage
The package requires 4 compulsory parameters:
- **data_name:** the name of the csv file for data input, such as **"xx.csv"**. 
- **label_level:** the level of the hierarchical data to be used for labeling, such as **2**.
- **color_palette_original:** the hex color codes for representing different groups of data, should be of the same length as the labeled level, such as **c("#ee3437","#0081c1","#9d55a2","#0bae57")**.
- **year:** the year selected to present the data, should be one of the **year** column elements.<br />

as well as 3 optional parameters:
- **seed:** the seed to initiate the Kaleidoscope diagram, for different seeds give rise to different or even zero patterns, depending on the convergence of the state.
- **title:** the title for the stacked barplots, should be in quotes.
- **subtitle:** the subtitle for the stacked barplots, should also be in quotes.
 
## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
