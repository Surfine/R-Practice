# 正規表達式 x strsplit()

# 斷詞
sentence <- "Joey: This guy says hello, I wanna kill myself."
strsplit(sentence, split = "[: ,.]+", sentence)