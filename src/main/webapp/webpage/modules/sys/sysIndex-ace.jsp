<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>权限管理系统</title>

	<%@ include file="/webpage/include/acehead.jsp"%>
	<script src="${ctxStatic}/common/inspinia-ace.js?v=3.2.0"></script>
	<script src="${ctxStatic}/common/contabs.js"></script> 

</head>

<body class="no-skin">
		<!-- #section:basics/navbar.layout -->
		<div id="navbar" class="navbar navbar-default">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<!-- #section:basics/sidebar.mobile.toggle -->
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<!-- /section:basics/sidebar.mobile.toggle -->
				<div class="navbar-header pull-left">
					<!-- #section:basics/navbar.layout.brand -->
					<a href="#" class="navbar-brand">
						<small>
							<i class="fa fa-leaf"></i>
							权限管理系统
						</small>
					</a>

					<!-- /section:basics/navbar.layout.brand -->

					<!-- #section:basics/navbar.toggle -->

					<!-- /section:basics/navbar.toggle -->
				</div>

				<!-- #section:basics/navbar.dropdown -->
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">


						<!-- #section:basics/navbar.user_menu -->
						<li class="light-blue ">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<%-- <img class="nav-user-photo" src="${ctxStatic }/images/head.png" /> --%>
								<span class="user-info">
									<small>欢迎,</small>
									${fns:getUser().name}
								</span>

								<i class="ace-icon fa fa-caret-down"></i>
							</a>

							<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a class="J_menuItem" href="${ctx }/sys/user/info">
										<i class="ace-icon fa fa-user"></i>
										个人资料
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a class="J_menuItem" href="${ctx}/logout">
										<i class="ace-icon fa fa-power-off"></i>
										安全退出
									</a>
								</li>
							</ul>
						</li>

						<!-- /section:basics/navbar.user_menu -->
					</ul>
				</div>

				<!-- /section:basics/navbar.dropdown -->
			</div><!-- /.navbar-container -->
		</div>

		<!-- /section:basics/navbar.layout -->
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<!-- #section:basics/sidebar -->
			<div id="sidebar" class="sidebar                  responsive">
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
				</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span>

						<span class="btn btn-info"></span>

						<span class="btn btn-warning"></span>

						<span class="btn btn-danger"></span>
					</div>
				</div><!-- /.sidebar-shortcuts -->

						 <t:aceMenu  menu="${fns:getTopMenu()}"></t:aceMenu>

				<!-- #section:basics/sidebar.layout.minimize -->
				<div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
					<i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
				</div>

				<!-- /section:basics/sidebar.layout.minimize -->
				<script type="text/javascript">
					try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
				</script>
			</div>

			<!-- /section:basics/sidebar -->
			<div class="main-content">
				<div class="main-content-inner">
					<!-- #section:basics/content.breadcrumbs -->
					<div class="breadcrumbs" id="breadcrumbs">
				  <div class="content-tabs">
                <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                         <a href="javascript:;" class="active J_menuTab" data-id="${ctx}/home">首页</a>
                    </div>
                </nav>
                <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
                </button>
                <div class="btn-group roll-nav roll-right">
                    <button class="dropdown J_tabClose"  data-toggle="dropdown">关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="${ctx}/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>
            	</div>
					</div>

			<div class="J_mainContent"  id="content-main" style="height:102%;">
             <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${ctx}/home" frameborder="0" data-id="${ctx}/home" seamless></iframe>
            </div>
            </div>
            
            
            </div>
            

			<a href="#" id="btn-scroll-up" class="pull-left btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
			
            </div>
            
            
            
				

	</body>
	<!-- 语言切换插件，为国际化功能预留插件 -->
	<script type="text/javascript">
	
	$(document).ready(function(){
	
		$("a.lang-select").click(function(){
			$(".lang-selected").find(".lang-flag").attr("src",$(this).find(".lang-flag").attr("src"));
			$(".lang-selected").find(".lang-flag").attr("alt",$(this).find(".lang-flag").attr("alt"));
			$(".lang-selected").find(".lang-id").text($(this).find(".lang-id").text());
			$(".lang-selected").find(".lang-name").text($(this).find(".lang-name").text());
	
		});
		
		$(".upright1").hover(function(){
		    $(".upright1").addClass("open");
		    $(".upright1").find("a").attr("aria-expanded", "true");
		},function(){
			$(".upright1").removeClass("open");
		    $(".upright1").find("a").attr("aria-expanded", "false");
		});
		
		$(".upright2").hover(function(){
		    $(".upright2").addClass("open");
		    $(".upright2").find("a").attr("aria-expanded", "true");
		},function(){
			$(".upright2").removeClass("open");
		    $(".upright2").find("a").attr("aria-expanded", "false");
		});
		
		$(".upright3").hover(function(){
		    $(".upright3").addClass("open");
		    $(".upright3").find("a").attr("aria-expanded", "true");
		},function(){
			$(".upright3").removeClass("open");
		    $(".upright3").find("a").attr("aria-expanded", "false");
		});
	
	
	});

	
</script>
	
<script>
function setTime(){    
	var day="";      
	var month="";      
	var ampm="";      
	var ampmhour="";      
	var myweekday="";      
	var year="";   
	var myHours="";   
	var myMinutes="";   
	var mySeconds="";     
	mydate=new Date();      
	myweekday=mydate.getDay();      
	mymonth=parseInt(mydate.getMonth()+1)<10?"0"+(mydate.getMonth()+1):mydate.getMonth()+1;      
	myday= mydate.getDate();     
	myyear= mydate.getYear();   
	myHours = mydate.getHours();      
	myMinutes = mydate.getMinutes();      
	mySeconds = parseInt(mydate.getSeconds())<10?"0"+mydate.getSeconds():mydate.getSeconds();     
	year=(myyear > 200) ? myyear : 1900 + myyear;      
	if(myweekday == 0)      
		weekday=" 星期日 ";      
	else if(myweekday == 1)      
		weekday=" 星期一 ";      
	else if(myweekday == 2)      
		weekday=" 星期二 ";      
	else if(myweekday == 3)     
			weekday=" 星期三 ";      
	else if(myweekday == 4)      
		weekday=" 星期四 ";      
	else if(myweekday == 5)      
		weekday=" 星期五 ";      
	else if(myweekday == 6)      
		weekday=" 星期六 ";     
	$("#sidebar-shortcuts-large").html(year+"-"+mymonth+"-"+myday+" "+weekday);  
	$("#sidebar-shortcuts-mini").html(year+"-"+mymonth+"-"+myday+" "+weekday);  
	setTimeout("setTime()",1000);  
}  
setTime();
</script>
</script>
</html>