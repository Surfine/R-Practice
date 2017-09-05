library(rvest)

ptt_specific_board_crawler <- function(url){
  ptt <- read_html(url)
  
  nrec_css <- ".nrec"
  title_css <- ".title"
  author_css <- ".author"
  
  info <- list()
  selectors <- c(nrec_css, title_css, author_css)
  
  for (i in 1:length(selectors)){
    content <- ptt %>%
    html_nodes(css = selectors[i]) %>%
    html_text()
    info[[i]] <- content
  }
  
  names(info) <- c("nrec", "title", "author")
  info$title <- gsub(pattern = "\n\t+\n\t+", replacement = "", info$title)
  return(info)
}

tsinghua <- ptt_specific_board_crawler("https://www.ptt.cc/bbs/Cross_Life/index.html")
tsinghua$nrec
tsinghua$title
tsinghua$author