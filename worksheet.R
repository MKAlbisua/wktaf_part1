
library(icesTAF)

taf.skeleton()

icesTAF::dir.tree()

data(trees)

draft.data(
  data.files = "trees.csv",
  data.scripts = NULL,
  originator = "Ryan, T. A., Joiner, B. L. and Ryan, B. F. (1976) The Minitab Student Handbook. Duxbury Press.",
  title = "Diameter, Height and Volume for Black Cherry Trees",
  file = TRUE, # FALSE para verlo en la consola lo que hace
  append = FALSE # create a new DATA.bib
)


taf.bootstrap() 

write.taf(trees, dir = "boot/initial/data") # hace csv de tu objeto

taf.bootstrap() 

# any file in bootstrap>data is create by this taf, (has a metadata),
#while any file in initial>data is input data (local, lo que no puede traerse por online)


data(trees)
data(cars)
# make the directory we want to write to
mkdir("boot/initial/data/my-collection")
# save files there
write.taf(trees, dir = "boot/initial/data/my-collection")
write.taf(cars, dir = "boot/initial/data/my-collection")

draft.data()

#draft.data(file = TRUE)
#draft.data(originator = "WGEF")
#draft.data(c(source="ICES", originator = "WGEF"))


# get a folder

draft.data(
  data.files = "my-collection",
  data.scripts = NULL,
  originator = "R datasets package",
  title = "Collection of R data",
  source = "folder",
  file = TRUE, # FALSE to see in the console
  append = TRUE # add on to existing DATA.bib
)

taf.boot()
dir.tree()


# get.nc data

draft.data(
  data.files = "HadSST.4.0.1.0_median.nc",
  data.scripts = NULL,
  originator = "UK MET office",
  title = "Met Office Hadley Centre observations datasets",
  year = 2022,
  source = "https://www.metoffice.gov.uk/hadobs/hadsst4/data/netcdf/HadSST.4.0.1.0_median.nc",
  file = TRUE,
  append = TRUE
)

taf.boot()
#taf.boot(taf = TRUE) # to see newer version


# get ospar script to download ospar areas zip

cat('library(icesTAF)
library(sf)

download(
  "https://gis.ices.dk/shapefiles/OSPAR_Subregions.zip"
)

unzip("OSPAR_Subregions.zip")
unlink("OSPAR_Subregions.zip")

areas <- st_read("OSPAR_subregions_20160418_3857.shp")

# write as csv
st_write(
  areas, "ospar-areas.csv",
  layer_options = "GEOMETRY=AS_WKT"
)

unlink(dir(pattern = "OSPAR_subregions_20160418_3857"))
',
file = "boot/ospar-areas.R"
)

draft.data(
  data.files = NULL,
  data.scripts = "ospar-areas.R",
  originator = "OSPAR",
  title = "OSPAR areas",
  file = TRUE,
  append = TRUE
)

deps() # te dice las depencias del argumento
deps("boot", installed = FALSE)
install.deps("boot")


#?download
#download.file(url, mode = "wb")

# correr script ospar-areas.R
# head(areas)

#plot(areas[2])
#dir(pattern = "OSPAR_subregions_20160418_3857")
#unlink(dir(pattern = "OSPAR_subregions_20160418_3857"))

# get some assessment data

#draft.data(data.files = NULL)

draft.data(
  data.files = NULL,
  data.scripts = "sd.R",
  originator = "",
  title = "",
  file = TRUE, # true para que te salga en el taf.boot
  append = TRUE
)

taf.boot()

# get web service data

?icesSD #stock database
# https://sid.ices.dk/services/
#datacategory
# https://sid.ices.dk/services/datacategory/1/2015 







