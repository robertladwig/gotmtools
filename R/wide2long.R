#' Converts wide data to long data
#'
#' Convert a dataframe in wide format to long format.
#'
#' @param data dataframe; values loaded with get_vari()
#' @param depths dataframe; depths loaded with get_vari() or vector of depths corresponding to values in the datafra
#' @return dataframe in the same format as the observation file
#' @examples
#' sim_folder <- system.file('extdata', package = 'GOTMr')
#' GOTMr::run_gotm(sim_folder)
#' out <- file.path(sim_folder, 'output', 'output.nc')
#' wtemp <- get_vari(ncdf = out, var = 'temp')
#' z <- get_vari(ncdf = out, var = 'z')
#' df <- wide2long(data = wtemp, depths = z)
#' head(df)
#' @export
wide2long <- function(data, depths){
  tim = rep(data[,1], (ncol(data)-1))
  tim = tim[order(tim)]
  deps = c()
  tmp = c()
  pb = txtProgressBar(min = 0, max = nrow(data), style = 3)
  nc = 2:ncol(data)
  if(length(dim(data)) == length(dim(depths))){
    for(i in 1:nrow(data)){
      deps = append(deps, as.numeric(depths[i,nc]))
      tmp = append(tmp, as.numeric(data[i,nc]))
      setTxtProgressBar(pb, i)
    }
  }else{
    for(i in 1:nrow(data)){
      deps = append(deps, as.numeric(depths))
      tmp = append(tmp, as.numeric(data[i,nc]))
      setTxtProgressBar(pb, i)
    }
  }

  close(pb)
  df = data.frame(date = tim, depths = deps, temp = tmp)
  return(df)
}
