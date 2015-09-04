/*
 * helper.js 
 */

function currencyFormat(fld, milSep, decSep, e) {
	var sep = 0;
	var key = '';
	var i = j = 0;
	var len = len2 = 0;
	var strCheck = '0123456789';
	var aux = aux2 = '';
	var whichCode = (window.Event) ? e.which : e.keyCode;
	if (whichCode == 13) return true;  // Enter
	if (whichCode == 8) return true;  // Delete (Bug fixed)
	key = String.fromCharCode(whichCode);  // Get key value from key code
	if (strCheck.indexOf(key) == -1) return false;  // Not a valid key
	len = fld.value.length;
	for(i = 0; i < len; i++)
	if ((fld.value.charAt(i) != '0') && (fld.value.charAt(i) != decSep)) break;
	aux = '';
	for(; i < len; i++)
	if (strCheck.indexOf(fld.value.charAt(i))!=-1) aux += fld.value.charAt(i);
	aux += key;
	len = aux.length;
	if (len == 0) fld.value = '';
	if (len == 1) fld.value = '0'+ decSep + '0' + aux;
	if (len == 2) fld.value = '0'+ decSep + aux;
	if (len > 2) {
		aux2 = '';
		for (j = 0, i = len - 3; i >= 0; i--) {
			if (j == 3) {
				aux2 += milSep;
				j = 0;
			}
			aux2 += aux.charAt(i);
			j++;
		}
		fld.value = '';
		len2 = aux2.length;
		for (i = len2 - 1; i >= 0; i--)
			fld.value += aux2.charAt(i);
		fld.value += decSep + aux.substr(len - 2, len);
	}
	return false;
}

function getKeyCode(evt) {
    evt = (evt) ? evt : event;
    var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode : 
        ((evt.which) ? evt.which : 0));
    return charCode;
}

function numberOnKeyPress(evt){ 
    	evt = (evt) ? evt : event;
    	var charCode = getKeyCode(evt);
    
		//allow left arrow,right arrow,point,and digit only masih ada % '
    	if ((charCode > 31 && charCode != 37 && charCode != 39 && charCode != 46) && (charCode < 48 || charCode > 57)) {
        	return false;
    	}
    
    	if(charCode == 46 )
    	    return false;
	    return true;
}

function currencyOnKeyPress(evt,doc) {
    evt = (evt) ? evt : event;
    var charCode = getKeyCode(evt);
    
	//allow left arrow,right arrow,point,and digit only
    if ((charCode > 31 && charCode != 37 && charCode != 39 && charCode != 46) && (charCode < 48 || charCode > 57)) {
        return false;
    }
    
    if(charCode == 46 && doc.value.indexOf(".")>=0)
        return false;
    return true;
}

function currencyOnBlur(evt,doc) {
    evt = (evt) ? evt : event;
    var re = /(.+)(\.)?$/;
    var numString=doc.value;

	if(/.+\.\d$/.test(numString)) {
    	numString += "0";
    }
    else if(re.test(numString) && !/.+\.\d{2}$/.test(numString)) {
    	numString=numString.replace(".","").replace(re,"$1.00");
    }
    doc.value=numString;
}

function stripCommas(numString) {
    var re = /,/g;
    return numString.replace(re,"");
}

function currencyOnKeyUp(evt,doc) {
    evt = (evt) ? evt : event;
    var re = /(-?\d+)(\d{3})/;
    var re2 = /(\d+)(\.\d{2})\d*/;
    var numString=stripCommas(doc.value);
    if(re2.test(numString)) {
        numString=numString.replace(re2,"$1$2");
    }
        
    while (re.test(numString)) {
        numString = numString.replace(re, "$1,$2");
    }
    doc.value=numString;
}
function checkDefaultValue(num) {
	num = num.toString().replace(/\$|\,/g,'');
	if(isNaN(num))
		num = "0";
	sign = (num == (num = Math.abs(num)));
	num = Math.floor(num*100+0.50000000001);
	cents = num%100;
	num = Math.floor(num/100).toString();
	if(cents<10)
		cents = "0" + cents;
	for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
	num = num.substring(0,num.length-(4*i+3))+','+ num.substring(num.length-(4*i+3));
	return (((sign)?'':'-')  + num + '.' + cents);
}