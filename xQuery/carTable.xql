xquery version "3.1";
declare variable $autocoll := collection('/db/auto/')/*;
declare variable $built := $autocoll//built;
declare variable $year := $built/@when ! string() =>  distinct-values() => sort();
declare variable $carDistinctNames := $autocoll//name ! base-uri(.) ! tokenize(., '/')[last()] ! substring-before(., '.xml');
declare variable $thisFileContent :=
<html> 
    <head>
        <title>Table of Years with Cars Manufactured</title>
    </head>
    <body>
        <h1>Table of Years with Cars Manufactured</h1>
    <label for="year">Choose the year!</label>
    <input id="year" list="nissan-years"/>
    <datalist id="nissan-years">
       {for $y in $year
       return
           <option id="nissan_y{$y}" value="{$y}"/>
       }
     </datalist>
     
     <label for="car">Choose a car</label>
    <input id="car" list="nissan-cars"/>
    <datalist id="nissan-cars">
       {for $c in $carDistinctNames
       return
           <option id="car_{$c}" value="{$c}"/>
       }
     </datalist>
       
{

for $y in $year
let $names:= $autocoll[.//built/@when= $y]//name
return 
<table id="y{$y}">
    <tr>
      
        <th class="year">Year: {$y}</th>
        <td><table>
               <tr>
                   <th>Car Name</th>
                   <th>Dimensions</th>
                   <th>Engine Info</th>
                   <th>Engine Power</th>
                   <th>Curb Weight</th>
                   <th>Top Speed</th>
                    <th>Body Style</th>
               </tr>
           {
               for $n in $names
               let $carid := $n/base-uri(.) ! tokenize(., '/')[last()] ! substring-before(., '.xml')
               (:ebb: This $carid variable is making a car id out of your filename for this car.:)
               let $dimension-l := $n/following::dimensions/@length ! data()
               let $dimension-w := $n/following::dimensions/@width ! data()
               let $dimension-h := $n/following::dimensions/@height ! data()
               let $dimension-u := $n/following::dimensions/@unit ! string()
               let $engine-quant := $n/following::engine/@quant ! data()
               let $engine-quant-u := $n/following::engine/@unit ! string()
               let $enginePower := $n/following::enginePower/@quant ! data()
               let $enginePower-u := $n/following::enginePower/@unit ! string()
               let $curbWeight-q := $n/following::curbWeight/@quant ! data()
               let $curbWeight-u := $n/following::curbWeight/@unit ! string()
               let $topSpeed-q := $n/following::topSpeed/@quant ! data()
               let $topSpeed-u := $n/following::topSpeed/@unit ! string()
               let $bodyStyle := $n/following::bodyStyle ! string()
               

           return
               <tr id="{$carid}">
               <td>{$n/text()}</td>
               <td><ul>
                      <li>Length: {$dimension-l} {$dimension-u}</li>
                      <li>Width:  {$dimension-w} {$dimension-u}</li>
                      <li>Height: {$dimension-h} {$dimension-u}</li>
                   </ul>
               </td>
               <td>{$engine-quant}-{$engine-quant-u}</td>
               <td>{$enginePower} {$enginePower-u}</td>
               <td>{$curbWeight-q} {$curbWeight-u}</td>
               <td>{$topSpeed-q} {$topSpeed-u}</td>
               <td> {$bodyStyle}</td>
               </tr>
               
           }
           </table>
           </td>
    </tr>
</table>    
}
 
</body>
</html> ;

let $filename := "cartables.html"
let $doc-db-uri := xmldb:store("/db/auto-queries", $filename, $thisFileContent, "html")
return $doc-db-uri
(:  :Output at http://newtfire.org:8338/exist/rest/db/auto-queries/cartables.html :)
