% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/load_input.R
\name{load_input}
\alias{load_input}
\title{Load inflow input files}
\usage{
load_input(input_file, header = F, sep = "\\t", tz = "UTC")
}
\arguments{
\item{input_file}{observation file; File path to ACPy observation file containing the time, depths and values of observations}

\item{header}{logical; file contains the names of the variables as its first line. Defaults to FALSE}

\item{sep}{character; the delimiter in the file. Defaults to tab.}

\item{tz}{Assigns timezone to the DateTime column. Defaults to 'UTC'}
}
\value{
Dataframe of observation data for ACPy
}
\description{
Load observations which are used for calibration, for plotting in a heatmap
}
