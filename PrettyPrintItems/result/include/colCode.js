// library used by prettyPrintItems 
function doClick(event) {

    var mark = window.event ?  window.event.srcElement:  event.target;

    while ((mark.className != "ppclick") && (mark.nodeName != "body")) {
        mark = mark.parentNode
    }

    var e = mark;
    while ((e.className != "ppblock") && (e.nodeName != "body")) {
        e = e.parentNode
    }

 // var msg = '0:'+ e.childNodes[0].nodeName+'.'+e.childNodes[0].className+'\n';
 // msg    += '1:'+ e.childNodes[1].nodeName+'.'+e.childNodes[1].className+'\n';
  var s =  ( e.childNodes.length > 2)? 2 : 1;
  if (mark.childNodes[0].nodeValue == "+") {
        mark.childNodes[0].nodeValue = "-";
         for ( var i = s; i < e.childNodes.length; i++) {
    //        msg += i+':'+ e.childNodes[i].nodeName+'.'+e.childNodes[i].className+'\n';
            var name = e.childNodes[i].nodeName;
            if (name != "#text") {
                if (name == "pre" || name == "span") {
                   window.status = "inline";
                   e.childNodes[i].style.display = "inline";
                } else {
                   e.childNodes[i].style.display = "block";
                }
            }
        }
    } else if (mark.childNodes[0].nodeValue == "-") {
        mark.childNodes[0].nodeValue = "+";
         for (var i = s; i < e.childNodes.length; i++) {
   //      msg += i+':'+ e.childNodes[i].nodeName+'.'+e.childNodes[i].className+'\n';
          if (e.childNodes[i].nodeName != "#text" ) {
                 e.childNodes[i].style.display = "none";
            }
         }
     }
//  alert(msg);    
}

