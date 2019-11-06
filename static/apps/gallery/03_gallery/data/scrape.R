library(rvest)
library(tidyverse)
library(polite)

read_paintings <- function(web, page){
  site <- scrape(nod(web, paste0("all-paintings?page=", page)))
  tibble(
    image = basename(html_attr(html_nodes(site, ".painting-holder img"), "src")),
    episode = html_text(html_nodes(site, ".painting-card__meta>span")),
    title = html_text(html_nodes(site, ".painting-card__title")),
    url = html_attr(html_nodes(site, ".painting-holder a"), "href")
  )
}

paintings <- map_dfr(1:17, read_paintings, web = bow("https://www.twoinchbrush.com/"))

dl <- paintings %>% 
  mutate(dl = map2(image, episode, 
                   possibly(function(img, ep) {
                     download.file(
                       paste0("https://www.twoinchbrush.com/images/", tools::file_path_sans_ext(img), ".png"),
                       destfile = paste0(ep, ".png"))
                     TRUE
                   }, FALSE)
  ))

paintings %>% 
  mutate(
    image = paste0(episode, ".jpg"),
    title = str_trim(str_remove_all(title, "\\n"))
  ) %>% 
  write_csv("gallery.csv")
