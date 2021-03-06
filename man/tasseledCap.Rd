% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tasseledCap.R
\name{tasseledCap}
\alias{tasseledCap}
\title{Tasseled Cap Transformation}
\usage{
tasseledCap(img, sat, ...)
}
\arguments{
\item{img}{RasterBrick or RasterStack. Input image. Band order must correspond to sensor specifications (see Details and Examples)}

\item{sat}{Character. Sensor; one of: c("Landsat4TM", "Landsat5TM", "Landsat7ETM", "Landsat8OLI", "MODIS"). Case is irrelevant.}

\item{...}{Further arguments passed to writeRaster.}
}
\value{
Returns a RasterBrick with the thee bands: brigthness, greenness, and (soil) wetness.
}
\description{
Calculates brightness, greenness and wetness from multispectral imagery.
Currently implemented Landsat 4 TM, Landsat 5 TM, Landsat 7ETM+, Landsat 8 OLI and MODIS.
}
\details{
Currently implemented: Landsat 4 TM, Landsat 5 TM, Landsat 7ETM+, Landsat 8 OLI and MODIS. Input data must be in top of atmosphere reflectance.
Bands must be available in the correct order and irrelevant bands, such as Landsat Thermal Bands must be removed.
Required bands are:
\tabular{rrr}{
 sat \tab bands \tab coefficients \cr
 Landsat4TM \tab 1,2,3,4,5,7 \tab Crist 1985 \cr
 Landsat5TM  \tab 1,2,3,4,5,7 \tab Crist 1985 \cr
 Landsat7ETM \tab 1,2,3,4,5,7 \tab Huang 2002 \cr
 Landsat8OLI \tab 2,3,4,5,6,7 \tab Baig 2014 \cr
 MODIS \tab 1,2,3,4,5,6,7 \tab Lobser 2007 \cr
}
}
\examples{
library(raster)
data(lsat)

## Run tasseled cap (exclude thermal band 6)
lsat_tc <- tasseledCap(lsat[[c(1:5,7)]], sat = "Landsat5TM")
lsat_tc
plot(lsat_tc)
}

