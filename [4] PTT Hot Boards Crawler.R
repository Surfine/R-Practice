library(rvest)

ptt_hotboards_crawler <- function(){
  url <- "https://www.ptt.cc/bbs/hotboards.html"
  ptt <- read_html(url)
  
  name_css <- ".board-name"
  viewer_css <- ".hl"
  category_css <- ".board-class"
  title_css <- ".board-title"
  link_css <- ".board"
  
  board_columns <- list()
  seletor_list <- c(name_css,viewer_css,category_css,title_css,link_css)
  
  for (i in 1:length(seletor_list)){
    if (i == 5) board_columns[[i]] <- ptt %>% html_nodes(css = seletor_list[i]) %>% html_attr("href")
    else board_columns[[i]] <- ptt %>% html_nodes(css = seletor_list[i]) %>% html_text()
  }
  
  board_columns[[5]] <- paste("https://www.ptt.cc",board_columns[[5]],sep = "")
  
  names(board_columns) <- c("name","viewer","category","title","link")
  return(board_columns)
}