# 正規表達式 x gregexpr()

# 搜尋所有的
sentence <- "Monica has 11 or 13, maybe 15 categories of towels?"
gregexpr(pattern = "[0-9]+", sentence)