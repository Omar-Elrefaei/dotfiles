   �         Ahttps://www.gstatic.com/feedback/js/help/prod/service/lazy.min.js     %���t     %���f�         
     O K           �      Accept-Ranges   bytes   Vary   Accept-Encoding   Content-Encoding   gzip   Content-Type   text/javascript   Date   Thu, 19 Oct 2017 12:34:54 GMT   Expires   Thu, 26 Oct 2017 12:34:54 GMT   Last-Modified   Tue, 17 Oct 2017 22:34:51 GMT   X-Content-Type-Options   nosniff   Server   sffe   X-XSS-Protection   1; mode=block   Cache-Control   public, max-age=604800   Age   169806   Alt-Svc   (quic=":443"; ma=2592000; v="39,38,37,35" (function(){var k,l=this,m=function(a){return"string"==typeof a},p=function(a,b,c){a=a.split(".");c=c||l;a[0]in c||!c.execScript||c.execScript("var "+a[0]);for(var d;a.length&&(d=a.shift());)a.length||void 0===b?c=c[d]&&c[d]!==Object.prototype[d]?c[d]:c[d]={}:c[d]=b},q=function(a,b){for(var c=a.split("."),d=b||l,e=0;e<c.length;e++)if(d=d[c[e]],null==d)return null;return d},r=function(){},aa=function(a){var b=typeof a;if("object"==b)if(a){if(a instanceof Array)return"array";if(a instanceof Object)return b;var c=
Object.prototype.toString.call(a);if("[object Window]"==c)return"object";if("[object Array]"==c||"number"==typeof a.length&&"undefined"!=typeof a.splice&&"undefined"!=typeof a.propertyIsEnumerable&&!a.propertyIsEnumerable("splice"))return"array";if("[object Function]"==c||"undefined"!=typeof a.call&&"undefined"!=typeof a.propertyIsEnumerable&&!a.propertyIsEnumerable("call"))return"function"}else return"null";else if("function"==b&&"undefined"==typeof a.call)return"object";return b},t=function(a){var b=
aa(a);return"array"==b||"object"==b&&"number"==typeof a.length},u=function(a){return"function"==aa(a)},v=function(a){var b=typeof a;return"object"==b&&null!=a||"function"==b},ba=function(a,b,c){return a.call.apply(a.bind,arguments)},ca=function(a,b,c){if(!a)throw Error();if(2<arguments.length){var d=Array.prototype.slice.call(arguments,2);return function(){var c=Array.prototype.slice.call(arguments);Array.prototype.unshift.apply(c,d);return a.apply(b,c)}}return function(){return a.apply(b,arguments)}},
w=function(a,b,c){w=Function.prototype.bind&&-1!=Function.prototype.bind.toString().indexOf("native code")?ba:ca;return w.apply(null,arguments)},da=Date.now||function(){return+new Date},x=function(a,b){function c(){}c.prototype=b.prototype;a.Bb=b.prototype;a.prototype=new c;a.prototype.constructor=a;a.sb=function(a,c,f){for(var d=Array(arguments.length-2),e=2;e<arguments.length;e++)d[e-2]=arguments[e];return b.prototype[c].apply(a,d)}};var ea=function(a){return function(){return a}}(!0);var y=function(a){if(Error.captureStackTrace)Error.captureStackTrace(this,y);else{var b=Error().stack;b&&(this.stack=b)}a&&(this.message=String(a))};x(y,Error);y.prototype.name="CustomError";var fa;var z=String.prototype.trim?function(a){return a.trim()}:function(a){return a.replace(/^[\s\xa0]+|[\s\xa0]+$/g,"")},ha=function(a,b){return a<b?-1:a>b?1:0};var ia=Array.prototype.forEach?function(a,b,c){Array.prototype.forEach.call(a,b,c)}:function(a,b,c){for(var d=a.length,e=m(a)?a.split(""):a,f=0;f<d;f++)f in e&&b.call(c,e[f],f,a)},ja=Array.prototype.some?function(a,b,c){return Array.prototype.some.call(a,b,c)}:function(a,b,c){for(var d=a.length,e=m(a)?a.split(""):a,f=0;f<d;f++)if(f in e&&b.call(c,e[f],f,a))return!0;return!1},ka=function(a){return Array.prototype.concat.apply([],arguments)},la=function(a){var b=a.length;if(0<b){for(var c=Array(b),
d=0;d<b;d++)c[d]=a[d];return c}return[]};var A;a:{var ma=l.navigator;if(ma){var na=ma.userAgent;if(na){A=na;break a}}A=""}var C=function(a){return-1!=A.indexOf(a)};var oa=function(a,b){for(var c in a)b.call(void 0,a[c],c,a)},pa=function(a){var b=[],c=0,d;for(d in a)b[c++]=a[d];return b},qa=function(a){var b=[],c=0,d;for(d in a)b[c++]=d;return b},ra="constructor hasOwnProperty isPrototypeOf propertyIsEnumerable toLocaleString toString valueOf".split(" "),sa=function(a,b){for(var c,d,e=1;e<arguments.length;e++){d=arguments[e];for(c in d)a[c]=d[c];for(var f=0;f<ra.length;f++)c=ra[f],Object.prototype.hasOwnProperty.call(d,c)&&(a[c]=d[c])}};var ua=function(a,b){var c=ta;Object.prototype.hasOwnProperty.call(c,a)||(c[a]=b(a))};var va=C("Opera"),D=C("Trident")||C("MSIE"),wa=C("Edge"),xa=C("Gecko")&&!(-1!=A.toLowerCase().indexOf("webkit")&&!C("Edge"))&&!(C("Trident")||C("MSIE"))&&!C("Edge"),ya=-1!=A.toLowerCase().indexOf("webkit")&&!C("Edge"),za=function(){var a=l.document;return a?a.documentMode:void 0},Aa;
a:{var Ba="",Ca=function(){var a=A;if(xa)return/rv\:([^\);]+)(\)|;)/.exec(a);if(wa)return/Edge\/([\d\.]+)/.exec(a);if(D)return/\b(?:MSIE|rv)[: ]([^\);]+)(\)|;)/.exec(a);if(ya)return/WebKit\/(\S+)/.exec(a);if(va)return/(?:Version)[ \/]?(\S+)/.exec(a)}();Ca&&(Ba=Ca?Ca[1]:"");if(D){var Da=za();if(null!=Da&&Da>parseFloat(Ba)){Aa=String(Da);break a}}Aa=Ba}
var Ea=Aa,ta={},Fa=function(a){ua(a,function(){for(var b=0,c=z(String(Ea)).split("."),d=z(String(a)).split("."),e=Math.max(c.length,d.length),f=0;0==b&&f<e;f++){var g=c[f]||"",h=d[f]||"";do{g=/(\d*)(\D*)(.*)/.exec(g)||["","","",""];h=/(\d*)(\D*)(.*)/.exec(h)||["","","",""];if(0==g[0].length&&0==h[0].length)break;b=ha(0==g[1].length?0:parseInt(g[1],10),0==h[1].length?0:parseInt(h[1],10))||ha(0==g[2].length,0==h[2].length)||ha(g[2],h[2]);g=g[3];h=h[3]}while(0==b)}return 0<=b})},Ga;var Ha=l.document;
Ga=Ha&&D?za()||("CSS1Compat"==Ha.compatMode?parseInt(Ea,10):5):void 0;var E=function(){this.ja={}};E.prototype.register=function(a,b,c){this.ja[a]={na:b,da:c||ea}};E.prototype.da=function(a){a=this.ja[a];return!!a&&a.da()};E.prototype.register=E.prototype.register;p("help.common.helpapiservice.Environment.PROD","https://clients6.google.com",void 0);p("help.common.helpapiservice.Environment.STAGING","https://content-googleapis-staging.sandbox.google.com",void 0);p("help.common.helpapiservice.Environment.TEST","https://content-googleapis-test.sandbox.google.com",void 0);var Ia={kb:"GHELP_SEARCH",jb:"GHELP_AUTOCOMPLETE",lb:"GHELP_SUGGEST",ib:"GHELP_ARTICLE",nb:"LINK",mb:"HELPCENTER",gb:"EMAIL",eb:"CHAT",hb:"FORUM",ob:"MARKETING",qb:"ONEBOX",fb:"CUSTOM",cb:"AUTO",rb:"TESTING"};var Ja;if(!(Ja=!xa&&!D)){var Ka;if(Ka=D)Ka=9<=Number(Ga);Ja=Ka}Ja||xa&&Fa("1.9.1");D&&Fa("9");var F=function(){this.ga="";this.Da=La};F.prototype.za=!0;F.prototype.ya=function(){return this.ga};F.prototype.toString=function(){return"Const{"+this.ga+"}"};var La={},Ma=function(a){var b=new F;b.ga=a;return b};Ma("");var G=function(){this.ra="";this.Ea=Na};G.prototype.za=!0;G.prototype.ya=function(){return this.ra};var H=function(a){if(a instanceof G&&a.constructor===G&&a.Ea===Na)return a.ra;aa(a);return"type_error:TrustedResourceUrl"},Na={},Oa=function(a){var b=new G;b.ra=a;return b};var Qa=function(a,b){oa(b,function(b,d){b&&b.za&&(b=b.ya());"style"==d?a.style.cssText=b:"class"==d?a.className=b:"for"==d?a.htmlFor=b:Pa.hasOwnProperty(d)?a.setAttribute(Pa[d],b):0==d.lastIndexOf("aria-",0)||0==d.lastIndexOf("data-",0)?a.setAttribute(d,b):a[d]=b})},Pa={cellpadding:"cellPadding",cellspacing:"cellSpacing",colspan:"colSpan",frameborder:"frameBorder",height:"height",maxlength:"maxLength",nonce:"nonce",role:"role",rowspan:"rowSpan",type:"type",usemap:"useMap",valign:"vAlign",width:"width"},
Sa=function(a,b,c){function d(c){c&&b.appendChild(m(c)?a.createTextNode(c):c)}for(var e=1;e<c.length;e++){var f=c[e];!t(f)||v(f)&&0<f.nodeType?d(f):ia(Ra(f)?la(f):f,d)}},Ta=function(a){return a&&a.parentNode?a.parentNode.removeChild(a):null},Ra=function(a){if(a&&"number"==typeof a.length){if(v(a))return"function"==typeof a.item||"string"==typeof a.item;if(u(a))return"function"==typeof a.item}return!1},Ua=function(a){this.H=a||l.document||document};k=Ua.prototype;
k.getElementsByTagName=function(a,b){return(b||this.H).getElementsByTagName(String(a))};k.createElement=function(a){return this.H.createElement(String(a))};k.createTextNode=function(a){return this.H.createTextNode(String(a))};k.appendChild=function(a,b){a.appendChild(b)};k.append=function(a,b){Sa(9==a.nodeType?a:a.ownerDocument||a.document,a,arguments)};k.canHaveChildren=function(a){if(1!=a.nodeType)return!1;switch(a.tagName){case "APPLET":case "AREA":case "BASE":case "BR":case "COL":case "COMMAND":case "EMBED":case "FRAME":case "HR":case "IMG":case "INPUT":case "IFRAME":case "ISINDEX":case "KEYGEN":case "LINK":case "NOFRAMES":case "NOSCRIPT":case "META":case "OBJECT":case "PARAM":case "SCRIPT":case "SOURCE":case "STYLE":case "TRACK":case "WBR":return!1}return!0};
k.removeNode=Ta;k.contains=function(a,b){if(!a||!b)return!1;if(a.contains&&1==b.nodeType)return a==b||a.contains(b);if("undefined"!=typeof a.compareDocumentPosition)return a==b||!!(a.compareDocumentPosition(b)&16);for(;b&&a!=b;)b=b.parentNode;return b==a};var I=function(a,b,c){this.Oa=c;this.Ha=a;this.Va=b;this.ea=0;this.aa=null};I.prototype.get=function(){if(0<this.ea){this.ea--;var a=this.aa;this.aa=a.next;a.next=null}else a=this.Ha();return a};I.prototype.put=function(a){this.Va(a);this.ea<this.Oa&&(this.ea++,a.next=this.aa,this.aa=a)};var Va=function(a){l.setTimeout(function(){throw a;},0)},Wa,Xa=function(){var a=l.MessageChannel;"undefined"===typeof a&&"undefined"!==typeof window&&window.postMessage&&window.addEventListener&&!C("Presto")&&(a=function(){var a=document.createElement("IFRAME");a.style.display="none";a.src="";document.documentElement.appendChild(a);var b=a.contentWindow;a=b.document;a.open();a.write("");a.close();var c="callImmediate"+Math.random(),d="file:"==b.location.protocol?"*":b.location.protocol+"//"+b.location.host;
a=w(function(a){if(("*"==d||a.origin==d)&&a.data==c)this.port1.onmessage()},this);b.addEventListener("message",a,!1);this.port1={};this.port2={postMessage:function(){b.postMessage(c,d)}}});if("undefined"!==typeof a&&!C("Trident")&&!C("MSIE")){var b=new a,c={},d=c;b.port1.onmessage=function(){if(void 0!==c.next){c=c.next;var a=c.va;c.va=null;a()}};return function(a){d.next={va:a};d=d.next;b.port2.postMessage(0)}}return"undefined"!==typeof document&&"onreadystatechange"in document.createElement("SCRIPT")?
function(a){var b=document.createElement("SCRIPT");b.onreadystatechange=function(){b.onreadystatechange=null;b.parentNode.removeChild(b);b=null;a();a=null};document.documentElement.appendChild(b)}:function(a){l.setTimeout(a,0)}};var Ya=function(){this.ia=this.T=null},$a=new I(function(){return new Za},function(a){a.reset()},100);Ya.prototype.add=function(a,b){var c=$a.get();c.set(a,b);this.ia?this.ia.next=c:this.T=c;this.ia=c};Ya.prototype.remove=function(){var a=null;this.T&&(a=this.T,this.T=this.T.next,this.T||(this.ia=null),a.next=null);return a};var Za=function(){this.next=this.scope=this.qa=null};Za.prototype.set=function(a,b){this.qa=a;this.scope=b;this.next=null};
Za.prototype.reset=function(){this.next=this.scope=this.qa=null};var db=function(a,b){J||ab();bb||(J(),bb=!0);cb.add(a,b)},J,ab=function(){if(-1!=String(l.Promise).indexOf("[native code]")){var a=l.Promise.resolve(void 0);J=function(){a.then(eb)}}else J=function(){var a=eb;!u(l.setImmediate)||l.Window&&l.Window.prototype&&!C("Edge")&&l.Window.prototype.setImmediate==l.setImmediate?(Wa||(Wa=Xa()),Wa(a)):l.setImmediate(a)}},bb=!1,cb=new Ya,eb=function(){for(var a;a=cb.remove();){try{a.qa.call(a.scope)}catch(b){Va(b)}$a.put(a)}bb=!1};var fb=function(a){a.prototype.then=a.prototype.then;a.prototype.$goog_Thenable=!0},gb=function(a){if(!a)return!1;try{return!!a.$goog_Thenable}catch(b){return!1}};var L=function(a,b){this.m=0;this.v=void 0;this.M=this.w=this.f=null;this.$=this.pa=!1;if(a!=r)try{var c=this;a.call(b,function(a){K(c,2,a)},function(a){K(c,3,a)})}catch(d){K(this,3,d)}},hb=function(){this.next=this.context=this.P=this.X=this.F=null;this.Z=!1};hb.prototype.reset=function(){this.context=this.P=this.X=this.F=null;this.Z=!1};
var ib=new I(function(){return new hb},function(a){a.reset()},100),jb=function(a,b,c){var d=ib.get();d.X=a;d.P=b;d.context=c;return d},kb=function(){var a=new L(r);K(a,2,void 0);return a},lb=function(){return new L(function(a,b){b(void 0)})};L.prototype.then=function(a,b,c){return mb(this,u(a)?a:null,u(b)?b:null,c)};fb(L);var nb=function(a){mb(a,null,r,void 0)};L.prototype.cancel=function(a){0==this.m&&db(function(){var b=new M(a);ob(this,b)},this)};
var ob=function(a,b){if(0==a.m)if(a.f){var c=a.f;if(c.w){for(var d=0,e=null,f=null,g=c.w;g&&(g.Z||(d++,g.F==a&&(e=g),!(e&&1<d)));g=g.next)e||(f=g);e&&(0==c.m&&1==d?ob(c,b):(f?(d=f,d.next==c.M&&(c.M=d),d.next=d.next.next):pb(c),qb(c,e,3,b)))}a.f=null}else K(a,3,b)},sb=function(a,b){a.w||2!=a.m&&3!=a.m||rb(a);a.M?a.M.next=b:a.w=b;a.M=b},mb=function(a,b,c,d){var e=jb(null,null,null);e.F=new L(function(a,g){e.X=b?function(c){try{var e=b.call(d,c);a(e)}catch(B){g(B)}}:a;e.P=c?function(b){try{var e=c.call(d,
b);void 0===e&&b instanceof M?g(b):a(e)}catch(B){g(B)}}:g});e.F.f=a;sb(a,e);return e.F};L.prototype.ab=function(a){this.m=0;K(this,2,a)};L.prototype.bb=function(a){this.m=0;K(this,3,a)};
var K=function(a,b,c){if(0==a.m){a===c&&(b=3,c=new TypeError("Promise cannot resolve to itself"));a.m=1;a:{var d=c,e=a.ab,f=a.bb;if(d instanceof L){sb(d,jb(e||r,f||null,a));var g=!0}else if(gb(d))d.then(e,f,a),g=!0;else{if(v(d))try{var h=d.then;if(u(h)){tb(d,h,e,f,a);g=!0;break a}}catch(n){f.call(a,n);g=!0;break a}g=!1}}g||(a.v=c,a.m=b,a.f=null,rb(a),3!=b||c instanceof M||ub(a,c))}},tb=function(a,b,c,d,e){var f=!1,g=function(a){f||(f=!0,c.call(e,a))},h=function(a){f||(f=!0,d.call(e,a))};try{b.call(a,
g,h)}catch(n){h(n)}},rb=function(a){a.pa||(a.pa=!0,db(a.Ka,a))},pb=function(a){var b=null;a.w&&(b=a.w,a.w=b.next,b.next=null);a.w||(a.M=null);return b};L.prototype.Ka=function(){for(var a;a=pb(this);)qb(this,a,this.m,this.v);this.pa=!1};
var qb=function(a,b,c,d){if(3==c&&b.P&&!b.Z)for(;a&&a.$;a=a.f)a.$=!1;if(b.F)b.F.f=null,vb(b,c,d);else try{b.Z?b.X.call(b.context):vb(b,c,d)}catch(e){wb.call(null,e)}ib.put(b)},vb=function(a,b,c){2==b?a.X.call(a.context,c):a.P&&a.P.call(a.context,c)},ub=function(a,b){a.$=!0;db(function(){a.$&&wb.call(null,b)})},wb=Va,M=function(a){y.call(this,a)};x(M,y);M.prototype.name="cancel";/*
 Portions of this code are from MochiKit, received by
 The Closure Authors under the MIT license. All other code is Copyright
 2005-2009 The Closure Authors. All Rights Reserved.
*/
var N=function(a,b){this.fa=[];this.Aa=a;this.xa=b||null;this.V=this.N=!1;this.v=void 0;this.ua=this.Ga=this.la=!1;this.ha=0;this.f=null;this.ma=0};N.prototype.cancel=function(a){if(this.N)this.v instanceof N&&this.v.cancel();else{if(this.f){var b=this.f;delete this.f;a?b.cancel(a):(b.ma--,0>=b.ma&&b.cancel())}this.Aa?this.Aa.call(this.xa,this):this.ua=!0;this.N||(a=new O,xb(this),P(this,!1,a))}};N.prototype.wa=function(a,b){this.la=!1;P(this,a,b)};
var P=function(a,b,c){a.N=!0;a.v=c;a.V=!b;yb(a)},xb=function(a){if(a.N){if(!a.ua)throw new zb;a.ua=!1}};N.prototype.na=function(a){xb(this);P(this,!0,a)};var Ab=function(a,b,c){a.fa.push([b,c,void 0]);a.N&&yb(a)};N.prototype.then=function(a,b,c){var d,e,f=new L(function(a,b){d=a;e=b});Ab(this,d,function(a){a instanceof O?f.cancel():e(a)});return f.then(a,b,c)};fb(N);
var Bb=function(a){return ja(a.fa,function(a){return u(a[1])})},yb=function(a){if(a.ha&&a.N&&Bb(a)){var b=a.ha,c=Cb[b];c&&(l.clearTimeout(c.ca),delete Cb[b]);a.ha=0}a.f&&(a.f.ma--,delete a.f);b=a.v;for(var d=c=!1;a.fa.length&&!a.la;){var e=a.fa.shift(),f=e[0],g=e[1];e=e[2];if(f=a.V?g:f)try{var h=f.call(e||a.xa,b);void 0!==h&&(a.V=a.V&&(h==b||h instanceof Error),a.v=b=h);if(gb(b)||"function"===typeof l.Promise&&b instanceof l.Promise)d=!0,a.la=!0}catch(n){b=n,a.V=!0,Bb(a)||(c=!0)}}a.v=b;d&&(h=w(a.wa,
a,!0),d=w(a.wa,a,!1),b instanceof N?(Ab(b,h,d),b.Ga=!0):b.then(h,d));c&&(b=new Db(b),Cb[b.ca]=b,a.ha=b.ca)},zb=function(){y.call(this)};x(zb,y);zb.prototype.message="Deferred has already fired";zb.prototype.name="AlreadyCalledError";var O=function(){y.call(this)};x(O,y);O.prototype.message="Deferred was canceled";O.prototype.name="CanceledError";var Db=function(a){this.ca=l.setTimeout(w(this.$a,this),0);this.Ja=a};Db.prototype.$a=function(){delete Cb[this.ca];throw this.Ja;};var Cb={};var Jb=function(){var a=Eb,b={},c=b.document||document,d=H(a),e=document.createElement("SCRIPT"),f={Ba:e,Ca:void 0},g=new N(Fb,f),h=null,n=null!=b.timeout?b.timeout:5E3;0<n&&(h=window.setTimeout(function(){Gb(e,!0);var a=new Hb(1,"Timeout reached for loading script "+d);xb(g);P(g,!1,a)},n),f.Ca=h);e.onload=e.onreadystatechange=function(){e.readyState&&"loaded"!=e.readyState&&"complete"!=e.readyState||(Gb(e,b.tb||!1,h),g.na(null))};e.onerror=function(){Gb(e,!0,h);var a=new Hb(0,"Error while loading script "+
d);xb(g);P(g,!1,a)};f=b.attributes||{};sa(f,{type:"text/javascript",charset:"UTF-8"});Qa(e,f);e.src=H(a);Ib(c).appendChild(e);return g},Ib=function(a){var b;return(b=(a||document).getElementsByTagName("HEAD"))&&0!=b.length?b[0]:a.documentElement},Fb=function(){if(this&&this.Ba){var a=this.Ba;a&&"SCRIPT"==a.tagName&&Gb(a,!0,this.Ca)}},Gb=function(a,b,c){null!=c&&l.clearTimeout(c);a.onload=r;a.onerror=r;a.onreadystatechange=r;b&&window.setTimeout(function(){Ta(a)},0)},Hb=function(a,b){var c="Jsloader error (code #"+
a+")";b&&(c+=": "+b);y.call(this,c);this.code=a};x(Hb,y);var Kb="StopIteration"in l?l.StopIteration:{message:"StopIteration",stack:""},Lb=function(){};Lb.prototype.next=function(){throw Kb;};Lb.prototype.Fa=function(){return this};var Q=function(a,b){this.l={};this.c=[];this.Y=this.b=0;var c=arguments.length;if(1<c){if(c%2)throw Error("Uneven number of arguments");for(var d=0;d<c;d+=2)this.set(arguments[d],arguments[d+1])}else a&&this.addAll(a)};k=Q.prototype;k.i=function(){Mb(this);for(var a=[],b=0;b<this.c.length;b++)a.push(this.l[this.c[b]]);return a};k.u=function(){Mb(this);return this.c.concat()};k.G=function(a){return R(this.l,a)};k.clear=function(){this.l={};this.Y=this.b=this.c.length=0};
k.remove=function(a){return R(this.l,a)?(delete this.l[a],this.b--,this.Y++,this.c.length>2*this.b&&Mb(this),!0):!1};var Mb=function(a){if(a.b!=a.c.length){for(var b=0,c=0;b<a.c.length;){var d=a.c[b];R(a.l,d)&&(a.c[c++]=d);b++}a.c.length=c}if(a.b!=a.c.length){var e={};for(c=b=0;b<a.c.length;)d=a.c[b],R(e,d)||(a.c[c++]=d,e[d]=1),b++;a.c.length=c}};k=Q.prototype;k.get=function(a,b){return R(this.l,a)?this.l[a]:b};k.set=function(a,b){R(this.l,a)||(this.b++,this.c.push(a),this.Y++);this.l[a]=b};
k.addAll=function(a){if(a instanceof Q){var b=a.u();a=a.i()}else b=qa(a),a=pa(a);for(var c=0;c<b.length;c++)this.set(b[c],a[c])};k.forEach=function(a,b){for(var c=this.u(),d=0;d<c.length;d++){var e=c[d],f=this.get(e);a.call(b,f,e,this)}};k.clone=function(){return new Q(this)};k.Fa=function(a){Mb(this);var b=0,c=this.Y,d=this,e=new Lb;e.next=function(){if(c!=d.Y)throw Error("The map has changed since the iterator was created");if(b>=d.c.length)throw Kb;var e=d.c[b++];return a?e:d.l[e]};return e};
var R=function(a,b){return Object.prototype.hasOwnProperty.call(a,b)};var Nb=function(a){if(a.i&&"function"==typeof a.i)return a.i();if(m(a))return a.split("");if(t(a)){for(var b=[],c=a.length,d=0;d<c;d++)b.push(a[d]);return b}return pa(a)},Ob=function(a,b,c){if(a.forEach&&"function"==typeof a.forEach)a.forEach(b,c);else if(t(a)||m(a))ia(a,b,c);else{if(a.u&&"function"==typeof a.u)var d=a.u();else if(a.i&&"function"==typeof a.i)d=void 0;else if(t(a)||m(a)){d=[];for(var e=a.length,f=0;f<e;f++)d.push(f)}else d=qa(a);e=Nb(a);f=e.length;for(var g=0;g<f;g++)b.call(c,e[g],
d&&d[g],a)}};var Pb=/^(?:([^:/?#.]+):)?(?:\/\/(?:([^/?#]*)@)?([^/#?]*?)(?::([0-9]+))?(?=[/#?]|$))?([^?#]+)?(?:\?([^#]*))?(?:#([\s\S]*))?$/,Qb=function(a,b){if(a)for(var c=a.split("&"),d=0;d<c.length;d++){var e=c[d].indexOf("="),f=null;if(0<=e){var g=c[d].substring(0,e);f=c[d].substring(e+1)}else g=c[d];b(g,f?decodeURIComponent(f.replace(/\+/g," ")):"")}};var S=function(a,b){this.s=this.L=this.A="";this.R=null;this.K=this.o="";this.j=this.Na=!1;if(a instanceof S){this.j=void 0!==b?b:a.j;Rb(this,a.A);var c=a.L;T(this);this.L=c;c=a.s;T(this);this.s=c;Sb(this,a.R);c=a.o;T(this);this.o=c;Tb(this,a.h.clone());c=a.K;T(this);this.K=c}else if(a&&(c=String(a).match(Pb))){this.j=!!b;Rb(this,c[1]||"",!0);var d=c[2]||"";T(this);this.L=U(d);d=c[3]||"";T(this);this.s=U(d,!0);Sb(this,c[4]);d=c[5]||"";T(this);this.o=U(d,!0);Tb(this,c[6]||"",!0);c=c[7]||"";T(this);
this.K=U(c)}else this.j=!!b,this.h=new V(null,0,this.j)};S.prototype.toString=function(){var a=[],b=this.A;b&&a.push(W(b,Ub,!0),":");var c=this.s;if(c||"file"==b)a.push("//"),(b=this.L)&&a.push(W(b,Ub,!0),"@"),a.push(encodeURIComponent(String(c)).replace(/%25([0-9a-fA-F]{2})/g,"%$1")),c=this.R,null!=c&&a.push(":",String(c));if(c=this.o)this.s&&"/"!=c.charAt(0)&&a.push("/"),a.push(W(c,"/"==c.charAt(0)?Vb:Wb,!0));(c=this.h.toString())&&a.push("?",c);(c=this.K)&&a.push("#",W(c,Xb));return a.join("")};
S.prototype.resolve=function(a){var b=this.clone(),c=!!a.A;c?Rb(b,a.A):c=!!a.L;if(c){var d=a.L;T(b);b.L=d}else c=!!a.s;c?(d=a.s,T(b),b.s=d):c=null!=a.R;d=a.o;if(c)Sb(b,a.R);else if(c=!!a.o){if("/"!=d.charAt(0))if(this.s&&!this.o)d="/"+d;else{var e=b.o.lastIndexOf("/");-1!=e&&(d=b.o.substr(0,e+1)+d)}e=d;if(".."==e||"."==e)d="";else if(-1!=e.indexOf("./")||-1!=e.indexOf("/.")){d=0==e.lastIndexOf("/",0);e=e.split("/");for(var f=[],g=0;g<e.length;){var h=e[g++];"."==h?d&&g==e.length&&f.push(""):".."==
h?((1<f.length||1==f.length&&""!=f[0])&&f.pop(),d&&g==e.length&&f.push("")):(f.push(h),d=!0)}d=f.join("/")}else d=e}c?(T(b),b.o=d):c=""!==a.h.toString();c?Tb(b,a.h.clone()):c=!!a.K;c&&(a=a.K,T(b),b.K=a);return b};S.prototype.clone=function(){return new S(this)};
var Rb=function(a,b,c){T(a);a.A=c?U(b,!0):b;a.A&&(a.A=a.A.replace(/:$/,""))},Sb=function(a,b){T(a);if(b){b=Number(b);if(isNaN(b)||0>b)throw Error("Bad port number "+b);a.R=b}else a.R=null},Tb=function(a,b,c){T(a);b instanceof V?(a.h=b,a.h.ta(a.j)):(c||(b=W(b,Yb)),a.h=new V(b,0,a.j))};S.prototype.removeParameter=function(a){T(this);this.h.remove(a);return this};var T=function(a){if(a.Na)throw Error("Tried to modify a read-only Uri");};S.prototype.ta=function(a){this.j=a;this.h&&this.h.ta(a);return this};
var U=function(a,b){return a?b?decodeURI(a.replace(/%25/g,"%2525")):decodeURIComponent(a):""},W=function(a,b,c){return m(a)?(a=encodeURI(a).replace(b,Zb),c&&(a=a.replace(/%25([0-9a-fA-F]{2})/g,"%$1")),a):null},Zb=function(a){a=a.charCodeAt(0);return"%"+(a>>4&15).toString(16)+(a&15).toString(16)},Ub=/[#\/\?@]/g,Wb=/[\#\?:]/g,Vb=/[\#\?]/g,Yb=/[\#\?@]/g,Xb=/#/g,V=function(a,b,c){this.b=this.a=null;this.g=a||null;this.j=!!c},X=function(a){a.a||(a.a=new Q,a.b=0,a.g&&Qb(a.g,function(b,c){a.add(decodeURIComponent(b.replace(/\+/g,
" ")),c)}))};k=V.prototype;k.add=function(a,b){X(this);this.g=null;a=Y(this,a);var c=this.a.get(a);c||this.a.set(a,c=[]);c.push(b);this.b+=1;return this};k.remove=function(a){X(this);a=Y(this,a);return this.a.G(a)?(this.g=null,this.b-=this.a.get(a).length,this.a.remove(a)):!1};k.clear=function(){this.a=this.g=null;this.b=0};k.G=function(a){X(this);a=Y(this,a);return this.a.G(a)};k.forEach=function(a,b){X(this);this.a.forEach(function(c,d){ia(c,function(c){a.call(b,c,d,this)},this)},this)};
k.u=function(){X(this);for(var a=this.a.i(),b=this.a.u(),c=[],d=0;d<b.length;d++)for(var e=a[d],f=0;f<e.length;f++)c.push(b[d]);return c};k.i=function(a){X(this);var b=[];if(m(a))this.G(a)&&(b=ka(b,this.a.get(Y(this,a))));else{a=this.a.i();for(var c=0;c<a.length;c++)b=ka(b,a[c])}return b};k.set=function(a,b){X(this);this.g=null;a=Y(this,a);this.G(a)&&(this.b-=this.a.get(a).length);this.a.set(a,[b]);this.b+=1;return this};k.get=function(a,b){var c=a?this.i(a):[];return 0<c.length?String(c[0]):b};
k.toString=function(){if(this.g)return this.g;if(!this.a)return"";for(var a=[],b=this.a.u(),c=0;c<b.length;c++){var d=b[c],e=encodeURIComponent(String(d));d=this.i(d);for(var f=0;f<d.length;f++){var g=e;""!==d[f]&&(g+="="+encodeURIComponent(String(d[f])));a.push(g)}}return this.g=a.join("&")};k.clone=function(){var a=new V;a.g=this.g;this.a&&(a.a=this.a.clone(),a.b=this.b);return a};var Y=function(a,b){var c=String(b);a.j&&(c=c.toLowerCase());return c};
V.prototype.ta=function(a){a&&!this.j&&(X(this),this.g=null,this.a.forEach(function(a,c){var b=c.toLowerCase();c!=b&&(this.remove(c),this.remove(b),0<a.length&&(this.g=null,this.a.set(Y(this,b),la(a)),this.b+=a.length))},this));this.j=a};V.prototype.extend=function(a){for(var b=0;b<arguments.length;b++)Ob(arguments[b],function(a,b){this.add(b,a)},this)};var $b=function(a){this.H=a||{cookie:""}};k=$b.prototype;k.isEnabled=function(){return navigator.cookieEnabled};k.set=function(a,b,c,d,e,f){if(/[;=\s]/.test(a))throw Error('Invalid cookie name "'+a+'"');if(/[;\r\n]/.test(b))throw Error('Invalid cookie value "'+b+'"');void 0!==c||(c=-1);e=e?";domain="+e:"";d=d?";path="+d:"";f=f?";secure":"";c=0>c?"":0==c?";expires="+(new Date(1970,1,1)).toUTCString():";expires="+(new Date(da()+1E3*c)).toUTCString();this.H.cookie=a+"="+b+e+d+c+f};
k.get=function(a,b){for(var c=a+"=",d=(this.H.cookie||"").split(";"),e=0,f;e<d.length;e++){f=z(d[e]);if(0==f.lastIndexOf(c,0))return f.substr(c.length);if(f==a)return""}return b};k.remove=function(a,b,c){var d=this.G(a);this.set(a,"",0,b,c);return d};k.u=function(){return ac(this).keys};k.i=function(){return ac(this).values};k.G=function(a){return void 0!==this.get(a)};k.clear=function(){for(var a=ac(this).keys,b=a.length-1;0<=b;b--)this.remove(a[b])};
var ac=function(a){a=(a.H.cookie||"").split(";");for(var b=[],c=[],d,e,f=0;f<a.length;f++)e=z(a[f]),d=e.indexOf("="),-1==d?(b.push(""),c.push(e)):(b.push(e.substring(0,d)),c.push(e.substring(d+1)));return{keys:b,values:c}},bc=new $b("undefined"==typeof document?null:document);bc.pb=3950;var cc=function(){var a=(bc.get("GuidedHelpResume")||"").split(":"),b=a[2];a:{for(c in Ia)if(Ia[c]==b){var c=!0;break a}c=!1}return{J:parseInt(a[0],10)||0,B:a[1]||"",source:(c?b:void 0)||"CUSTOM"}};var dc={},ec=Ma("https://ssl.gstatic.com/inproduct_help/guidedhelp/guide_inproduct.js"),Eb=Oa(ec instanceof F&&ec.constructor===F&&ec.Da===La?ec.ga:"type_error:Const"),gc=function(a,b){return fc({S:b.S,document:b.document,I:b.I||"https://clients6.google.com",D:b.D,O:b.O,locale:b.locale}).then(function(){return q("help.guide.loadFlow")(a,b.B,b.Ua,b.Ia,b.source||"CUSTOM",b.document)})},ic=function(a,b,c,d,e,f,g,h,n,B){a=B||window.top.location;if(!hc(a).J)return!1;n=n||"";h=h||void 0;d=d||void 0;a=hc(a||
window.top.location);b=a.J?gc(a.J,{D:n,document:g,I:h,O:b,locale:c,source:a.source,B:a.B,S:d}):lb();nb(b);return!0},hc=function(a){a=a instanceof S?a.clone():new S(a,void 0);var b=a.h.get("ghstartsource")||"";return{J:parseInt(a.h.get("ghstartflowid"),10)||0,B:a.h.get("ghstartstepid")||"",source:{helpcenter:"HELPCENTER",email:"EMAIL",chat:"CHAT",forum:"FORUM",marketing:"MARKETING",onebox:"ONEBOX",testing:"TESTING"}[b]||"LINK"}},fc=function(a){window.guidedhelp=window.guidedhelp||{};if(window.guidedhelp.loaded)var b=
kb();else jc||(jc=Jb().then()),b=jc;return b.then(function(){q("help.guide.init")(a.O,a.locale,a.S,a.document,a.I,a.D,dc)})},jc=null,kc=function(a,b,c,d,e,f,g,h,n){if(!cc().J)return!1;a=n||"";g=g||void 0;h=h||void 0;d=d||void 0;e=cc();e.J?(bc.remove("GuidedHelpResume","/",""),b=gc(e.J,{D:a,document:g,I:h,O:b,locale:c,Ua:!1,B:e.B||void 0,S:d,source:e.source})):b=lb();nb(b);return!0};
p("hgb.loadFlow",function(a,b,c,d,e,f,g,h,n,B,tc,uc){nb(gc(a,{D:uc||"",Ia:n||!1,document:B||void 0,I:tc||void 0,O:c,locale:d,S:e||void 0,source:"CUSTOM",B:h||void 0}))},void 0);p("hgb.resumeCookiedFlow",kc,void 0);p("hgb.startFlowFromUrl",ic,void 0);var mc=function(a){lc();return Oa(a)},lc=r;var nc=/^[\w+/]+[=]{0,2}$/;var oc=function(a,b,c){a.timeOfStartCall=(new Date).getTime();var d=c||l,e=d.document,f;a:{if((f=(d||l).document.querySelector("script[nonce]"))&&(f=f.nonce||f.getAttribute("nonce"))&&nc.test(f))break a;f=void 0}f&&(a.nonce=f);if("help"==a.flow){var g=q("document.location.href",d);!a.helpCenterContext&&g&&(a.helpCenterContext=g.substring(0,1200));g=!0;if(b&&JSON&&JSON.stringify){var h=JSON.stringify(b);(g=1200>=h.length)&&(a.psdJson=h)}g||(b={invalidPsd:!0})}b=[a,b,c];d.GOOGLE_FEEDBACK_START_ARGUMENTS=
b;c=a.serverUri||"//www.google.com/tools/feedback";if(g=d.GOOGLE_FEEDBACK_START)g.apply(d,b);else{d=c+"/load.js?";for(var n in a)b=a[n],null!=b&&!v(b)&&(d+=encodeURIComponent(n)+"="+encodeURIComponent(b)+"&");a=(e?new Ua(9==e.nodeType?e:e.ownerDocument||e.document):fa||(fa=new Ua)).createElement("SCRIPT");f&&a.setAttribute("nonce",f);n=mc(d);a.src=H(n);e.body.appendChild(a)}};p("userfeedback.api.startFeedback",oc,void 0);var pc=function(a,b){var c=a.serverUri||"//www.gstatic.com/feedback";l.GOOGLE_HELP_SESSION_ARGUMENTS=arguments;var d=document.createElement("SCRIPT");c=mc(c+"/session_load.js");d.src=H(c);window.document.body.appendChild(d)};p("userfeedback.api.help.resumeOpenHelpSession",pc,void 0);p("userfeedback.api.help.startHelpWithChatSupport",function(a,b){a.flow="help";oc(a,b)},void 0);var qc=function(a,b){pc(a,b);var c=a.serverUri||"//www.google.com/tools/feedback";l.GOOGLE_HELP_CHAT_ARGUMENTS=arguments;var d=document.createElement("SCRIPT");c=mc(c+"/chat_load.js");d.src=H(c);window.document.body.appendChild(d)};p("userfeedback.api.help.loadChatSupport",qc,void 0);var Z=function(a,b){this.Qa=a;this.Ra=b.receiverUri;this.W=b.locale||b.locale||"en".replace(/-/g,"_");this.C=b.window||b.window||top;this.sa=b.zb||b.productData||{};this.oa=b.I||b.environment||"https://clients6.google.com";this.ba=b.ub||b.helpCenterPath||"";this.ka=b.D||b.apiKey||"";this.Ta=b.Ab||b.renderApiUri||""};p("help.service.Lazy",Z,void 0);Z.create=function(a,b){var c=new Z(a,b);kc(0,c.ba,c.W,null,0,0,c.C.document,c.oa,c.ka)||ic(0,c.ba,c.W,null,0,0,c.C.document,c.oa,c.ka,c.C.location);return c};
Z.prototype.Wa=function(a){rc();oc(sc(this,a),this.sa,this.C)};Z.prototype.startFeedback=Z.prototype.Wa;Z.prototype.Xa=function(a,b){var c=b||{};nb(gc(a,{D:this.ka,document:this.C.document,I:this.oa,O:this.ba,locale:this.W,B:c.stepId,source:c.source,S:c.theme}));window.U||(window.U={});window.U.vb=c.onerror;window.U.wb=c.ondismiss;window.U.yb=c.onstepenter;window.U.xb=c.onload};Z.prototype.startGuide=Z.prototype.Xa;Z.prototype.Za=function(){var a=q("help.guide.dismissFlow");a&&a()};
Z.prototype.stopGuide=Z.prototype.Za;
Z.prototype.Ya=function(a){var b=a||{};rc();oc(vc(this,a),this.sa,this.C);if(b.enableCache){var c;a=null;try{(c=this.C.localStorage||null)&&(a=c["helpPanelHtml_"+this.W])}catch(g){}if(c=a)if(a=this.C.document,b=b.customZIndex,!a.getElementById("google-feedback-wizard")){var d={id:"google-feedback-wizard",style:"border: 0; vertical-align:bottom; background: none; display: block; width: 100%; height: 100%; z-index: 10000000; top: -100%; left: 0; visibility: visible; opacity: 1;position: fixed",frameborder:"0",
allowTransparency:"true"},e=a.createElement("iframe");for(f in d)e.setAttribute(f,d[f]);b&&(e.style.zIndex=b);a.body.appendChild(e);var f=e.contentDocument||e.contentWindow.document;f.open();f.write(c);f.close()}}};Z.prototype.startHelp=Z.prototype.Ya;
var sc=function(a,b){var c=b||{};return{bucket:c.bucket,locale:a.W,callback:c.onend||r,serverUri:a.Ra,productId:a.Qa,productVersion:c.productVersion,authuser:c.authuser,abuseLink:c.abuseLink,customZIndex:c.customZIndex,flow:"wizard",enableAnonymousFeedback:c.enableAnonymousFeedback,allowNonLoggedInFeedback:c.allowNonLoggedInFeedback}},vc=function(a,b){var c=b||{},d=sc(a,b);sa(d,{anchor:c.anchor,contactBucket:c.contactBucket,flow:"help",helpCenterContext:c.context,helpCenterPath:a.ba,enableSendFeedback:c.enableSendFeedback||
!1,enableCache:c.enableCache,defaultHelpArticleId:c.defaultHelpArticleId,newApi:!0,suggestHost:c.suggestHost,renderApiUri:a.Ta});return d};Z.prototype.Pa=function(a){var b=a||{};a=vc(this,a);sa(a,{escalationJSONString:b.escalationJSONString});qc(a,this.sa)};Z.prototype.loadChatSupport=Z.prototype.Pa;Z.prototype.Sa=function(a,b,c){wc().register(a,b,c)};Z.prototype.registerHelpAction=Z.prototype.Sa;Z.prototype.La=function(a,b){var c=wc().ja[a];c&&c.da()&&c.na.apply(null,b||[])};
Z.prototype.executeHelpAction=Z.prototype.La;Z.prototype.Ma=function(a){return wc().da(a)};Z.prototype.isHelpActionApplicable=Z.prototype.Ma;var rc=function(){var a=window.GOOGLE_FEEDBACK_DESTROY_FUNCTION;a&&a()},wc=function(){var a=q("help.globals.actions",top);a||(a=new E,p("help.globals.actions",a,top));return a};}).call(this);
