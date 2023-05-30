
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

draft.data(
  data.files = "my-collection",
  data.scripts = NULL,
  originator = "R datasets package",
  title = "Collection of R data",
  source = "folder",
  file = TRUE, # FALSE to see in the console
  append = TRUE # add on to existing DATA.bib
)

taf.boot() #my collection disapperars



