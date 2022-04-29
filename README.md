<h1>MigrationKaleidoscope</h1>

<img src="https://github.com/HengyuGu1994/MigrationKaleidoscope/blob/main/MigrationKaleidoscopeChina.png" width=30% height=30% align="right" />

* Hengyu Gu ([Google Scholar](https://scholar.google.com/citations?user=eqYzq68AAAAJ&hl=ja&oi=sra), [ResearchGate](https://www.researchgate.net/profile/Hengyu-Gu)) <br />
The Chinese University of Hong Kong <br />
* Zhibin Xu ([Google Scholar](https://scholar.google.com/citations?user=rRsBXUAAAAAJ&hl=ja&oi=sra), [ResearchGate](https://www.researchgate.net/profile/Zhibin-Xu-7)) <br />
Macau University of Science and Technology

<p>

<img src="https://img.shields.io/badge/multi-hierarchical-red">

<img src="https://img.shields.io/badge/multi-regional-blue">

<img src="https://img.shields.io/badge/multi-periodical-green">

</p>


------------------------------------------------------------------------

_The MigrationKaleidoscope package aims to generate voronoi- and sunburst-based kaleidoscope diagrams to represent **multihierarchical**, **multiregional** and **multiperiodical** migration data._ <br />

## Introduction
 
In migration networks, the **origin-destination (OD)** bilateral flows and each site’s **in- and outflow volumes** are like two sides of the same coin; though popular visualisation approaches such as the chord diagram excel in describing the former, the latter mostly remains less depicted aspect. <br />

By applying the Voronoi-based migration **Kaleidoscope diagram** and integrating it with the **sunburst treemap** [(Jahn et al., 2021)](https://github.com/m-jahn/WeightedTreemaps), the function visualises migration from different time periods and focalises on the relative status of each migration body as origin or destination. <br />

By attributing different colours to groups and differentiating **in-** and **outflows** with **deep** and **light** shades, information about each body’s weight in the migration network is gained from their size in the diagrams, and variable as well as invariable patterns are observed from the trends. <br />

<p float="left">
  <img src="https://github.com/HengyuGu1994/MigrationKaleidoscope/blob/main/MigrationKaleidoscopeChina.png" width=45% height=45% />
  <img src="https://github.com/HengyuGu1994/MigrationKaleidoscope/blob/main/StackedBarplotChina.png" width=45% height=45% /> 
</p>
<p align="center">Deep color for in-migration, light color for out-migration <br />

Note that the migration concept is also applicable to imports and exports in international trade. <br />
 
<p float="left">
  <img src="https://github.com/HengyuGu1994/MigrationKaleidoscope/blob/main/MigrationKaleidoscopeWorldBank.png" width=45% height=45% />
  <img src="https://github.com/HengyuGu1994/MigrationKaleidoscope/blob/main/StackedBarplotWorldBank.png" width=45% height=45% /> 
</p>
<p align="center">Deep color for in-migration (imports), light color for out-migration (exports)<br />

<p float="left">
  <img src="https://github.com/HengyuGu1994/MigrationKaleidoscope/blob/main/MigrationKaleidoscopeUIS.png" width=45% height=45% />
  <img src="https://github.com/HengyuGu1994/MigrationKaleidoscope/blob/main/StackedBarplotUIS.png" width=45% height=45% /> 
</p>
<p align="center">Deep color for male inbound international students, light color for female inbound international students<br />

See also the chord diagram visualization of International Student Mobility by [Gu and Xu (2022)](https://doi.org/10.1177/0308518X211055180) on Environment and Planning A: Economy and Space, First Published October 30, 2021. 
 
<p float="center">
  <img src="https://github.com/HengyuGu1994/MigrationKaleidoscope/blob/main/ism2014-2018.png" width=75% height=75% />
</p> 
 
## Comments<br />
 
<img src="https://github.com/HengyuGu1994/MigrationKaleidoscope/blob/main/Environment and Planning B_cover.png" width=20% height=20% align="right" />

<p>
 
> [Gu and Xu (2022)](https://doi.org/10.1177/23998083221082916) present a diachronic visualisation of China’s internal migration patterns at the country, region and province level simultaneously. They achieve this through an innovative repurposing and expansion of the Voronoi-based Kaleidoscope diagram developed by the [German Federal Statistical Office (2022)](https://www.destatis.de/EN/Themes/Economy/Prices/Consumer-Price-Index/price-kaleidoscope-overview.html) for monitoring price trends of goods and services ... The three short articles published as “Featured graphics” in this issue provide excellent examples of what we are looking for in future submissions. <br />

——Environment and Planning B: Urban Analytics and City Science Editorial, [First Published April 19, 2022](https://doi.org/10.1177/23998083221096895)<br />

</p> 

## Installation

Use the following code to install from GitHub.

```R
devtools::install_github("HengyuGu1994/MigrationKaleidoscope")
```

## Data Format 

| h1   | h2              | h3            | color | value       | year      |
| ---- | --------------- | ------------- | ----- | ----------- | --------- |
| East | Beijing 4.23    | Beijing-in    | 1     | 3.827759959 | 2005-2010 |
| East | Tianjin 1.71    | Tianjin-in    | 1     | 1.49712     | 2005-2010 |
| East | Hebei 2.94      | Hebei-in      | 1     | 0.924089997 | 2005-2010 |
| East | Shandong 3.35   | Shandong-in   | 1     | 1.335580002 | 2005-2010 |
| East | Jiangsu 6.78    | Jiangsu-in    | 1     | 4.887289935 | 2005-2010 |
...
| East | Beijing 4.23    | Beijing-out   | 2     | 0.405949995 | 2005-2010 |
| East | Tianjin 1.71    | Tianjin-out   | 2     | 0.213359999 | 2005-2010 |
| East | Hebei 2.94      | Hebei-out     | 2     | 2.017390001 | 2005-2010 |
| East | Shandong 3.35   | Shandong-out  | 2     | 2.014989985 | 2005-2010 |
| East | Jiangsu 6.78    | Jiangsu-out   | 2     | 1.893540001 | 2005-2010 |
...
 
 - **The hierarchies:** The hierarchies are named h1, h2 ... etc., note that the level to be labeled can be customized, such as `"Beijing 4.23"` serves both as the second level indicator and a label string. Meanwhile, the lowest level should end with `"-in"` and `"-out"`.
 - **The color:** A numeric series starting from `1` and should be in accordance with the label level. The color column should be sorted in ascending order.
 - **The value:** Values defining the cells' and labels' sizes.
 - **The year:** Year for the time series.
 
## Usage

The package requires 4 compulsory parameters:
- **data_name:** the name of the csv file for data input that has been described above, such as `"xx.csv"`. 
- **label_level:** the level of the hierarchical data to be used for labeling, such as `2`.
- **color_palette_original:** the hex color codes for representing different groups of data, should be of the same length as the labeled level, such as `c("#ee3437","#0081c1","#9d55a2","#0bae57")`.
- **year:** the year selected to present the data, should be one of the `year` column elements such as `"2010-2015"`.<br />

as well as 3 optional parameters:
- **seed:** the seed to initiate the Kaleidoscope diagram, for different seeds give rise to different or even zero patterns, depending on the convergence of the state.
- **title:** the title for the stacked barplots, should be in quotes such as `"xx"`.
- **subtitle:** the subtitle for the stacked barplots, should also be in quotes such as `"xx"`. 
 
 After all parameters are determined, run the following codes with sample data 1:

```R
library(MigrationKaleidoscope)
MigrationKaleidoscope(data_name = "MigrationChina.csv",
                      label_level = 2,
                      color_palette_original = c("#ee3437","#0081c1",
                                                 "#9d55a2","#0bae57"),
                      year = "2010-2015",seed = 114,
                      title = "China's Internal Migration (Million)",
                      subtitle = "source: National Population Census of the People's Republic of China"
)
```

as well as data sample 2:

```R
MigrationKaleidoscope(data_name = "MigrationWorldBank.csv",
                      label_level = 2,
                      color_palette_original = c("#ff1b6b","#2e95a0",
                                                 "#0077c7","#44b77c",
                                                 "#f1c432"),
                      year = "2019",
                      title = "Imports and Exports of goods, services and primary income\n(BoP, current million US$)",
                      subtitle = "source: World Bank"
                      )
```

and data sample 3:

```R
MigrationKaleidoscope(data_name = "MigrationUIS.csv",
                      label_level = 2,
                      color_palette_original = c("#e580bd","#8397c5",
                                                 "#fc8357","#5bbc9c",
                                                 "#9dd349"),
                      year = "2019",
                      title = "Inbound internationally mobile students by gender",
                      subtitle = "source: The UNESCO Institute for Statistics (UIS)"
                      )
```

## Citation

Please cite using this form (APA for example):

> Gu, H., & Xu, Z. (2022). Kaleidoscope visualisation of China’s internal migration, 1985–2020. *Environment and Planning B: Urban Analytics and City Science*. https://doi.org/10.1177/23998083221082916

## Acknowledgements

This package relies greatly on the seminal work of [Michael Jahn, David Leslie and Ahmadou Dicko (2021)](https://github.com/m-jahn/WeightedTreemaps) which makes possible the creation of voronoi and sunburst treemaps. Based on their original version of treemaps, this package integrated voronoi and sunburst diagrams as well as attached circular labels to better illustrate the values of each component. We would like to extend our genuine gratitude to their generous contribution and devotion.
