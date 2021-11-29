xquery version "3.1";
declare variable $autoColl := collection('/db/auto');
declare variable $built := $autoColl//built;
declare variable $timelineSpacer := 10;
declare variable $date := $built/@when ! string() => distinct-values => sort();
(:built issue:)
declare variable $years := $date ! tokenize(., "-")[1] ! xs:integer(.);
declare variable $minYear := $years => min();
declare variable $maxYear := $years => max();
(:this is for the timeline :)
declare variable $svgShenanigans :=
<svg width="2000" height="4000">
<g transform="translate(30,30)">
<line x1="100" y1="0" x2="100" y2='{($maxYear - $minYear)*timelineSpacer}' stroke='green' stroke-width="2"/>
{
for $y in $years 
    
    return
        <g class="year">
        <rect x="100" y="{($y - $minYear) * timelineSpacer}" width="10" height="10" fill="purple"/>
        </g>
}
</g>
</svg>;
$svgShenanigans