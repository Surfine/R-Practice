# 正規表達式 x sub()

# 取代第一個
sentence <- "Monica has 11 or 13, maybe 15 categories of towels?"
sub(pattern = "[0-9]+", sentence, replacement = "???")