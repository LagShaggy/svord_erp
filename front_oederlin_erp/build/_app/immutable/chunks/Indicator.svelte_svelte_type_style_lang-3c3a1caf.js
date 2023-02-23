var r={},u={get exports(){return r},set exports(n){r=n}};/*!
	Copyright (c) 2018 Jed Watson.
	Licensed under the MIT License (MIT), see
	http://jedwatson.github.io/classnames
*/(function(n){(function(){var c={}.hasOwnProperty;function s(){for(var e=[],o=0;o<arguments.length;o++){var t=arguments[o];if(t){var l=typeof t;if(l==="string"||l==="number")e.push(t);else if(Array.isArray(t)){if(t.length){var a=s.apply(null,t);a&&e.push(a)}}else if(l==="object"){if(t.toString!==Object.prototype.toString&&!t.toString.toString().includes("[native code]")){e.push(t.toString());continue}for(var i in t)c.call(t,i)&&t[i]&&e.push(i)}}}return e.join(" ")}n.exports?(s.default=s,n.exports=s):window.classNames=s})()})(u);const f=r;export{f as c};
