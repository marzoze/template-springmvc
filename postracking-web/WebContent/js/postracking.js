// use this as a namespace
var postracking = {};

postracking._menuSelected = null;
postracking._loginPage = postrackingcontextpath + "/jsp/common/login.jsp";
postracking.swfu;

/*
 * initialize content widget call this at the end of each form
 */
postracking.form = {
		init : function(options) {

			var opts = $.extend( {
				// Default options
				isAjax : false,
				fn : function() {
				}
			}, options || {});

			if (opts.isAjax) {
				var ajaxOpts = $.extend({
					dataType : 'json',
					beforeSubmit : function() {
						// showLoading();
						return true;
					},
					success : postracking.loadJsonToForm,
					failure : function() {
						hideLoading();
					}
				}, options ? (options.ajaxOptions || {}) : {});

				$('form').ajaxForm(ajaxOpts);
			}

			// invoke on form submit
			$('form').submit(function() {
				return true;
			});					

			// initialize datefield; for common datefield
			postracking.datefield.createDate(".datefield:enabled");			

			//change error message background to red, if found .msg-error
			$('.msg-error').parents('.ui-state-message').addClass('ui-state-error');
			$('.msg-error').parents('.ui-state-message').removeClass('ui-state-message');
					
			// own function on load
			if (opts.fn) {
				jQuery(opts.fn);
			}

		}
}
/* end of initialize tab content widget */


$.fn.disableElement = function() {
	$(this).addClass("ui-state-disabled");
	$(this).attr("disabled", "disabled");
	$(this).addClass("readonly");
};

$.fn.enableElement = function() {
	$(this).removeClass("ui-state-disabled");
	$(this).removeAttr("disabled");
	$(this).removeClass("readonly");
};

$.fn.setReadonly = function(state) {
	$(this).attr("readonly",state||false);
	if(state){
		$(this).addClass('readonly');
	}else{
		$(this).removeClass('readonly');
	}
};


/* on ready */
$("document").ready(function(){
	//showLoading();

	postracking.dialogLoading = {
		dialog : function(act){
			if(act == 'open'){
				//showLoading();
			}else{
				hideLoading();
			}
		}
	}

	$("#dialog").dialog("destroy");
	$("#dialog-address-list").dialog("destroy");

	postracking.form.init();

});
/* end of on ready */



/*
 * datepicker
 */
postracking.dateFormat = "dd/mm/yy";
postracking.datefield = {
	init : {
		options : {
			showOn : 'button',
			buttonImage : contextRoot + "/images/calendar.png",
			buttonImageOnly : true,
			dateFormat : postracking.dateFormat,
			altFormat : postracking.dateFormat,
			showButtonPanel : true,
			editable : false,
			changeMonth: true,
			changeYear: true
		}
	},
	createDate : function(selector, options) {
		var opts = $.extend(postracking.datefield.init.options, options || {});
		$(selector).datepicker(opts); // create common datefield
	}
}
/* end of date picker */

/*
 * autocomplete
 */
postracking.autocomplete = function(fieldId, url) {
	var opt = {
		url : url || '',
		dataType : 'json',
		success : function(data) {
			if (data) {
				$("#" + fieldId).autocomplete(data.source,{
					matchContains: true,
					selectFirst: false
				});
			}
		}
	};
	$.ajax(opt);
};


postracking.Msg = {
	getOption : function(title) {
		return {
			autoOpen : false,
			bgiframe : true,
			modal : true,
			minHeight : 54,
			// width: 'auto',
			resizable : false,
			title : title || 'Information'
		}
	},
	init : function() {
		return $('<div id="dialog-message"></div>');
	},
	setMsg : function(title, msg) {
		return dlg = postracking.Msg.init().html("<p>" + msg + "</p>").dialog(
				postracking.Msg.getOption(title));
	},
	openDlg : function(dlg) {
		dlg.dialog("open");
	},
	closeDlg : function(dlg) {
		dlg.dialog("close");
	},
	alert : function(title, msg) {
		var dlg = postracking.Msg.setMsg(title, msg);
		dlg.dialog("option", "buttons", {
			"Ok" : function() {
				postracking.Msg.closeDlg($(this));
			}
		});
		postracking.Msg.openDlg(dlg);
	},
	confirm : function(title, msg, buttons) {
		if (!buttons) {
			buttons = {
				"Ok" : function() {
					postracking.Msg.closeDlg($(this));
				}
			};
		}

		var dlg = postracking.Msg.setMsg(title, msg);
		dlg.dialog("option", "buttons", buttons);
		postracking.Msg.openDlg(dlg);
	}
}


/**
*
* @param {String}
*            url
* @param {Object}
*            options
*/
$.fn.loadOptions = function(url, options, defaultText) {
	$(this).each(function() {
		var _select = $(this);
		var _tmpl = '<option value="#{id}" title="#{title}">#{label}</option>';

		var opts = $.extend( {
			// Default options
			url : url || '', // URL is a mandatory param when remote true
			type : 'GET', // default request method
			data : {}, // default params to send to request
			cache : false, // caching option
			dataType : 'json', // default data type from server
			value : '', // default selected value
			remote : true, // call ajax to get the options
			select : function(val) {
				_select.val(val);
			},
			/*
			 * beforeSend: function() { var loader = $.tmpl(_tmpl, {id:'',
			 * label:'Loading...'}); _select.html(loader); },
			 */
			success : function(data) {
				_select.empty();
				if (data instanceof Object)
					data = data[this.root || 'options'];
				if (data) {
					$.each(data, function() {
						if (!this.title) {
							this.title = this.label;
						}
						if(defaultText){
							if(!this.id){
								this.label = defaultText;
							}
						}
						var opt = $.tmpl(_tmpl, this);
						_select.append(opt);
					});
					this.select(this.value);
					this.afterLoaded();
				}
			},
			afterLoaded : function() {
			},
			complete : function() {
			}
		}, options || {});
		// Call AJAX Request
			if (opts.remote) {
				$.ajax(opts);
			}
			// Get options entries from data
			else {
				opts.beforeSend();
				opts.success.call(opt, opt.data);
			}
		});
}


/*
 * JSON to Form; binding json to form's fields
 */
postracking.loadJsonToForm = function(obj) {
	hideLoading();
	$(function() {
		els = $(":input");
		obj = obj || null;
		setValueField = function($field, value) {
			if ($field.is("select")) { // select element (dropdown)
				$field.children("option[value=" + value + "]").attr("selected",
						"selected");
			} else if ($field.is(":checkbox")) { // checkbox
				$("input:checkbox[name=" + $field.attr("name") + "]").attr(
						"checked", false); // clear previous checked first
				$(
						"input:checkbox[name=" + $field.attr("name")
								+ "][value=" + value + "]").attr("checked",
						"checked");
			} else if ($field.is("[type=radio]")) { // radio button
				$("input:radio[value=" + value + "]")
						.attr("checked", "checked");
			} else if ($field.is("[type=textarea]")) { // textarea
				$field.val(value);
			} else if ($field.is("[type=text]")) { // text field
				$field.val(value);
			}

			if ($field.is(".currencyfield")) {
				$field.currencyField();
			}
		}
		if (els && els.length > 0 && obj) {
			$.each(els, function(idx, field) {
				var fieldName = field.name;
				if (fieldName.split(".").length > 1) {
					var binding = fieldName.split(".")[0];
					var name = fieldName.split(".")[1];
					value = obj[binding] ? (obj[binding][name] || "") : "";
					setValueField($(":input[name=" + fieldName + "]"), value);
				} else if (fieldName.split(".").length == 1) {
					value = obj[fieldName] || "";
					setValueField($("input[name=" + fieldName + "]", "form"),
							value);
				}
			});
		}
	});
}



/*******************************************************************************
 * ---------------------------------------------------------------------------
 * ------------------------ STATIC METHOD PLUGINS ---------------------------- *
 * ---------------------------------------------------------------------------
 */
$.extend( {
	/*
	 * public interface: $.tmpl 
	 */
	tmpl : function(tmpl, vals, rgxp) {
		// default to doing no harm
		tmpl = tmpl || '';
		vals = vals || {};

		// regular expression for matching our placeholders; e.g.,
		// #{my-cLaSs_name77}
		rgxp = rgxp || /#\{([^{}]*)}/g;

		// function to making replacements
		var repr = function(str, match) {
			return typeof vals[match] === 'string'
					|| typeof vals[match] === 'number' ? vals[match] : str;
		};

		return tmpl.replace(rgxp, repr);
	}
});


/*
 * common function for handle dirty form
 */
postracking.preventTab = false;
postracking.dirtyForm = function(formId, saveUrl) {
	$("#" + formId).trackDirty({
						classNameTargetCallback : function() {						
							return $(this).parents("li");
						},
						onDirtyChangeCallback : function() {
							postracking.preventTab = true;							
							$('.side-menu-a').click(function() {								
								var link = $(this).attr("href");
								if ($(":dirty").length > 0) {
									postracking.Msg.confirm(
										"Save/Update",
										"Do you want to save the changes on the form?",
										{
											"Cancel" : function() {
												postracking.Msg.closeDlg($(this));
											},
											"No" : function() {
												postracking.Msg.closeDlg($(this));
											},
											"Yes" : function() {

											}
										});
								}			
							});

						}
					});
};

/*
 * common function for handle multicolor jqgrid
 */
var multiColor = function(gridId) {
	$('#' + gridId).find(">tbody>tr.jqgrow:odd").addClass("myAltRowClassEven");
	$('#' + gridId).find(">tbody>tr.jqgrow:even").addClass("myAltRowClassOdd");
};
