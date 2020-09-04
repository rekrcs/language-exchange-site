function MobileSideBar__init() {
	var $btnToggleMobileSideBar = $('.btn-toggle-mobile-side-bar');

	$btnToggleMobileSideBar.click(function() {
		if ($(this).hasClass('active')) {
			$(this).removeClass('active');
			// 사이드바 안보이게함
			$('.mobile-side-bar').removeClass('active');
		} else {
			$(this).addClass('active');
			// 사이드바 보이게함
			$('.mobile-side-bar').addClass('active');
		}
	});
}

$(function() {
	MobileSideBar__init();
});

// 범용성 있는 자바스크립트
String.prototype.replaceAll = function(org, dest) {
	return this.split(org).join(dest);
}

function getUriParams(uri) {
	uri = uri.trim();
	uri = uri.replaceAll('&amp;', '&');
	if (uri.indexOf('#') !== -1) {
		var pos = uri.indexOf('#');
		uri = uri.substr(0, pos);
	}

	var params = {};

	uri.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) {
		params[key] = value;
	});
	return params;
}

function jq_attr($el, attrName, elseValue) {
	var value = $el.attr(attrName);

	if (value === undefined || value === "") {
		return elseValue;
	}

	return value;
}

function isCellphoneNo(str) {
	if (str.substr(0, 1) != '0') {
		return false;
	}

	return isNumber(str);
}

function isNumber(n) {
	return /^-?[\d.]+(?:e-?\d+)?$/.test(n);
}

function getHtmlEncoded(raw) {
	return raw.replace(/[\u00A0-\u9999<>\&]/gim, function(i) {
		return '&#' + i.charCodeAt(0) + ';';
	});
}