library(xml2)

fs_xml <- "
<Friends>
    <cast>
        <character>Rachel Green</character>
        <star>Jennifer Aniston</star>
    </cast>
        <character>Monica Geller</character>
        <star>Courteney Cox</star>
    <cast>
        <character>Phoebe Buffay</character>
        <star>Lisa Kudrow</star>
    </cast>
    <cast>
        <character>Joey Tribbiani</character>
        <star>Matt LeBlanc</star>
    </cast>
    <cast>
        <character>Chandler Bing</character>
        <star>Matthew Perry</star>
    </cast>
    <cast>
        <character>Ross Geller</character>
        <star>David Schwimmer</star>
    </cast>
</Friends>
"

fs <- read_xml(fs_xml)

fs_name <- xml_name(fs)
fs_name

fs_children <- xml_children(fs)
fs_children

fs_characters <- xml_find_all(fs, xpath = ".//character")
fs_characters

fs_stars <- xml_find_all(fs, xpath = ".//star")
fs_stars

library(magrittr)

fs_characters <- fs %>%
  xml_find_all(xpath = ".//character") %>%
  xml_text()

fs_stars <- fs %>%
  xml_find_all(xpath = ".//star") %>%
  xml_text()

for (i in 1:length(fs_characters)){
  print(paste("誰飾演", fs_characters[i], ":", fs_stars[i]))
}