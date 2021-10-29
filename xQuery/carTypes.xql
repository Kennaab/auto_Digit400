xquery version "3.1";
declare variable $autocoll := collection('/db/auto/')/*;
let $digTheStyle := $autocoll//bodyStyle
let $distinct := distinct-values($digTheStyle)
for $d in $distinct
return
<li>
    {$d}
    </li>
