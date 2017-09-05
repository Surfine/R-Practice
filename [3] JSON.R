library(jsonlite)

# Example 1
friends <- '{
              "genre": "Sitcom",
              "seasons": 10,
              "episodes": 236,
              "stars": ["Jennifer Aniston", "Courteney Cox", "Lisa Kudrow", "Matt LeBlanc", "Matthew Perry", "David Schwimmer"]
            }'

list <- fromJSON(friends)
paste("六人行的季數:", list$seasons)
paste("六人行的集數:", list$episodes)
paste("誰飾演 Chandler Bing?", list$stars[5])

# Example 2
best_chicago_bulls <- '{
                         "season": "1995-96",
                         "wins": 72,
                         "losses": 10,
                         "head_coach": "Phil Jackson",
                         "starting_five": ["Scottie Pippen", "Dennis Rodman", "Luc Longley", "Ron Harper", "Michael Jordan"]
                       }'

list <- fromJSON(best_chicago_bulls)
sprintf("芝加哥公牛隊 1995-96 賽季的勝率: %f", list$wins / (list$wins + list$losses))
sprintf("最喜歡之球員: %s", list$starting_five[5])

# Example 3
friends_starring <- '[
                       {
                         "character": "Rachel Green",
                         "star": "Jennifer Aniston"
                       },

                       {
                         "character": "Monica Geller",
                         "star": "Courteney Cox"
                       },

                       {
                         "character": "Phoebe Buffay",
                         "star": "Lisa Kudrow"
                       },

                       {
                         "character": "Joey Tribbiani",
                         "star": "Matt LeBlanc"
                       },

                       {
                         "character": "Chandler Bing",
                         "star": "Matthew Perry"
                       },

                       {
                         "character": "Ross Geller",
                         "star": "David Schwimmer"
                       }
                     ]'
  
fs_df <- fromJSON(friends_starring)
for (i in 1:nrow(fs_df)){
  print(paste("誰飾演", fs_df[i, "character"], ":", fs_df[i, "star"]))
}

# Example 4
best_cb_starting_five <- '[
                         {
                           "pos": "SF",
                           "player": "Scottie Pippen"
                         },

                         {
                           "pos": "PF",
                           "player": "Dennis Rodman"
                         },

                         {
                           "pos": "C",
                           "player": "Luc Longley"
                         },

                         {
                           "pos": "PG",
                           "player": "Ron Harper"
                         },

                         {
                           "pos": "SG",
                           "player": "Michael Jordan"
                         }
                      ]'

cb_sf <- fromJSON(best_cb_starting_five)
for (i in 1:nrow(cb_sf)){
  cat(paste("位置:", cb_sf[i, "pos"], "\t", "球員:", cb_sf[i, "player"], "\n"))
}