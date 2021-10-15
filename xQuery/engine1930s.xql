xquery version "3.1";
let $potato := collection('/db/auto/')
let $carrots := $potato//entry[built[contains(@when,"193")]]
let $corn := $carrots//built
for $c in $corn
let $pepper := $c/@when ! data()
let $asparagus := $c/following::enginePower/@quant ! data()
let $beet := $c/preceding::name ! string()
return concat($beet,": ", $pepper, ': ', $asparagus, " kW")
