   �         Rhttps://tylerlh.github.io/github-latest-commits-widget/dist/stylesheets/screen.css     %���)�     %|�G�         
     O K           �      Server   
GitHub.com   Content-Type   text/css; charset=utf-8   Last-Modified   Mon, 31 Mar 2014 05:58:02 GMT   Access-Control-Allow-Origin   *   Expires   Sat, 21 Oct 2017 07:00:49 GMT   Cache-Control   max-age=600   Content-Encoding   gzip   X-GitHub-Request-Id   "9296:18C4:43893F6:607F44A:59EAEE49   Accept-Ranges   bytes   Date   Sat, 21 Oct 2017 11:47:46 GMT   Via   1.1 varnish   Age   432   X-Served-By   cache-bma7026-BMA   X-Cache   HIT   X-Cache-Hits   1   X-Timer   S1508586467.966012,VS0,VE0   Vary   Accept-Encoding   X-Fastly-Request-ID   (1a82c16af4b0fb4479593732b1964de4a9196c80 @import url(http://weloveiconfonts.com/api/?family=fontawesome);
/* line 17, ../../../../.rvm/gems/ruby-1.9.3-p327/gems/compass-0.12.4/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed,
figure, figcaption, footer, header, hgroup,
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font: inherit;
  font-size: 100%;
  vertical-align: baseline;
}

/* line 22, ../../../../.rvm/gems/ruby-1.9.3-p327/gems/compass-0.12.4/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
html {
  line-height: 1;
}

/* line 24, ../../../../.rvm/gems/ruby-1.9.3-p327/gems/compass-0.12.4/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
ol, ul {
  list-style: none;
}

/* line 26, ../../../../.rvm/gems/ruby-1.9.3-p327/gems/compass-0.12.4/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
table {
  border-collapse: collapse;
  border-spacing: 0;
}

/* line 28, ../../../../.rvm/gems/ruby-1.9.3-p327/gems/compass-0.12.4/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
caption, th, td {
  text-align: left;
  font-weight: normal;
  vertical-align: middle;
}

/* line 30, ../../../../.rvm/gems/ruby-1.9.3-p327/gems/compass-0.12.4/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
q, blockquote {
  quotes: none;
}
/* line 103, ../../../../.rvm/gems/ruby-1.9.3-p327/gems/compass-0.12.4/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
q:before, q:after, blockquote:before, blockquote:after {
  content: "";
  content: none;
}

/* line 32, ../../../../.rvm/gems/ruby-1.9.3-p327/gems/compass-0.12.4/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
a img {
  border: none;
}

/* line 116, ../../../../.rvm/gems/ruby-1.9.3-p327/gems/compass-0.12.4/frameworks/compass/stylesheets/compass/reset/_utilities.scss */
article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary {
  display: block;
}

/* fontawesome */
/* line 6, ../../src/scss/screen.scss */
[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}

/* line 10, ../../src/scss/screen.scss */
.clearfix:after {
  content: ".";
  display: block;
  clear: both;
  visibility: hidden;
  line-height: 0;
  height: 0;
}

/* line 19, ../../src/scss/screen.scss */
* {
  box-sizing: border-box;
}

/* line 23, ../../src/scss/screen.scss */
.clearfix {
  display: inline-block;
}
/* line 24, ../../src/scss/screen.scss */
.clearfix:after {
  visibility: hidden;
  display: block;
  font-size: 0;
  content: " ";
  clear: both;
  height: 0;
}

/* start commented backslash hack \*/
/* line 37, ../../src/scss/screen.scss */
* html .clearfix {
  height: 1%;
}

/* line 41, ../../src/scss/screen.scss */
.clearfix {
  display: block;
}

/* close commented backslash hack */
/* line 47, ../../src/scss/screen.scss */
body {
  margin: 0;
  padding: 0;
}

/* line 52, ../../src/scss/screen.scss */
.gh-icon {
  font-size: 1.5rem;
  line-height: 1.5rem;
}

/* line 57, ../../src/scss/screen.scss */
#latest-commits-widget {
  border: 1px solid #cacaca;
  width: 500px;
  height: 250px;
  font: 13px helvetica, arial, freesans, clean, sans-serif;
  background: #dedede;
}
/* line 63, ../../src/scss/screen.scss */
#latest-commits-widget a {
  color: #4183c4;
}
/* line 65, ../../src/scss/screen.scss */
#latest-commits-widget a:visited {
  color: #4183c4;
}
/* line 68, ../../src/scss/screen.scss */
#latest-commits-widget a:hover {
  text-decoration: underline;
}

/* line 74, ../../src/scss/screen.scss */
#latest-commits-header {
  background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #f1f1f1), color-stop(100%, #e1e1e1));
  background-image: -webkit-linear-gradient(#f1f1f1, #e1e1e1);
  background-image: -moz-linear-gradient(#f1f1f1, #e1e1e1);
  background-image: -o-linear-gradient(#f1f1f1, #e1e1e1);
  background-image: linear-gradient(#f1f1f1, #e1e1e1);
  border-bottom: 1px solid #CACACA;
  color: #52595d;
  height: 35px;
  margin: 0;
  padding: 5px 0 0 5px;
  text-shadow: 1px 0 1px rgba(255, 255, 255, 0.7);
  font-size: 1.3em;
  font-weight: bold;
}
/* line 84, ../../src/scss/screen.scss */
#latest-commits-header h4 {
  margin: 3px 0;
  display: inline-block;
}

/* line 90, ../../src/scss/screen.scss */
#latest-commits-widget ul#commit-history {
  overflow-y: auto;
  height: 214px;
  padding-left: 0;
  margin: 0;
}
/* line 95, ../../src/scss/screen.scss */
#latest-commits-widget ul#commit-history li {
  list-style-type: none;
  background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #f1f1f1), color-stop(100%, #e1e1e1));
  background-image: -webkit-linear-gradient(#f1f1f1, #e1e1e1);
  background-image: -moz-linear-gradient(#f1f1f1, #e1e1e1);
  background-image: -o-linear-gradient(#f1f1f1, #e1e1e1);
  background-image: linear-gradient(#f1f1f1, #e1e1e1);
  border-bottom: 1px solid #CACACA;
  padding: 5px;
  width: 100%;
}
/* line 101, ../../src/scss/screen.scss */
#latest-commits-widget ul#commit-history li .commit-message {
  font-size: .8em;
  text-decoration: none;
  line-height: 1.3em;
}
/* line 105, ../../src/scss/screen.scss */
#latest-commits-widget ul#commit-history li .commit-message:hover {
  text-decoration: underline;
}
/* line 109, ../../src/scss/screen.scss */
#latest-commits-widget ul#commit-history li .commit-sha {
  color: #999;
  font-size: .8em;
}
/* line 113, ../../src/scss/screen.scss */
#latest-commits-widget ul#commit-history li .commit-date {
  color: #444;
  font-size: .8em;
}
/* line 117, ../../src/scss/screen.scss */
#latest-commits-widget ul#commit-history li .commit-author-info a {
  color: #444;
  text-decoration: none;
}
/* line 120, ../../src/scss/screen.scss */
#latest-commits-widget ul#commit-history li .commit-author-info a:visited {
  color: #444;
  text-decoration: none;
}
/* line 125, ../../src/scss/screen.scss */
#latest-commits-widget ul#commit-history li .commit-avatar {
  margin-top: 10px;
  height: 50px;
  width: 50px;
  border-radius: 4px;
  border: 1px solid #dedede;
}
/* line 132, ../../src/scss/screen.scss */
#latest-commits-widget ul#commit-history li .commit-author-info {
  padding: 10px;
  width: 85%;
}

/* line 139, ../../src/scss/screen.scss */
.left {
  float: left;
}
