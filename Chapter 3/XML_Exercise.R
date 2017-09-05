library(xml2)
library(magrittr)

cb_xml <- "
<cb>
<startfive>
<position>SF</position>
<player>Scottie Pippen</player>
</startfive>
<startfive>
<position>PF</position>
<player>Dennis Rodman</player>
</startfive>
<startfive>
<position>C</position>
<player>Luc Longley</player>
</startfive>
<startfive>
<position>PG</position>
<player>Ron Harper</player>
</startfive>
<startfive>
<position>SG</position>
<player>Michael Jordan</player>
</startfive>
</cb>
"

cb <- read_xml(cb_xml)
cb <- cb_xml %>% read_xml()

cb_positions <- cb %>%
  xml_find_all(xpath = ".//position") %>%
  xml_text

cb_players <- cb %>%
  xml_find_all(xpath = ".//player") %>%
  xml_text

for (i in 1:length(cb_positions)) {
  print(sprintf("%s 的位置: %s", cb_players[i], cb_positions[i]))
}

for (i in 1:length(cb_positions)){
  print(paste(cb_players[i], "的位置:", cb_positions[i]))
}