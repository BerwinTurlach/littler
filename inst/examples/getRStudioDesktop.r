#!/usr/bin/r
#
# based on earlier https://raw.githubusercontent.com/rocker-org/rstudio-daily/master/latest.R

## go to /tmp
setwd("/tmp")

## within _desktop_ one of _fedora32_, _fedora64_, _mac_, _ubuntu32_, _ubuntu64_, _windows_
url <- "http://www.rstudio.org/download/daily/desktop/ubuntu64/"

## get page and parse
pg <- httr::content(httr::GET(url), as = "text")
doc <- xml2::read_xml(pg)
deb <- xml2::xml_attr(xml2::xml_find_all(doc, "//tr[@id='row0']/td/a[@href]"), "href")

## download and save under given filename
download.file(deb, basename(deb), method="wget")
