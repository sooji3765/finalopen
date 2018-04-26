<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="robots" content="noindex, nofollow">

    <title>Vertical Menu - Bootsnipp.com</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <style type="text/css">
    
/*  ppit tab */
div.ppit-tab-container{
  z-index: 10;
  background-color: #ffffff;
  padding: 0 !important;
  border-radius: 4px;
  -moz-border-radius: 4px;
  border:1px solid #ddd;
  margin-top: 20px;
  margin-left: 50px;
  -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
  box-shadow: 0 6px 12px rgba(0,0,0,.175);
  -moz-box-shadow: 0 6px 12px rgba(0,0,0,.175);
  background-clip: padding-box;
  opacity: 0.97;
  filter: alpha(opacity=97);
}
div.ppit-tab-menu{
  padding-right: 0;
  padding-left: 0;
  padding-bottom: 0;
}
div.ppit-tab-menu div.list-group{
  margin-bottom: 0;
}
div.ppit-tab-menu div.list-group>a{
  margin-bottom: 0;
}
div.ppit-tab-menu div.list-group>a .glyphicon,
div.ppit-tab-menu div.list-group>a .fa {
  color: #8d6cab;
}
div.ppit-tab-menu div.list-group>a:first-child{
  border-top-right-radius: 0;
  -moz-border-top-right-radius: 0;
}
div.ppit-tab-menu div.list-group>a:last-child{
  border-bottom-right-radius: 0;
  -moz-border-bottom-right-radius: 0;
}
div.ppit-tab-menu div.list-group>a.active,
div.ppit-tab-menu div.list-group>a.active .glyphicon,
div.ppit-tab-menu div.list-group>a.active .fa{
  background-color: #8d6cab;
  background-image: #8d6cab;
  color: #ffffff;
}
div.ppit-tab-menu div.list-group>a.active:after{
  content: '';
  position: absolute;
  left: 100%;
  top: 50%;
  margin-top: -13px;
  border-left: 0;
  border-bottom: 13px solid transparent;
  border-top: 13px solid transparent;
  border-left: 10px solid #8d6cab;
}

div.ppit-tab-content{
  background-color: #ffffff;
  /* border: 1px solid #eeeeee; */
  padding-left: 20px;
  padding-top: 10px;
}

div.ppit-tab div.ppit-tab-content:not(.active){
  display: none;
}
    </style>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        window.alert = function(){};
        var defaultCSS = document.getElementById('bootstrap-css');
        function changeCSS(css){
            if(css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="'+ css +'" type="text/css" />'); 
            else $('head > link').filter(':first').replaceWith(defaultCSS); 
        }
        $( document ).ready(function() {
          var iframe_height = parseInt($('html').height()); 
          window.parent.postMessage( iframe_height, 'https://bootsnipp.com');
        });
    </script>
</head>
<body>
	<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-5 col-sm-8 col-xs-9 ppit-tab-container">
            <div class="col-lg-2 col-md-3 col-sm-3 col-xs-3 ppit-tab-menu">
              <div class="list-group">
              <a href="#" class="list-group-item active text-center">
                  <h5 class="glyphicon glyphicon-home"></h5><br/>Home
                </a>
                <a href="#" class="list-group-item text-center">
                  <h5 class="glyphicon glyphicon-search"></h5><br/>Search
                </a>
                <a href="#" class="list-group-item text-center" onclick="gotoDiv('account-summary-holder')">
                  <h5 class="glyphicon glyphicon-cloud"></h5><br/>Account Summary
                </a>
                <a href="#" class="list-group-item text-center" onclick="gotoDiv('usage-holder')">
                  <h5 class="glyphicon glyphicon-user"></h5><br/>Usage Summary
                </a>
                <a href="#" class="list-group-item text-center" onclick="gotoDiv('payment-holder')">
                  <h5 class="glyphicon glyphicon-credit-card"></h5><br/>Payment History
                </a>
                <a href="#" class="list-group-item text-center" onclick="gotoDiv('search-holder')">
                  <h5 class="glyphicon glyphicon-cloud-download"></h5><br/>Search history
                </a>
                <a href="#" class="list-group-item text-center">
                  <h5 class="glyphicon glyphicon-cloud-upload"></h5><br/>Upload History
                </a>
                 <a href="#" class="list-group-item text-center">
                  <h5 class="glyphicon glyphicon-cloud-upload"></h5><br/>dddd
                </a>
                 <a href="#" class="list-group-item text-center">
                  <h5 class="glyphicon glyphicon-cloud-upload"></h5><br/>aaaa
                </a>
              </div>
            </div>
            <div class="col-lg-10 col-md-9 col-sm-9 col-xs-9 ppit-tab">
                <div class="ppit-tab-content active">
                    <center>
                      <p>
                          Account Summary
                      </p>
                    </center>
                </div>
                
                <div class="ppit-tab-content">
                    <center>
                      <p>
                         Search
                      </p>
                    </center>
                </div>
    
                <div class="ppit-tab-content">
                    <center>
                      <p>
                          Account Summary
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                          Usage Summary
                      </p>
                    </center>
                </div>
                <div class="ppit-tab-content">
                    <center>
                      <p>
                          Account Summaryssas
                      </p>
                    </center>
                </div>
            </div>
        </div>
  </div>
</div>
	<script type="text/javascript">
	$(document).ready(function() {
    $("div.ppit-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.ppit-tab>div.ppit-tab-content").removeClass("active");
        $("div.ppit-tab>div.ppit-tab-content").eq(index).addClass("active");
    });
});
	</script>
</body>
</html>
