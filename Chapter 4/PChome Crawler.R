library(jsonlite)

url <- "http://ecshweb.pchome.com.tw/search/v3.3/all/results?q=macbook%20pro&page=1&sort=rnk/dc"
pchome_query <- fromJSON(url)
names(pchome_query)

pchome_query$totalPage # 總頁數
View(head(pchome_query$prods)) # 預覽，取出頭部，原始數據

page_nums <- 1:pchome_query$totalPage

urls <- paste("http://ecshweb.pchome.com.tw/search/v3.3/all/results?q=macbook%20pro&page=", page_nums, "&sort=rnk/dc", sep = "")
name <- c()
description <- c()
price <- c()

for (i in 1:5){
  single_page_query <- fromJSON(urls[i])
  name <- c(name, single_page_query$prods$name)
  description <- c(description, single_page_query$prods$describe)
  price <- c(price, single_page_query$prods$price)
  Sys.sleep(sample(2:5, size = 1))
}

mbp_df <- data.frame(name, description, price) # 資料框
View(head(mbp_df)) # 預覽，取出頭部，處理後