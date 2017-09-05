library(rvest)

ptt_specific_article_crawler <- function(url){
  ptt <- read_html(url)
  
  author <- ".article-metaline:nth-child(1) .article-meta-value"
  title <- ".article-metaline-right+ .article-metaline .article-meta-value"
  time <- ".article-metaline+ .article-metaline .article-meta-value"
  main_content <- "#main-content"
  ip <- ".richcontent+ .f2"
  push_tag <- ".push-tag"
  push_id <- ".push-userid"
  push_content <- ".push-content"
  push_time <- ".push-ipdatetime"
  
  info <- list()
  css_selectors <- c(author, title, time, main_content, ip, push_tag, push_id, push_content, push_time)
  for (i in 1:length(css_selectors)){
    article_content <- ptt %>%
      html_nodes(css = css_selectors[i]) %>%
      html_text()
    info[[i]] <- article_content
  }
  names(info) <- c("author", "title", "time", "main_content", "ip", "push", "push_id", "push_content", "push_time")
  # Cleaning contents
  info$main_content <- info$main_content %>%
    gsub(pattern = "\n", ., replacement = "") %>%
    gsub(pattern = "作者.+:[0-9]{2}\\s[0-9]{4}", ., replacement = "") %>%
    gsub(pattern = "※ 發信站:.+", ., replacement = "")
  
  ip_start <- regexpr(pattern = "[0-9]+", info$ip)
  info$ip <- gsub(pattern = "\n", info$ip, replacement = "")
  ip_end <- nchar(info$ip)
  info$ip <- substr(info$ip, start = ip_start, stop = ip_end)
  
  info$push <- gsub(pattern = "\\s", info$push, replacement = "")
  info$push_id <- gsub(pattern = "\\s", info$push_id, replacement = "")
  info$push_content <- info$push_content %>%
    gsub(pattern = "\\s", ., replacement = "") %>%
    gsub(pattern = ":", ., replacement = "")
  info$push_time <- info$push_time %>%
    gsub(pattern = "^\\s", ., replacement = "") %>%
    gsub(pattern = "\n", ., replacement = "")
  
  return(info)
}

article_url <- "https://www.ptt.cc/bbs/Cross_Life/M.1491379760.A.163.html"
article_info <- ptt_specific_article_crawler(article_url)
article_info

library(rvest)
library(httr)

ptt_index_crawler <- function(url){
  ptt_index_html_doc <- url %>%
    GET(set_cookies(over18 = 1)) %>%
    read_html()
  nrec_xpath <- "//div[@class='nrec']"
  title_xpath <- "//div[@class='title']"
  id_xpath <- "//div[@class='meta']/div[@class='author']"
  article_info <- list()
  columns <- c(nrec_xpath, title_xpath, id_xpath)
  for (i in 1:length(columns)){
    content <- ptt_index_html_doc %>%
      html_nodes(xpath = columns[i]) %>%
      html_text()
    article_info[[i]] <- content
  }
  names(article_info) <- c("nrec", "title", "author_id")
  article_info$title <- gsub(pattern = "\n\t+\n\t+", article_info$title, replacement = "")
  return(article_info)
}

ptt_gossiping_index <- ptt_index_crawler("https://www.ptt.cc/bbs/Gossiping/index.html")
ptt_nba_index <- ptt_index_crawler("https://www.ptt.cc/bbs/NBA/index.html")