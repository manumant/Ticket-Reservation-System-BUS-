﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
    <head>
        <title>Admin Page for Online Ticketing System</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="description" content="Slide Down Box Menu with jQuery and CSS3" />
        <meta name="keywords" content="jquery, css3, sliding, box, menu, cube, navigation, portfolio, thumbnails"/>
		<link rel="stylesheet" href="../css/style.css" type="text/css" media="screen"/>
        <style type="text/css">
			body{
				background:#333 url(../images/bg-body.jpg) repeat top left;
				font-family:Arial;
			}
			span.reference{
				position:fixed;
				left:10px;
				bottom:10px;
				font-size:12px;
			}
			span.reference a{
				color:#aaa;
				text-transform:uppercase;
				text-decoration:none;
				text-shadow:1px 1px 1px #000;
				margin-right:30px;
			}
			span.reference a:hover{
				color:#ddd;
			}
			ul.sdt_menu{
				margin-top:150px;
			}
			h1.title{
                text-decoration-color:azure;
				text-indent:-9000px;
				width:633px;
				height:69px;
			}
		    .style1
            {
                width: 629px;
                height: 80px;
            }
		</style>
    </head>

    <body>
        <div class="bg">
            			<h1 style="text-align: center">
                            <img class="style1" src="../Images/bannar.png" /></h1>
                        <h1 style="text-align: center">&nbsp;Admin Page</h1>
        </div>
		<div class="content">

			<ul id="sdt_menu" class="sdt_menu">
				<li>
					<a href="#">
						<img src="../images/2.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Admin</span>
							<span class="sdt_descr"></span>
						</span>
					</a>
                    <div class="sdt_box">
							<a href="addadmin.aspx">Add Admin</a>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="../images/1.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link"> User</span>
							<span class="sdt_descr"></span>
						</span>
					</a>
					<div class="sdt_box">
							<a href="ManageUser.aspx">Manage User</a>
                        	<a href="DeleteUser.aspx">Delete User</a>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="../images/4.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link"> BUS</span>
							<span class="sdt_descr"></span>
						</span>
					</a>
                    <div class="sdt_box">
							<a href="ManageBus.aspx">Manage Bus</a>
                        		<a href="DeleteBus.aspx">Delete Bus</a>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="../images/5.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">ROUTE</span>
							<span class="sdt_descr"></span>
						</span>
					</a>
                    <div class="sdt_box">
							<a href="ManageRoute.aspx">Manage Route</a>
                        <a href="DeleteRoute.aspx">Delete Route</a>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="../images/3.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Driver</span>
							<span class="sdt_descr"></span>
						</span>
					</a>
                    <div class="sdt_box">
							<a href="ManageDriver.aspx">Manage Driver</a>
                        <a href="DeleteDriver.aspx">Delete Driver</a>
					</div>
				</li>
				<li>
					<a href="#">
						<img src="../images/6.jpg" alt=""/>
						<span class="sdt_active"></span>
						<span class="sdt_wrap">
							<span class="sdt_link">Schedule</span>
							<span class="sdt_descr"></span>
						</span>
					</a>
					<div class="sdt_box">
						<a href="Schedule.aspx">Manage Schedule</a>
					</div>
				</li>
			</ul>
		</div>
          
       
        <!-- The JavaScript -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
		<script type="text/javascript" src="~/Scripts/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="~/Scripts/jquery-1.4.2.min.js"></script>
        <script type="text/javascript">
            $(function () {
                /**
				* for each menu element, on mouseenter, 
				* we enlarge the image, and show both sdt_active span and 
				* sdt_wrap span. If the element has a sub menu (sdt_box),
				* then we slide it - if the element is the last one in the menu
				* we slide it to the left, otherwise to the right
				*/
                $('#sdt_menu > li').bind('mouseenter', function () {
                    var $elem = $(this);
                    $elem.find('img')
						 .stop(true)
						 .animate({
						     'width': '170px',
						     'height': '170px',
						     'left': '0px'
						 }, 400, 'easeOutBack')
						 .andSelf()
						 .find('.sdt_wrap')
					     .stop(true)
						 .animate({ 'top': '140px' }, 500, 'easeOutBack')
						 .andSelf()
						 .find('.sdt_active')
					     .stop(true)
						 .animate({ 'height': '170px' }, 300, function () {
						     var $sub_menu = $elem.find('.sdt_box');
						     if ($sub_menu.length) {
						         var left = '170px';
						         if ($elem.parent().children().length == $elem.index() + 1)
						             left = '-170px';
						         $sub_menu.show().animate({ 'left': left }, 200);
						     }
						 });
                }).bind('mouseleave', function () {
                    var $elem = $(this);
                    var $sub_menu = $elem.find('.sdt_box');
                    if ($sub_menu.length)
                        $sub_menu.hide().css('left', '0px');

                    $elem.find('.sdt_active')
						 .stop(true)
						 .animate({ 'height': '0px' }, 300)
						 .andSelf().find('img')
						 .stop(true)
						 .animate({
						     'width': '0px',
						     'height': '0px',
						     'left': '85px'
						 }, 400)
						 .andSelf()
						 .find('.sdt_wrap')
						 .stop(true)
						 .animate({ 'top': '25px' }, 500);
                });
            });
        </script>
    </body>
</html>