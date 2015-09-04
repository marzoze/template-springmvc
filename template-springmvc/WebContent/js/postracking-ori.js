
function ltrim(str, chars) {
	chars = chars || "\\s";
	return str.replace(new RegExp("^[" + chars + "]+", "g"), "");
}
 
function rtrim(str, chars) {
	chars = chars || "\\s";
	return str.replace(new RegExp("[" + chars + "]+$", "g"), "");
}

function trim(str, chars) {
	return ltrim(rtrim(str, chars), chars);
}

function changeEvent(eventTogglerId, eventName) {
	var toggler = document.getElementById(eventTogglerId);
	toggler.setAttribute('name', eventName);
	
}

function submitForm(checkboxName, errorMessage) {

	var checkboxes = document.forms[0].elements[checkboxName];

	if(jf_ChkRadioOrCheckBox(checkboxes)) {
		open_dialog_yes_no("Are you sure you want to delete?");
		return false;
	} else {
		open_dialog_ok(errorMessage);
		return false;
	}
}

function submitAprForm(checkboxName, errorMessage) {
	var checkboxes = document.forms[0].elements[checkboxName];

	if(jf_ChkRadioOrCheckBoxAll(checkboxes)) {
		return true;
	} else {
		open_dialog_yes_no(errorMessage);
		return false;
	}
}

function checkAll(obj,idForm)
{
  var objForm = document.getElementById(idForm);;
  var objCtrlState = obj.checked;

  for(i=0;i<objForm.length;i++)
  {
    var objElement = objForm.elements[i];

    if (objElement.name == obj.value)
    {
      objElement.checked = objCtrlState;
    }
  }
}



var IKEP_DATETIME_FORMAT = 'dd-mm-yyyy hh:nn a/p';
var IKEP_DATE_FORMAT = 'dd-mm-yyyy';
var IKEP_TIME_FORMAT = 'hh:nn a/p';

// ------------------------ String function ----------------------------------------
function jf_IsEmpty(psStr)
{
  if(psStr == null || jf_AllTrim(psStr) == "")
    return true;
  else
    return false;
}

function jf_GetByteLength(psStr)
{
  if(jf_IsEmpty(psStr))
  {
    return 0;
  }
  
  var byteLength = 0;

  for (var i = 0; i < psStr.length; i++)
  {
    var oneChar = escape(psStr.charAt(i));

    if (oneChar.length == 1 )
    {
      byteLength ++;
    }
    else if(oneChar.indexOf("%u") != -1)
    {
      byteLength += 2;
    }
    else if (oneChar.indexOf("%") != -1)
    {
      byteLength += oneChar.length/3;
    }
  }

  return byteLength;
}

function jf_AllTrim(psStr)
{
  if(psStr == null)
  {
    return "";
  }

  psStr = psStr+"";
  var sRtnStr = psStr.replace(/^\s*/, "").replace(/\s*$/, "");

  return sRtnStr;
}

function jf_LTrim(psStr)
{
  if(psStr == null)
  {
    return "";
  }
  psStr = psStr+"";
  var sRtnStr = psStr.replace(/^\s*/, "");

  return sRtnStr;
}

function jf_RTrim(psStr)
{
  if(psStr == null)
  {
    return "";
  }
  psStr = psStr+"";
  var sRtnStr = psStr.replace(/\s*$/,"");
}

function jf_LPadding(psStr, piLen, psSeed)
{
  if(psStr == null)
  {
    return "";
  }
  
  var sRtnStr = String(psStr);

  if (jf_GetByteLength(psSeed) != 1)
  {
    return sRtnStr;
  }

  for (var i = 0; i < (piLen - jf_GetByteLength(psStr)); i++)
  {
    sRtnStr = psSeed + sRtnStr;
  }

  return sRtnStr;
}

function jf_RPadding(psStr, piLen, psSeed)
{
  if(psStr == null)
  {
    return "";
  }
  
  var sRtnStr = String(psStr);

  if (jf_GetByteLength(psSeed) != 1)
  {
    return sRtnStr;    
  }

  for (var i = 0; i < (piLen - jf_GetByteLength(psStr)); i++)
  {
     sRtnStr = sRtnStr + psSeed;
  }

  return sRtnStr;
}

function jf_SkipSpaces(psStr)
{
  if(psStr == null)
  {
    return "";
  }
  
  var sRtnStr = "";

  for (var i=0; i< psStr.length; i++)
  {
    if ( (psStr.charAt(i) != " ") && (psStr.charAt(i) != " ") )
    {
      sRtnStr = sRtnStr + psStr.charAt(i);
    }
  }

  return sRtnStr;
}

function jf_SkipZero(psStr)
{
  if(psStr == null)
  {
    return "";
  }

  var sRtnStr = "";

  var pos = 0;
  
  for (var i = 0; i< psStr.length; i++)
  {
    if (psStr.charAt(i) != "0")
    {
      pos = i;
      
      break
    }
  }
  
  sRtnStr = psStr.substr(pos, psStr.length);
  
  return sRtnStr;
}

function jf_GetToken(psStr, psDelimiter, piNth)
{
  if(jf_IsEmpty(psStr))
  {
    return "";
  }
  
  var tokens = psStr.split(psDelimiter);

  if ((piNth <= 0) || (piNth > tokens.length))
  {
    return "";
  }
  else
  {
    return jf_AllTrim(tokens[piNth-1]);
  }
}

function jf_GetToUpperCase(psStr)
{
  return jf_AllTrim(psStr).toUpperCase();
}

function jf_GetToLowerCase(psStr)
{
  return jf_AllTrim(psStr).toLowerCase();
}

function jf_GetCommaNumberString(piNumber)
{
  var sRtnStr = "";
  
  var sNumber = String(piNumber);

  if (sNumber.length > 3)
  {
    var mod = sNumber.length % 3;
    
    sRtnStr += (mod > 0 ? (sNumber.substring(0, mod)) : '');

    for (i=0 ; i < Math.floor(sNumber.length / 3); i++)
    {
      if ((mod == 0) && (i == 0))
        sRtnStr += sNumber.substring(mod+ 3 * i, mod + 3 * i + 3);
      else
        sRtnStr+= ',' + sNumber.substring(mod + 3 * i, mod + 3 * i + 3);
    }

    return sRtnStr;
  }
  else
  {
    return sNumber;
  }
}

//------------------------ HTML function ----------------------------------
function jf_ConvHtmlStr(psStr)
{
  if(jf_IsEmpty(psStr))
  {
    return "";
  }

  var sRtnStr = psStr.replace(/ /g, "&nbsp;");
  
  return sRtnStr;
}

function jf_ControlEnable(psName, pfForm, isEnabled)
{
  var fields = psName.split(",");

  for(var i in fields)
  {
    fields[i] = jf_SkipSpaces(fields[i]);

    if(fields[i] == "" || !pfForm.elements[fields[i]])
    {
      continue;      
    }

    var element = pfForm.elements[fields[i]];

    if(element.type == 'text')
    {    
      element.readOnly = !isEnabled;
    }
    else
    {
      element.disabled = !isEnabled;      
    }
  }
}

function jf_ControlDisplay1(psName, isDisplay)
{
  var fields = psName.split(",");

  for (var i in fields)
  {
    fields[i] = jf_SkipSpaces(fields[i]);    

    if(isDisplay)
    {
      eval(fields[i] + ".style.display = 'block'");
    }
    else
    {
    eval(fields[i] + ".style.display = 'none'");  
    }    
  }
}

function jf_ControlDisplay2(psName)
{
  var fields = psName.split(",");

  for (var i in fields)
  {
    fields[i] = jf_SkipSpaces(fields[i]);    
    
    if(eval(fields[i] + ".style.display") == 'none')
    {
      eval(fields[i] + ".style.display = 'block'");
    }
    else
    {
    eval(fields[i] + ".style.display = 'none'");  
    }    
  }
}

// ------------------------ Date Format function -----------------------------------

//var arrMonthName = new Array('January','February','March','April','May','June','July','August','September','October','November','December');

var arrMonthName = new Array('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');

var arrDayName = new Array('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');

// the date format prototype
Date.prototype.format = function(f)
{   
  if (!this.valueOf())
  {
    return '&nbsp;';
  }

  var dt = this;
    
  return f.replace(/(yyyy|mmmm|mmm|mm|dddd|ddd|dd|hh|nn|ss|a\/p)/gi,       
    function($1)    
    {            
      switch ($1.toLowerCase())           
      {         
        case 'yyyy': return dt.getFullYear();        
        case 'mmmm': return arrMonthName[dt.getMonth()];            
        case 'mmm': return arrDayName[dt.getMonth()].substr(0, 3);            
        case 'mm': return (dt.getMonth() + 1).zf(2);            
        case 'dddd': return arrMonthName[dt.getDay()];
        case 'ddd':  return arrDayName[dt.getDay()].substr(0, 3);
        case 'dd': return dt.getDate().zf(2);            
        case 'hh': return ((h = dt.getHours() % 12) ? h : 12).zf(2);            
        case 'nn': return dt.getMinutes().zf(2); 
        case 'ss': return dt.getSeconds().zf(2);            
        case 'a/p': return dt.getHours() < 12 ? 'am' : 'pm';        
      }        
    }
  );
}

String.prototype.string = function(len)
{   
  var str = '';
  
  var i = 0;
  
  while(i++ < len)
  {
    str += this;
  }
  
  return str;
}

String.prototype.zf = function(len)
{   
  return '0'.string(len - this.length) + this;
}

Number.prototype.zf = function(len)
{   
  return this.toString().zf(len);
}

// -------------------------------- Date function ----------------------------------
function jf_getToDay()
{
  var date = new Date();
  
  var year = date.getFullYear();
  var month = date.getMonth() + 1;
  var day = date.getDate();
    
  if(month<10)
  {
    month = '0' + month;    
  }

  if(day<10)
  {
    day = '0' + day;    
  }
          
  var date = year + "" + month + "" + day;

  return date;
}

function jf_getToDayTime()
{
  var date = new Date();
    
  var hh = date.getHours();
  var mi = date.getMinutes();
  var ss = date.getSeconds();
 
  if(hh<9)
  {
    hh = '0' + hh;      
  }
       
  if(mi<9)
  {
    mi = '0' + mi;      
  }
    
  if(day<9)
  {
    ss = '0' + ss;      
  }
        
  var time = hh + mi + ss;

  return time;
}

function jf_GetTodayShiftDate(piYear, piMonth, piDay)
{
  return jf_GetShiftDate(jf_getToDay(), piYear, piMonth, piDay);
}

function jf_GetShiftDate(pdDate, piYear, piMonth, piDay)
{  
  return _ShiftDate(_ToDateObject(pdDate), piYear, piMonth, piDay);
}

function _ShiftDate(pdDate, piYear, piMonth, piDay)
{
  pdDate.setFullYear(pdDate.getFullYear() + piYear); 
  pdDate.setMonth(pdDate.getMonth() + piMonth);
  pdDate.setDate(pdDate.getDate() + piDay); 

  return _ToDateString(pdDate);
}

function _ToDateObject(psDate)
{
  var year  = psDate.substr(0,4);
  var month = psDate.substr(4,2) - 1; 
  var day   = psDate.substr(6,2);

  return new Date(year, month, day);
}

function _ToDateString(pdDate)
{
  var year  = pdDate.getFullYear();
  var month = pdDate.getMonth() + 1; 
  var day   = pdDate.getDate();

  if(String(month).length == 1) 
  { 
    month = "0" + month; 
  }
  if(String(day).length == 1) 
  { 
    day   = "0" + day;   
  }

  return year + "" + month + "" + day;
}

// Date 
function jf_ToDateObject(date) 
{ 
    var year  = date.substr(0,4);
    var month = date.substr(4,2) - 1; // 
    var day   = date.substr(6,2);

    return new Date(year,month,day);
}

//
function jf_ToDateString(date) 
{ 
    var year = date.getFullYear();
    var month = date.getMonth() + 1; // 
    var day = date.getDate();

    if (("" + month).length == 1) { month = "0" + month; }
    if (("" + day).length   == 1) { day   = "0" + day; }

    return ("" + year + month + day)
}

// Time 
function jf_ToTimeObject(time) 
{ 
    var year = time.substr(0, 4);
    var month = time.substr(4, 2) - 1; // 
    var day = time.substr(6, 2);
    var hour = time.substr(8, 2);
    var min = time.substr(10, 2);

    return new Date(year, month, day, hour, min);
}

//
function jf_ToTimeString(date) 
{ 
    var year = date.getFullYear();
    var month = date.getMonth() + 1; // 
    var day = date.getDate();
    var hour = date.getHours();
    var min = date.getMinutes();

    if (("" + month).length == 1) { month = "0" + month; }
    if (("" + day).length   == 1) { day   = "0" + day; }
    if (("" + hour).length  == 1) { hour  = "0" + hour; }
    if (("" + min).length   == 1) { min   = "0" + min; }

    return ("" + year + month + day + hour + min)
}


//
function jf_IsValidMonth(mm) 
{
    var m = parseInt(mm,10);
    return (m >= 1 && m <= 12);
}

//
function jf_IsValidDay(dd) 
{
  if (jf_IsNumeric(dd))
    return ((parseInt(dd,10)) >= 1 && (parseInt(dd,10) <= 31));
  else
    return false;
}

//
function jf_IsValidWeek(w) 
{
  if (jf_IsNumeric(w))
    return ((parseInt(w,10)) >= 1 && (parseInt(w,10) <= 6));
  else
    return false;
}

//
function jf_IsValidHour(hh) 
{
    var h = parseInt(hh,10);
    
    return (h >= 1 && h <= 24);
}

//
function jf_IsValidMin(mi) 
{
    var m = parseInt(mi,10);
    
    return (m >= 0 && m <= 60);
}

//
/* ex) var time = form.time.value; //'200102310000'
*     if (!isValidTime(time)) 
*     {
*         alert("");
*     }
*/
function jf_IsValidTime(time) 
{
    var year  = time.substring(0,4);
    var month = time.substring(4,6);
    var day   = time.substring(6,8);
    var hour  = time.substring(8,10);
    var min   = time.substring(10,12);

    if (parseInt(year,10) >= 1900  && jf_IsValidMonth(month) &&
        jf_IsValidDay(day) && jf_IsValidHour(hour)   &&
        jf_IsValidMin(min)) 
    {
        return true;
    }
    
    return false;
}

//
function jf_IsValidDate(yyyymmdd)
{
  var year  = yyyymmdd.substring(0,4);
  var month = yyyymmdd.substring(4,6);
  var day   = yyyymmdd.substring(6,8);
  
  if (parseInt(year,10) >= 1900  && jf_IsValidMonth(month) &&
        jf_IsValidDay(day) ) 
  {
        return true;
  }
  
  return false;
}

//Date
function jf_IsFutureDate(date) 
{
    return (jf_ToDateObject(date) > new Date());
}

//Date
function jf_IsPastDate(date) 
{
    return (jf_ToDateObject(date) < new Date());
}

//Time
function jf_IsFutureTime(time) 
{
    return (jf_ToTimeObject(time) > new Date());
}

//Timeì
function jf_IsPastTime(time) 
{
    return (jf_ToTimeObject(time) < new Date());
}


//
/* ex) var time = form.time.value; //'20000101000'
*     alert(shiftTime(time,0,0,-100,0));
*     => 2000/01/01 00:00  „ Time
*/
function jf_ShiftTime(time, y, m, d, hh, mi) 
{
    var date = jf_ToTimeObject(time);

    date.setFullYear(date.getFullYear() + y); //
    date.setMonth(date.getMonth() + m);       //
    date.setDate(date.getDate() + d);         //
    date.setHours(date.getHours() + hh);       //
    date.setMinutes(date.getMinutes() + mi);       //

    return jf_ToTimeString(date);
}

//
//date
function jf_GetYearInterval(date1,date2) 
{ 
    var years  = date2.getFullYear() - date1.getFullYear();

    return parseInt(years, 10);
}


function jf_GetMonthInterval(date1,date2) 
{ 
    var years  = date2.getFullYear() - date1.getFullYear();
    var months = date2.getMonth() - date1.getMonth();
    var days   = date2.getDate() - date1.getDate();

    return (years * 12 + months + (days >= 0 ? 0 : -1) );
}


function jf_GetDayInterval(date1,date2) 
{
    var day   = 1000 * 3600 * 24; //24ì‹œê°„

    return parseInt((date2 - date1) / day, 10);
}


function jf_GetHourInterval(time1,time2) 
{
    var date1 = jf_ToTimeObject(time1);
    var date2 = jf_ToTimeObject(time2);
    var hour  = 1000 * 3600; //1ì‹œê°„

    return parseInt((date2 - date1) / hour, 10);
}


function jf_GetCurrentTime() 
{
    return jf_ToTimeString(new Date());
}


function jf_GetRelativeTime(y,m,d,h) 
{
    return jf_ShiftTime(jf_GetCurrentTime(),y,m,d,h);
}


function jf_GetYear() 
{
    return jf_GetCurrentTime().substr(0,4);
}


function jf_GetMonth() 
{
    return jf_GetCurrentTime().substr(4,2);
}


function jf_GetDay() 
{
    return jf_GetCurrentTime().substr(6,2);
}


function jf_GetHour() 
{
  return jf_GetCurrentTime().substr(8,2);
}

function jf_PrintTimeZoneDateTimeString(datetime, diff, f) 
{ 
  document.write(jf_GetTimeZoneDateTimeString(datetime, diff, f));
}

function jf_PrintTimeZoneDateString(datetime, diff, f) 
{ 
  document.write(jf_GetTimeZoneDateString(datetime, diff, f));
}

function jf_PrintTimeZoneTimeString(datetime, diff, f) 
{ 
  document.write(jf_GetTimeZoneTimeString(datetime, diff, f));
}

function jf_GetTimeZoneDateTimeString(datetime, diff, f) 
{ 
  var date = jf_ToTimeObject(datetime);

  date.setMinutes(date.getMinutes() + diff);       
  
  if(!f)
  {
    f = IKEP_DATETIME_FORMAT;
  }

  return date.format(f);
}

function jf_GetTimeZoneDateString(datetime, diff, f) 
{ 
  var date = jf_ToTimeObject(datetime);

  date.setMinutes(date.getMinutes() + diff);       
  
  if(!f)
  {
    f = IKEP_DATE_FORMAT;
  }

  return date.format(f);
}

function jf_GetTimeZoneTimeString(datetime, diff, f) 
{ 
  var date = jf_ToTimeObject(datetime);

  date.setMinutes(date.getMinutes() + diff);       

  if(!f)
  {
    f = IKEP_TIME_FORMAT;
  }

  return date.format(f);
}

// ------------------------ check validation finction -----------------------------------
function jf_IsValidValue(psValue)
{
  var sTempStr = jf_SkipSpaces(psValue);

  if (jf_IsEmpty(sTempStr))
  {
    return false;
  }
  else
  {
    return true;
  }
}

function jf_IsValidStrLength(psStr, piLimit)
{
  if(!jf_IsValidValue(psStr))
  {
      return false;      
  }
  
  if (jf_GetByteLength(psStr) > piLimit)
  {
    return false;    
  }
  else
  {
    return true;    
  }
}

function jf_IsValidEMail(psStr)
{
  if(!jf_IsValidValue(psStr))
  {
      return false;      
  }
  var fmt= new RegExp(/^([a-zA-Z0-9]{3,})(((\.|\-|\_)[a-zA-Z0-9]{2,})+)?@([a-z]{3,})(\-[a-z0-9]{3,})?(\.[a-z]{2,})+$/);
  //var fmt = /^([A-Za-z0-9!~.-_])+@([A-Za-z0-9.!~-_])+.([A-Za-z0-9.!~-_])+$/;

  if(fmt.test(psStr) && (psStr.indexOf(".@") == -1) && (psStr.indexOf("@.") == -1))
  {
    return true;
  }  
  else
  {
    return false;    
  }
}

function _IsValidDateStr(psStr)
{
  if(!jf_IsValidValue(psStr))
  {
    return false;      
  }
  
  var fmt = /^\d{4}-\d{2}-\d{2}$/;

  if (!fmt.test(psStr))
  {
    return false;
  }

  var iYear = parseInt(psStr.substr(0, 4), 10);
  var iMonth = parseInt(psStr.substr(5, 2), 10);
  var iDay = parseInt(psStr.substr(8, 2), 10);

  var aMonthDays = new Array("31","28","31","30","31","30","31","31","30","31","30","31");

  if ((((iYear % 4) == 0) && ((iYear % 100) != 0)) || ((iYear % 400) == 0))
  {
    aMonthDays[1] = "29";
  }

  if ((iYear < 1) || (iMonth < 1) || (iMonth > 12) || (iDay < 1) ||(iDay > parseInt(aMonDays[iMonth-1], 10)))
  {
    return false;
  }

  return true;
}

function jf_IsValidTimeStr(psStr)
{
  if(!jf_IsValidValue(psStr))
  {
    return false;      
  }
  
  var fmt = /^\d{2}:\d{2}$/;

  if (!fmt.test(psStr))
  {
    return false;
  }

  var iHour = parseInt(psStr.substr(0,2), 10);
  var iMin  = parseInt(psStr.substr(3,2), 10);
  
  if((iHour < 0) || (iHour > 24) || (iMin < 0) || (iMin > 60))
  {
    return false;    
  }
  
  return true;
}

function jf_IsValidDecimal(psStr, piIntMax, piDecMax)
{
  if(!jf_IsDecimal(psStr))
  {
    return false;
  }

  var fields = psStr.split(".");
  
  var intValue = fields[0];
  var decValue = fields[1];

  var fmt = eval("/^\\d{0," + piIntMax + "}$/");

  if(!fmt.test(intValue))
  {
    return false;
  }

  fmt = eval("/^\\d{0,"+ piDecMax +"}$/");

  if(!fmt.test(decimalValue))
  {
    return false;
  }

  return true;
}

function jf_IsAlphabetic(psStr)
{
  if(!jf_IsValidValue(psStr))
  {
    return false;      
  }
  
  var fmt = /^[A-Za-z]+[A-Za-z]*$/;

  if(fmt.test(psStr))
  {
    return true;
  }
  else
  {
    return false;
  }
}

function jf_IsNumeric(psStr)
{
  if(!jf_IsValidValue(psStr))
  {
    return false;      
  }

  var fmt = /^\d+\d*$/;
  
  if(fmt.test(psStr))
  {
    return true;
  }
  else
  {
    return false;
  }
}

function jf_IsDecimal(psStr)
{
  if(!jf_IsValidValue(psStr))
  {
    return false;      
  }
  
  var fmt = /^\d+(\.|\d)\d*$/;

  if(fmt.test(psStr))
  {
    return true;
  }
  else
  {
    return false;
  }
}

// ------------------------ Input ----------------------------------------
function jf_ChkInput(peInput)
{
  if(peInput != undefined)
  {
    if(!jf_IsValidValue(peInput.value))
    {
      peInput.focus();
  
      return false;   
    }
    else
    {
      return true;
    }
  }
  
  return true;
}

function jf_IsValidInputNumber(peInput)
{
  if(peInput != undefined)
  {
    if(!jf_IsNumeric(peInput.value))
    {
      peInput.focus();
  
      return false;    
    }
  }
  
  return true;
}

function jf_IsValidInputLength(peInput, piLimit)
{
  if(peInput != undefined)
  {  
    if(!jf_IsValidStrLength(peInput.value))
    {
      peInput.focus();
  
      return false;    
    }
  }
  
  return true;
}

function jf_GetInputValue(peInput)
{
  return peInput.value;
}


function jf_ChkRadioOrCheckBoxSingle(peInput)
{
  var falg = false;  
 
  if(peInput != undefined)
  {
    if (peInput.length > 1)
    {
      for (var i = 0; i < peInput.length; i++)
      {
        if(peInput[i].checked)
        {
          falg = true;
        }
      }
      return falg;
    }
    else
    {
      if (peInput.checked)
      {
        falg = true;
      }
    }
    return falg;
  }
}

function jf_ChkRadioOrCheckBoxOnlyOne(peInput)
{
	var count = 0;  
	var checkboxValue;
 
	if(peInput != undefined) {

		if (peInput.length > 1) {
		
			for (var i = 0; i < peInput.length; i++) {
				if(peInput[i].checked) {
					++count;
					checkboxValue = peInput[i].value;
					if(count > 1)
						return 2;
				}
			}
			
			if(count == 0)
				return 0;
			else
				return checkboxValue;
		} else {
			if (peInput.checked) {
				return peInput.value;
			} else {
				return 0;
			}
		}
		
	}
}

function jf_ChkRadioOrCheckBoxAll(peInput)
{
	if(peInput != undefined) {

		if (peInput.length > 1) {
		
			for (var i = 0; i < peInput.length; i++) {
				if(peInput[i].checked) {
				} else {
					return false;
				}
			}
			
			return true;
		} else {
			if (peInput.checked) {
				return true;
			} else {
				return false;
			}
		}
		
	}
}

  
function jf_ChkRadioOrCheckBox(peInput)
{
  if(peInput != undefined)
  {
    if (peInput.length > 1)
    {
      for (var i = 0; i < peInput.length; i++)
      {
        if(peInput[i].checked)
        {
          return true;
        }
      }
    }
    else
    {
      if (peInput.checked)
      {
        return true;
      }
    }
    return false;
  }
  
  return false;  
}

function jf_ChkCountRadioOrCheckBox(peInput)
{
  var count = 0;
  
  if(peInput != undefined)
  {
    if (peInput.length > 1)
    {
      for (var i = 0; i < peInput.length; i++)
      {
        if(peInput[i].checked)
        {
          count++;
        }
      }
    }
    else
    {
      if (peInput.checked)
      {
        count++;
      }
    }
  }
  
  return count;  
}

function jf_GetCheckedValue(peInput)
{
  if (peInput.length > 1)
  {
    for (var i = 0; i < peInput.length; i++)
    {
       if (peInput[i].checked)
       {
          return peInput[i].value;
       }
    }
  }
  else
  {
    if (peInput.checked)
    {
      return peInput.value;
    }
  }
}

function jf_GetSelectedValue(peInput)
{
  return peInput.options[peInput.selectedIndex].value;
} 

// ----------------------------------- Cookie function  -----------------------------------
function jf_GetCookie(psName)
{
  var i = 0;
  
  var arg  = psName + "=";
  var argLength = arg.length;
  var cookieLength = document.cookie.length;

  while(i < cookieLength)
  {
    var j = i + argLength;
    
    if(document.cookie.substring(i, j) == arg)
    {
      var end = document.cookie.indexOf(";", j);

      if(end == -1)
      {
        end = document.cookie.length;
      }

      return unescape(document.cookie.substring(j, end));
    }

    i = document.cookie.indexOf(" ", i) + 1;

    if (i==0)
    {
      break;      
    }
  }

  return null;
}

function jf_SetCookie(psName, psValue, piDays)
{
  var today = new Date();
  var expires = new Date();

  expires.setTime(today.getTime() + 1000*60*60*24*piDays);

  document.cookie = psName + "=" + escape(psValue) + ((expires == null) ?  "" : (" ; expires=" + expires.toGMTString()));
}

// ----------------------------------- Etc function -----------------------------------
function jf_Make2Array(piLength1, piLength2)
{
  var array = new Array(piLength1);

  for(var i=0; i<array.length; i++)
  {
    array[i] = new Array(piLength2);
  }
  
  return array;
} 


function jf_AllTrim(psStr)
{
  if(psStr == null)
  {
    return "";
  }

  psStr = psStr+"";
  var sRtnStr = psStr.replace(/^\s*/, "").replace(/\s*$/, "");

  return sRtnStr;
}

(function($) {
	$.widget("ui.combobox", {
		_create: function() {
			var self = this;
			var select = this.element.hide();
			
			var inputId = select.attr('id') +"Text";
			var inputTag = "<input id=\"" +inputId +"\" name=\"" +inputId +"\" onblur=\"" +"checkComboBox('" +inputId +"','" +select.attr('id') +"');" +"\">";
			
			var input = $(inputTag)
				.insertAfter(select)
				.autocomplete({
					source: function(request, response) {
						var matcher = new RegExp(request.term, "i");
						response(select.children("option").map(function() {
							var text = $(this).text();

							if (!request.term || matcher.test(text))
								return {
									id: $(this).val(),
									label: text.replace(new RegExp("(?![^&;]+;)(?!<[^<>]*)(" + request.term.replace(/([\^\$\(\)\[\]\{\}\*\.\+\?\|\\])/gi, "\\$1") + ")(?![^<>]*>)(?![^&;]+;)", "gi"), "<strong>$1</strong>"),
									value: text
								};
						}));
					},
					delay: 0,
					select: function(e, ui) {
						if (!ui.item) {
							// remove invalid value, as it didn't match anything
							$(this).val("");
							return false;
						}

						$(this).focus();
						select.val(ui.item.id);
						self._trigger("selected", null, {
							item: select.find("[value='" + ui.item.id + "']")
						});
						//$(this).val(ui.item.value);
					},
					minLength: 0
				})
				.addClass("ui-widget ui-widget-content ui-corner-left");
			
			$("<button style='right:-0.1px;'>&nbsp;</button>")
			.insertAfter(input)
			.button({
				icons: {
					primary: "ui-icon-triangle-1-s"
				},
				text: false
			}).removeClass("ui-corner-all")
			.addClass("ui-corner-right ui-button-icon")
			.click(function() {
				// close if already visible
				if (input.autocomplete("widget").is(":visible")) {
					input.autocomplete("close");
					return false;
				}
				// pass empty string as value to search for, displaying all results
				input.autocomplete("search", "");
				input.focus();

				return false;
			});
		}
	});

})(jQuery);

function checkComboBox(textId, selectId) {
	var textFieldId = "#" +textId;
	var comboBoxId = "#" +selectId;
	
	var userInput = $(textFieldId).val().toUpperCase();
	var found = false;
	
	$(comboBoxId).children("option").map(function() {

		if($(this).text().toUpperCase() == userInput) {
			$(textFieldId).val($(this).text());
			$(comboBoxId).val($(this).val());
			found = true;
		}
	});

	if(!found) {
		$(textFieldId).val('');
		$(comboBoxId).val('All');
	}

}