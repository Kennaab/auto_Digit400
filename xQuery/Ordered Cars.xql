xquery version "3.1";
let $orangutan := collection('/db/auto/')
let $bonobo := $orangutan//entry[built[contains(@when,"19")]]
let $chimpanzee := $bonobo//built
for $c in $chimpanzee
let $gibbon := $c/@when ! data()
order by $gibbon
let $gorilla := $c/preceding::name ! string()
return concat($gorilla,": ", $gibbon, "  ")
