

#' Makes a standard dataframe for league data
#'
#' @param data_engsoc dataframe from engsoccerdata package
#' @param country spain, italy, germany, england or holland
#'
#' @return dataframe, tibble
#' @export
#'
#' @examples
#' uss_make_matches(engsoccerdata::spain, "Spain")
uss_make_matches <- function(data_engsoc, country) {
  result <-
    data_engsoc %>%
    tibble::as_tibble() %>%
    dplyr::transmute(
      country = as.character(country),
      tier = factor(tier, levels = c("1", "2", "3", "4")),
      season = as.integer(Season),
      date = as.Date(Date),
      home = as.character(home),
      visitor = as.character(visitor),
      goals_home = as.integer(hgoal),
      goals_visitor = as.integer(vgoal)
    )
  result
}
