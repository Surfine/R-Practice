# 正規表達式 x grepl()

# 判斷浮點數
sentence <- c("半程馬拉松: 21 公里", "全程馬拉松: 42.195 公里")
grepl(pattern = "[0-9]+\\.[0-9]+", sentence)

# 判斷英文
sentence <- c("半程馬拉松: 21km", "全程馬拉松: 42.195 公里")
grepl(pattern = "[A-Za-z]+", sentence)

# 判斷郵箱
sentence <- c("Chandler Bing", "chandler.bing@friends.com")
grepl(pattern = "[a-zA-Z0-9_\\.]+@[a-zA-Z0-9\\._]+", sentence)

# 判斷網址
sentence <- c("https://chandler.com", "cb@friends.com")
grepl(pattern = "http(s)?://[a-zA-Z0-9\\./_]+", sentence)

# 練習：向量中，幾個元素有浮點數？
distances <- c("0.4", "1", "3", "5", "10", "21", "42.195")
sum(grepl(pattern = "[0-9]+\\.[0-9]+", distances))

# 特殊字元 "." 可以表示任何字元
words <- c("", " ", "abc", "123", "@")
grepl(pattern = ".", words)

# 跳脫特殊字元 "."
words <- c("Chandler Bing", "chandler.bing")
grepl(pattern = "\\.", words)

# 比對開頭文字 "^"
words <- c("Bing", "Geller", "Green", "Buffay", "Tribbiani")
grepl(pattern = "^T", words)

# 比對結束文字 "$"
sentences <- c("Monica", "darling", "it's", "Amanda", "calling")
grepl(pattern = "ing$", sentences)

# 出現零次或多次 "*"
words <- c("friends", "frriends", "fantasy", "Friends")
grepl(pattern = "fr*", words)

# 出現一次或多次 "+"
words <- c("friends", "frriends", "fantasy", "Friends")
grepl(pattern = "fr+", words)

# 出現零次或一次 "?"
words <- c("friends", "fantasy")
grepl(pattern = "fr?", words)

# 出現特定次 "{}"
words <- c("x", "y", "xx", "xxx")
grepl(pattern = "x{3}", words)
grepl(pattern = "x{1,3}", words)
grepl(pattern = "x{1,}", words)
grepl(pattern = "x{,3}", words)

# 包含特定文字 "[]"
sentences <- c("3人行必有我師", "I love Friends", "最喜歡 CENTRAL PERK", "老子喜歡那個咖啡館")
grepl(pattern = "[0-9]", sentences) # 是否含數字
grepl(pattern = "[0-9a-z]", sentences) # 是否含數字與小寫英文
grepl(pattern = "[0-9a-zA-Z]", sentences) # 是否含數字與英文

# 不包含特定文字 "[^]"
words <- c("10", "Friends", "三人行")
grepl(pattern = "[^0-9]", words) # 非數字
grepl(pattern = "[^0-9A-Za-z]", words) # 非數字與非英文

# 比對或 "|"
words <- c("food", "foot", "hood")
grepl(pattern = "foo(d|t)", words)

# 比對換行 "\n"
sentence <- c("Monica darling, it's Amanda calling",
              "Monica darling,
              it's Amanda calling")
grepl(pattern = "\\n", sentence)

# 比對製表符 "\t"
sentence <- c("I love Friends", "I\tlove\tFriends")
writeLines(sentence)
grepl(pattern = "\\t", sentence)

# 比對空白 "\s"
sentence <- c("I love Friends", "I\tlove\tFriends")
writeLines(sentence)
grepl(pattern = "\\t", sentence)

# 練習：將數字遮蔽成 x
price_list <- c("apple: 1.76, orange: 2.56, banana: 0.69")
gsub(pattern = "[0-9]", price_list, replacement = "x")

# 練習：從中選出 foot/boot/hoot
words <- c("foot", "zoot", "hoot", "boot", "food")
subset_logic <- grepl(pattern = "(f|b|h)oot", words)
words[subset_logic]