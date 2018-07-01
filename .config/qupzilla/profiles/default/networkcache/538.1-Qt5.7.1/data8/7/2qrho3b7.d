   �         "https://qupzilla.com/css/style.css�       ����      %~���         
     O K           �      Date   Sat, 21 Oct 2017 11:45:24 GMT   Server   Apache/2.4.25 (Debian)   Last-Modified   Thu, 29 Oct 2015 12:48:58 GMT   ETag   "2977-5233dbc0eb56d-gzip"   Accept-Ranges   bytes   Vary   Accept-Encoding   Content-Encoding   gzip   Content-Type   text/css /* Getting the new tags to behave */
article, aside, audio, canvas, command, datalist, details, embed, figcaption, figure, footer, header, hgroup, keygen, meter, nav, output, progress, section, source, video{ display: block; }
mark, rp, rt, ruby, summary, time{ display: inline }

/* Global properties ======================================================== */
body {
	background:#e1e1e1;
	font-family:Arial, Helvetica, sans-serif;
	font-size:100%;
	line-height:1.125em;
	color:#899a9d;
}
html {
	min-width:980px;
}
html, body {
	height:100%;
}



/* Global Structure ============================================================= */
.container_24 {
	font-size:13px;
}

	/* Header */
	header{
		height:75px;
		background:url(../images/header-tail.gif) 0 0 repeat-x #101010;
		border-bottom:4px solid #ccc;
	}

	/* Content */
	#content {
		background:#ececec;
		width:100%;
		padding:46px 0 46px 0;
	}

/* Top columns */
.top-block {
	float:left;
	width:100%;
	margin-top:-20px;
	}
.top-column-left {
	width:65%;
	float:left;
}
.top-column-right {
	width:35%;
	float:right;
	line-height:500px;
	height:500px;

}
#download-box {
	padding-top:225px;
	line-height:60px;
	display:inline-block;
}

.download-text {
	font-size:38px;
}

.download-button {
	font-size:20px;
	font-family:Arial,Helvetica,sans-serif;
	padding: 10px 10px 10px 10px;
	background:#37ADD6;
	text-decoration:none;
	color:white;
	text-transform:capitalize;
	border-radius: 5px;
}
.download-version {
	padding-left: 10px;
	font-size: 20px;
}


/* Left & Right alignment */

.fleft { float:left;}
.fright { float:right;}
.clear { clear:both;}

.col-1, .col-2, .col-3 { float:left;}

.alignright { text-align:right;}
.aligncenter { text-align:center;}

.wrapper {
	width:100%;
	overflow:hidden;
}

.wrapper h2 {
	padding: 30px 20px 20px 0px;
	font-size: 26px;
	margin-bottom: 0;
}

.wrapper h4 {
	padding-top: 15px;
}

.inside{ padding: 20px; }


/*----- form defaults -----*/
input, select, textarea {
	font-family:Arial, Helvetica, sans-serif;
	font-size:1em;
	vertical-align:middle;
	font-weight:normal;
}

/*----- other -----*/
.img-indent {
	margin:0 26px 0 0;
	float:left;
}
.img-box {
	width:100%;
	overflow:hidden;
	padding-bottom:30px;
}
	.img-box img {
		float:left;
		margin:0 20px 0 0;
	}

.extra-wrap {
	overflow:hidden;
}

p {margin-bottom:18px;}
.p1 { margin-bottom:9px;}
.p2 { margin-bottom:18px;}
.p3 { margin-bottom:27px;
}


/*----- txt, links, lines, titles -----*/
a {
	color:#37add6;
	outline:none;
}
a:hover{
	text-decoration:none;
}

h2 {
	font-size:20px;
	line-height:1.2em;
	font-family:Arial,Helvetica,sans-serif;
	color:#3b3b3b;
	padding:50px 0 0 0;
	margin-bottom:-15px;

}

.screeny h2 {
	padding-top: 20px;
}

.box1 h2 {
	margin-bottom:20px;
}

h3 {
	font-size:11px;
	text-transform:uppercase;
	color:#fff !important;
	border-bottom:1px solid #fff;
	position:relative;
	padding:6px 0 14px 60px;
	height:1%;
	margin-bottom:22px;
	line-height:18px !important;
	text-shadow:1px 1px 0 rgba(0, 0, 0, .3);
}
	h3 img {
		position:absolute;
		left:0;
		top:0;
	}
h4 {
	font-size:1.5em;
	font-family:Arial,Helvetica,sans-serif;
	color:#3b3b3b;
	margin-bottom: 10px;
}
h5 {
	font-size:1em;
	color:#2b2b2b;
}
h6 {
	font-size:.91em;
}

.link1 {
	background:url(../images/bull-1.gif) no-repeat 0 7px;
	padding:0 0 0 13px;
	font-size:16px;
	line-height:1.2em;
	color:#010101;
}
.link2 {
	color:#37add6;
	font-size:14px;
	line-height:20px;
	font-style:italic;
}


.button {
	display:inline-block;
	position:absolute;
	font-size:11px;
	color:#fff;
	padding:0 21px 0 21px;
	line-height:40px;
	background-image:url(../images/button-shad.png);
	background-repeat:repeat-x;
	background-position:0 100%;
	text-decoration:none;
	text-transform:uppercase;
	font-weight:bold;
	border-radius:20px;
	-moz-border-radius:20px;
	-webkit-border-radius:20px;
	behavior:url(js/PIE.htc);
}
	.button span {
		display:block;
		background:url(../images/blink.png) no-repeat 0 0;
		width:75px;
		height:13px;
		overflow:hidden;
		position:absolute;
		left:50%;
		top:-4px;
		margin-left:-38px;
	}
.button:hover {
	text-shadow:0 0 5px #fff;
}

.separator {
	background:url(../images/separator.gif) 0 0 repeat-x;
	height:3px;
	overflow:hidden;
	font-size:0;
	line-height:0;
	margin:30px 0 25px 0;
}


/*==================boxes====================*/
.box {
	background-image:url(../images/box-bg.png);
	background-repeat:no-repeat;
	background-position:0 0;
	padding:20px 19px 53px 19px;
	line-height:20px;
	border-radius:10px;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	behavior:url(js/PIE.htc);
	position:relative;
	min-height: 180px;
}
	.box a {color:#fff;}
	.box .button {
		right:19px;
		bottom:-19px;
	}

.box.color1 {
	background-color:#95b603;
	color:#dbe7a8;
}
	.box.color1 h3 {
		border-color:#b2cd3f;
	}
	.box.color1 .button {
		background-color:#a1c501;
	}
.box.color2 {
	background-color:#52afed;
	color:#c2e2f8;
}
	.box.color2 h3 {
		border-color:#7ec3f0;
	}
	.box.color2 .button {
		background-color:#61baf4;
	}
.box.color3 {
	background-color:#eb3d25;
	color:#f7c1ba;
}
	.box.color3 h3 {
		border-color:#ea7566;
	}
	.box.color3 .button {
		background-color:#f7543d;
	}
.box.color4 {
	background-color:#60124b;
	color:#e8a4d5;
}
	.box.color4 h3 {
		border-color:#863870;
	}
	.box.color4 .button {
		background-color:#79185f;
	}
	.box .inner {
		padding:0 3px 0 11px;
	}

/*--- box1 ---*/
.box1 {
	background:#e5e5e5;
	border-radius:10px;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	behavior:url(js/PIE.htc);
	position:relative;
	padding:24px 24px 45px 24px;
}
	.box1 h2 {
		padding-top:0;
	}


.address {
	float:left;
	margin-right:25px;
}
	.address dt {
		margin-bottom:18px;
	}
	.address dt:first-line {color:#000; font-weight:bold;}
	.address dd {
		clear:both;
	}
		.address dd span {
			float:left;
			width:80px;
		}



/*===== header =====*/
header .logo {
	position:absolute;
	left:0;
	top:15px;
	background:url(../images/qupzilla.png) no-repeat 0 0;
	padding:0 0 0 55px;
	height:50px;
}
	header .logo h1 {
		font-size:28px;
		line-height:50px;
		color:#dadada;
		font-family: Arial,Helvetica,sans-serif;
		font-weight:normal;
	}
		header .logo h1 a {
			color:#dadada;
			text-decoration:none;
		}
	header .logo span {
		display:block;
		font-size:10px;
		text-transform:uppercase;
		margin-top:-5px;
		color:#5a6466;
	}

header nav {
	position:absolute;
	right:20px;
	top:20px;
}
	header nav li {
		float:left;
		padding-left:10px;
	}
		header nav li a {
			float:left;
			font-size:13px;
			font-weight: bold;
			font-family:Arial,Helvetica,sans-serif;
			color:#888888;
			text-decoration:none;
			text-transform: uppercase;
			padding:10px 10px 10px 10px;
			border-radius:5px;
			-moz-border-radius:10px;
			-webkit-border-radius:10px;
			behavior:url(js/PIE.htc);
			position:relative;
		}
		header nav li a:hover, header nav li a.current {
			background:#ececec;
			color:#1d1d1d;
		}

/*===== content =====*/
#content .row {
	border-bottom:5px solid #e3e3e3;
	padding-bottom:60px;
	margin-bottom:50px;
}

#content .rowd {
	padding-bottom:20px;
	margin-bottom:20px;
}

	.extra-list {
		padding-bottom:18px;
	}
	.extra-list li {
		padding-bottom:6px;
		width:100%;
	}
		.extra-list li a {
			position:relative;
			display:block;
			border:1px solid #fff;
			padding:17px 0 17px 60px;
			font-size:16px;
			background:url(../images/list-tail.gif) 0 0 repeat-x #efefef;
			height:1%;
			border-radius:10px;
			-moz-border-radius:10px;
			-webkit-border-radius:10px;
			behavior:url(js/PIE.htc);
		}
		.extra-list li a:hover {background:#fff;}
			.extra-list li a img {
				display:block;
				position:absolute;
				left:24px;
				top:14px;
			}

	.list1 {
		margin-bottom:1em;
	}
		.list1 li {
			line-height:20px;
			font-size:14px;
		}
			.list1 li a {
				font-style:italic;
			}

.row-1 {
}

div.rowd-2 div {
 display: none;
 opacity: 0;
 transition: opacity 0.5s ease-in-out;
 -webkit-transition: opacity 0.5s ease-in-out;
 -moz-transition: opacity 0.5s ease-in-out;
 -ms-transition: opacity 0.5s ease-in-out;
 -o-transition: opacity 0.5s ease-in-out;
}

div.rowd-2 div:target {
 display: block;
 opacity: 1;
 transition: opacity 0.5s ease-in-out;
 -webkit-transition: opacity 0.5s ease-in-out;
 -moz-transition: opacity 0.5s ease-in-out;
 -ms-transition: opacity 0.5s ease-in-out;
 -o-transition: opacity 0.5s ease-in-out;
}

.title {
  border-bottom: 5px solid #e3e3e3;
  padding-bottom: 10px;
  margin-bottom: 30px;
  text-align: center;
  font-size: 15pt;
  font-weight: bold;
}

/*===== footer =====*/
footer {
	border-top:1px solid #c5c5c5;
	color:#969696;
	padding:50px 0 20px 0;
}

footer .container_24 {
	font-size:.75em;
}

footer nav ul {
	margin-left:-5px;
	padding-bottom:.5em;
}

footer nav ul li {
	display:inline;
}

footer nav ul li a {
	padding:0 8px 0 5px;
    color:#56514c;
}

footer a {
	color:#969696;
	text-decoration:none;
}

footer a:hover {
	text-decoration:underline;
}

footer span {
	color:#000;
}

footer .languages {
}

footer .languages ul {
	display:inline-block;
	padding-top: 5px;
}
footer .languages li a{
	padding-right: 30px;
	display:list-item;

}
footer .languages .english {
    font-weight: bold;
}

#gh-frame {
	float:right;
	width: 500px;
	height: 252px;
}

/*--g-- forms -----*/
#contacts-form fieldset {
	border:none;
	width:100%;
	overflow:hidden;
	display:block;
	padding-top:20px;
}

#contacts-form label {
	display:block;
	height:70px;
	overflow:hidden;
	font-weight:bold;
}

#contacts-form strong {
	color:#373732;
}

#contacts-form input {
	color:#111;
	border:1px solid #a09b96;
	background:#fff;
	padding:3px 0 3px 5px;
	width:215px;
}

#contacts-form textarea {
	color:#111;
	border:1px solid #a09b96;
	background:#fff;
	padding:3px 0 3px 5px;
	width:310px;
	overflow:auto;
	height:155px;
	margin-bottom:18px;
}

/*==========================================*/

.screeny td{
	padding: 10px 20px 20px 20px;
}

.screeny img{
  	border:3px solid;
  	border-radius:5px;
}

.pindex {
    display: block;
    line-height: 1.7em;
    padding-right: 10px;
    margin-bottom: 30px;
}

.index-img {
    padding: 10px;
}

/*========== Download =======*/
.os-text{
  padding-top: 10px;
  text-align:center;
  font-size: 12pt;
}

.os-choose{
  margin-top: 20px;
  margin-bottom: -50px;
  text-align:center;
  font-size: 15pt;
  font-weight: bold;
}

.os-wrapper {
	width:850px;
	overflow:hidden;
    margin: 0 auto;
}

.down-box{
  margin-top: -20px;
  text-align: center;
  font-size: 12pt;
}

#header_description {
  margin-left:90px;
  margin-right:auto;
}

/* contribute.php map */
#map_contribute {
  float: right;
}

.down-box pre{
  text-align: left;
}

