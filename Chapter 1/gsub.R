# gsub(pattern = " ", replacement = "_", sentence)

sentence <- "You threw my hamburger away. My hamburger? My hamburger?"

while(grepl(pattern = " ", sentence) == TRUE){
  sentence <- sub(pattern = " ", replacement = "_", sentence)
}