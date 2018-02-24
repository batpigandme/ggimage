##' geom layer for using nba logo image
##'
##'
##' @title geom_nba
##' @param mapping aes mapping
##' @param data data
##' @param inherit.aes whether inherit aes mapping from ggplot()
##' @param na.rm whether remove NA values
##' @param by one of 'width' or 'height' for specifying size
##' @param ... additional parameter
##' @return ggplot2 layer
##' @export
geom_nba <- function(mapping=NULL, data=NULL, inherit.aes=TRUE,
                     na.rm=FALSE, by="width", ...) {
  geom_image(mapping, data, inherit.aes=inherit.aes, na.rm=na.rm, ..., .fun = slug)
}

slug <- function(slug) {
  paste0('https://raw.githubusercontent.com/batpigandme/ggimage/master/logos/300/', slug, '.png')
}

##' list available team slugs
##'
##'
##' @title list_slugs
##' @return logo vector
##' @export

list_slugs <- function() {
  list.gif("http://github.com/batpigandme/ggimage/blob/master/logos/300")
}

list.gif <- function(url) {
  x <- readLines(url)
  y <- x[grep("title=\"[a-zA-Z0-9\\-]+\\.png", x)]
  sub(".*title=\"([a-zA-Z0-9\\-]+)\\.png.*", '\\1', y)
}
