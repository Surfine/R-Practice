# 正規表達式 x regexpr()

# 搜尋第一個
sentence <- "Monica has 11 or 13, maybe 15 categories of towels?"
gregexpr(pattern = "[0-9]+", sentence)