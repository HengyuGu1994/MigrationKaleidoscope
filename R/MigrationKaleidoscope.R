# Define function
MigrationKaleidoscope <- function(data_name, label_level,
                                  color_palette_original,
                                  year,seed=NULL,
                                  title=NULL,subtitle=NULL) {

  devtools::install_github("m-jahn/WeightedTreemaps")
  library(WeightedTreemaps)
  library(circlize)
  library(dplyr)
  library(tidyr)
  library(ggplot2)
  library(ggalt)
  library(ggplotify)
  library(gridExtra)
  library(cowplot)
  library(grid)
  library(stringr)
  library(colorspace)
  suppressPackageStartupMessages(library(circlize))
  options(warn=-1)

  # Treat data set
  data = read.csv(data_name)
  data = data %>% filter (data$value > 0)

  # Replace label space with carriage return
  label_name = paste0("h",label_level)
  new_label <- rep(NA, 0)
  for (i in data[label_name]){
    i <- gsub(" ", "\n", i)
    new_label <- append(new_label,i)
  }
  data[label_name] <- new_label

  # Get levels
  levels <- rep(NA, 0)
  for (i in colnames(data)) {
    if (grepl('h',i)) {
      levels <- append(levels, i)
    }
  }

  last_level = tail(levels, n=1)
  data <- separate(data, last_level,
                   c("place","inout"),
                   sep = "-", remove = FALSE,
                   convert = FALSE,
                   extra = "warn", fill = "warn")

  # Define color palette
  color_palette <- rep(NA, 0)
  for (i in color_palette_original) {
    color_palette <- append(color_palette, c(i, lighten(i, 0.4)))
  }

  # Generate sunburst data
  data_sunburst = aggregate(data$value,
                            list(paste(data$color,"&",data$year)),
                            FUN=sum)
  data_sunburst <- separate(data_sunburst, "Group.1",
                            c("color","year"),
                            sep = " & ",
                            remove = FALSE,
                            convert = FALSE,
                            extra = "warn",
                            fill = "warn")
  data_sunburst = data_sunburst %>% filter (data_sunburst$x > 0)

  # Define year
  i = year

  # Output PDF of MigrationKaleidoscope
  pdf(file = paste0("MigrationKaleidoscope.pdf"),
      bg = "transparent",
      height=1000/72,
      width=1000/72)

  # Generate sunburst treemap
  tm <- sunburstTreemap(
    data = data_sunburst %>% filter (data_sunburst$year == i),
    levels = "color", cell_size = "x",
    diameter_inner = 0.9, diameter_outer = 1.05
  )

  drawTreemap(tm,
              legend = F, add = T,
              border_size = 1, border_color = "white",
              color_palette = color_palette,
              color_level = 1, label_level = NULL,
              label_size = 1,
              label_color = "black",
              color_type = "categorical",
  )

  # Generate voronoi treemap
  seed = seed
  tm01 <- WeightedTreemaps::voronoiTreemap(
    data = data %>% filter (data$year == i),
    levels = levels, cell_size = "value",
    shape = "circle", seed = seed, custom_color = "color",
    positioning = "regular", error_tol = 0.1
  )

  drawTreemap(border_size = c(8,1,1),
              label_level = label_level,
              color_level = 3,
              legend = F, color_type = "custom_color",
              border_color = "white",
              color_palette = color_palette,
              tm01, label_size = 9, label_color = "black",
              width = 0.85, height = 0.85, add = T
  )

  # Draw sunburst labels
  for (i in data_sunburst$color){
    name = paste('LEVEL1_',i,sep='')
    cells = slot(tm,"cells")[name]
    coordinates_sunburst = as.data.frame(cells[[name]][["poly"]][[1]])
    x = mean(coordinates_sunburst$V1)/2-500
    y = mean(coordinates_sunburst$V2)/2-500

    rad=atan(y/x)
    if ((x<0 && y>0) || (x<0 && y<0)) {
      rad = pi+rad
    } else if ((x>0 && y<0)) {
      rad = 2*pi+rad
    }

    deg=rad/pi*180

    if (deg<180){
      deg = deg-90
    } else {
      deg = deg+90
    }

    number = (data_sunburst %>% filter (data_sunburst$color == i))$x
    round = round(number, digits=2)

    grid.text(round,
              x=500+cos(rad)*450,
              y=500+sin(rad)*450,
              default = "native",
              rot=deg)
  }

  dev.off()

  # Draw Stacked Barplots
  data$legend <- str_c(data$h1,"-",data$inout)

  StackedBarplot <- ggplot(data_sunburst,aes(fill=color,
                                             y=x,
                                             x=year)) +
    theme_classic()+
    geom_bar(position="stack", stat="identity")+
    labs(
      x = "Year",
      y = "Internal Migration",
      title = title,
      subtitle = subtitle
    )+
    scale_fill_manual(values=color_palette,
                      name = "Type",
                      labels = unique(data$legend))

  ggsave("StackedBarplot.png", plot=StackedBarplot)

}

MigrationKaleidoscope(data_name = "MigrationChina.csv",
                      label_level = 2,
                      color_palette_original = c("#ee3437","#0081c1",
                                                 "#9d55a2","#0bae57"),
                      year = "2010-2015",seed = 114,
                      title = "China's Internal Migration (Million)",
                      subtitle = "source: National Population Census of the People's Republic of China"
)
