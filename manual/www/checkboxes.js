var checkboxes = {};

function uncheckAll(status)
{
  for(var key in checkboxes) {
     checkboxes[key][0].checked = status;
     checkboxes[key][1].checked = status;
  }
}


function toggleCheckbox(box, which)
{
    var tmp = checkboxes[ box.value ][which];
//  alert(box + " " + box.value + " " + which + " " + box.checked + " " + checkboxes[ box.value ].length);	
    tmp.checked = box.checked;
}


function createCheckboxes(els, parent)
{
   var p = document.getElementById(parent);
   for(var i = 0; i < els.length; i++) {
     if(typeof els[i] === 'string') {
        var div = document.createElement('div');
        div.class= 'checkbox';
        div.innerHTML = '<label><input type="checkbox" name="issuevect" id="proxy_issuevect_' + els[i] + '"value="' + els[i] + '" checked="checked" onchange="toggleCheckbox(this, 0)"/><span>' + els[i] + '</span> </label> </div>';
        p.appendChild(div);
        checkboxes[ els[i] ][1] =  document.getElementById('proxy_issuevect_' + els[i]);

     } else {
	  createCheckboxes(els[i], parent + (i+1));
     }
   }
}