# HTML x readLines()

library(magrittr)

fs_script <- readLines("http://livesinabox.com/friends/season1/101pilot.htm")
# head(fs_script)

character_pattern <- "Joey:|Monica:|Ross:|Rachel:|Chandler:|Phoebe:"
found_character <- grepl(pattern = character_pattern, fs_script)
character_script <- fs_script[found_character]
length(character_script)

table_result <- character_script %>%
  gsub(pattern = "<p(>|.*)(<b>|<strong>)", replacement = "") %>%
  gsub(pattern = "(</b>|</strong>).*", replacement = "") %>%
  gsub(pattern = "(:\\s)|:", replacement = "") %>%
  table()
sort(table_result, decreasing = TRUE)
barplot(sort(table_result, decreasing = TRUE), las = 1, cex.names = 0.7, main = "Number of Scripts in Episode 1, Season 1")

# HTML x rvest

library(rvest)

url <- "http://www.imdb.com/title/tt0111161/"
shawshank <- read_html(url)
# read_html() 的本質: class(shawshank), mode(shawshank)

rating <- shawshank %>% html_nodes(css = "strong span") %>%
          html_text() %>% as.numeric()
rating <- shawshank %>% html_nodes(xpath = "//strong/span") %>%
          html_text() %>% as.numeric()
# CSS 與 XPath 二種選擇方式等效
rating

characters <- shawshank %>% html_nodes(css = ".itemprop .itemprop") %>%
              html_text()
characters