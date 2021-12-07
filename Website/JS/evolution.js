document.getElementById("changeRed").onclick = function changeColor(){
document.getElementById("output").style.color = "red";
}

function view(){
var category = document.getElementsByClassName("subcategory");
for (var i=0; i < elements.length; i++){
    if((" " + elements[i].className + " ").indexOf(" " + cssClass + ' ') > -1){
        return elements[i];
    }
}
} 