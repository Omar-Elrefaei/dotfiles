   �         Uhttps://tylerlh.github.io/github-latest-commits-widget/dist/javascripts/bundle.min.js     %���&N     %|�G�         
     O K           �      Server   
GitHub.com   Content-Type   %application/javascript; charset=utf-8   Last-Modified   Mon, 31 Mar 2014 05:58:02 GMT   Access-Control-Allow-Origin   *   Expires   Sat, 21 Oct 2017 06:29:35 GMT   Cache-Control   max-age=600   Content-Encoding   gzip   X-GitHub-Request-Id   #9590:7A69:F1D4275:15C91D5E:59EAE6F7   Accept-Ranges   bytes   Date   Sat, 21 Oct 2017 11:47:44 GMT   Via   1.1 varnish   Age   430   X-Served-By   cache-bma7026-BMA   X-Cache   HIT   X-Cache-Hits   1   X-Timer   S1508586465.669434,VS0,VE0   Vary   Accept-Encoding   X-Fastly-Request-ID   (47446d402a5ec368ddb1f0a5518d870133a89eab $.extend({getUrlVars:function(){var t,e,a,r;for(r=[],t=void 0,e=window.location.href.slice(window.location.href.indexOf("?")+1).split("&"),a=0;a<e.length;)t=e[a].split("="),r.push(t[0]),r[t[0]]=t[1],a++;return r},getUrlVar:function(t){return $.getUrlVars()[t]}}),$(function(){var t,e,a,r,n,i,o,s;return n=$.getUrlVars(),s=n.username,i=n.repo,r=n.limit,t=n.branch,a=$("#latest-commits-widget"),e=function(t){var e;return t=t.data,e=$("#commit-history"),e.empty(),$(t).each(function(t,a){return null!=a.author?e.append('<li class="clearfix">\n  <div class="left">\n    <img class="commit-avatar" src="'+a.author.avatar_url+'">\n  </div>\n  <div class="commit-author-info left">\n      <a href="https://github.com/'+a.author.login+'"><b class="commit-author">'+a.author.login+'</b></a>\n      <br />\n      <b class="commit-date">'+$.timeago(a.commit.committer.date)+'</b><br /><i class="commit-sha">SHA: '+a.sha+'</i>\n      <br />\n      <a class="commit-message" href="https://github.com/'+s+"/"+i+"/commit/"+a.sha+'" target="_blank">'+a.commit.message+"</a>\n  </div>\n</li>"):void 0})},a.find("h4").text("Latest Commits to "+s+"/"+i),o="https://api.github.com/repos/"+s+"/"+i+"/commits?callback=callback",null!=n.branch&&(o+="&sha="+t),$.ajax(o,{data:{per_page:r},dataType:"jsonp",type:"get"}).success(function(t){return e(t)})}),function(t){function e(){var e=a(this);return isNaN(e.datetime)||t(this).text(r(e.datetime)),this}function a(e){if(e=t(e),!e.data("timeago")){e.data("timeago",{datetime:i.datetime(e)});var a=t.trim(e.text());a.length>0&&e.attr("title",a)}return e.data("timeago")}function r(t){return i.inWords(n(t))}function n(t){return(new Date).getTime()-t.getTime()}t.timeago=function(e){return r(e instanceof Date?e:"string"==typeof e?t.timeago.parse(e):t.timeago.datetime(e))};var i=t.timeago;t.extend(t.timeago,{settings:{refreshMillis:6e4,allowFuture:!1,strings:{prefixAgo:null,prefixFromNow:null,suffixAgo:"ago",suffixFromNow:"from now",seconds:"less than a minute",minute:"about a minute",minutes:"%d minutes",hour:"about an hour",hours:"about %d hours",day:"a day",days:"%d days",month:"about a month",months:"%d months",year:"about a year",years:"%d years",wordSeparator:" ",numbers:[]}},inWords:function(e){function a(a,n){var i=t.isFunction(a)?a(n,e):a,o=r.numbers&&r.numbers[n]||n;return i.replace(/%d/i,o)}var r=this.settings.strings,n=r.prefixAgo,i=r.suffixAgo;this.settings.allowFuture&&0>e&&(n=r.prefixFromNow,i=r.suffixFromNow);var o=Math.abs(e)/1e3,s=o/60,u=s/60,m=u/24,c=m/365,l=45>o&&a(r.seconds,Math.round(o))||90>o&&a(r.minute,1)||45>s&&a(r.minutes,Math.round(s))||90>s&&a(r.hour,1)||24>u&&a(r.hours,Math.round(u))||42>u&&a(r.day,1)||30>m&&a(r.days,Math.round(m))||45>m&&a(r.month,1)||365>m&&a(r.months,Math.round(m/30))||1.5>c&&a(r.year,1)||a(r.years,Math.round(c)),d=void 0===r.wordSeparator?" ":r.wordSeparator;return t.trim([n,l,i].join(d))},parse:function(e){var a=t.trim(e);return a=a.replace(/\.\d\d\d+/,""),a=a.replace(/-/,"/").replace(/-/,"/"),a=a.replace(/T/," ").replace(/Z/," UTC"),a=a.replace(/([\+\-]\d\d)\:?(\d\d)/," $1$2"),new Date(a)},datetime:function(e){var a="time"===t(e).get(0).tagName.toLowerCase(),r=t(e).attr(a?"datetime":"title");return i.parse(r)}}),t.fn.timeago=function(){var t=this;t.each(e);var a=i.settings;return a.refreshMillis>0&&setInterval(function(){t.each(e)},a.refreshMillis),t},document.createElement("abbr"),document.createElement("time")}(jQuery);