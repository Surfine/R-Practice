library(xml2)
library(rvest)

url <- "https://tw.stock.yahoo.com/d/i/rank.php?t=pri&e=tse"
tse <- read_html(url)

# stock_description <- tse %>% html_nodes(css = ".name") %>% html_text()
stock_description <- tse %>% html_nodes(xpath = "//td[@class='name']") %>% html_text()
stock_description

# stock_price <- tse %>% html_nodes(css = ".name+ td") %>% html_text() %>% as.numeric()
stock_price <- tse %>% html_nodes(xpath = "//table[2]/tbody/tr/td[3]") %>% html_text() # %>% as.numeric()
stock_price

stock_name_split <- strsplit(stock_description, split = " ")
stock_ticker <- c()
stock_name <- c()
for (i in 1:length(stock_name_split)){
  stock_ticker[i] <- stock_name_split[[i]][1]
  stock_name[i] <- stock_name_split[[i]][2]
}
stock_ticker
stock_name

stock_frame <- data.frame(ticker = stock_ticker, name = stock_name, price = stock_price)
View(stock_frame)