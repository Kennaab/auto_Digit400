function onInput(e) {
    var input = e.target;
    var val = input.value;
    var list = input.getAttribute('list');
    var options = document.getElementById(list).childNodes;
    for (var i=0, length = options.length; i < length; i++)
    { var value = options[i].value;
    if(value === val)
    {
        //just going off what was shown in class
        alert('item selected: ' + val);
        var matchid = options[i].id.split('_')[1]
        console.log("matchid is", matchid );
        var matchTable = document.getElementById(matchid)
        matchTable.scrollIntoView(true);
        break; }
        }
    }
function scrollToTop(){
    var scroll = window.scrollTo(0,0);
}