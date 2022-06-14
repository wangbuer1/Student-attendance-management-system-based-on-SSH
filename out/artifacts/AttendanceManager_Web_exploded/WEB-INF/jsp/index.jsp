<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>学生考勤管理系统</title>

<link href="ui/themes/default/style.css" rel="stylesheet" type="text/css" />
<link href="ui/themes/css/core.css" rel="stylesheet" type="text/css" />
<link href="ui/uploadify/css/uploadify.css" rel="stylesheet" type="text/css" />
<!--[if IE]>
<link href="ui/themes/css/ieHack.css" rel="stylesheet" type="text/css" />
<![endif]-->

<script src="ui/js/speedup.js" type="text/javascript"></script>
<script src="ui/js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="ui/js/jquery.cookie.js" type="text/javascript"></script>
<script src="ui/js/jquery.validate.js" type="text/javascript"></script>
<script src="ui/js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="ui/xheditor/xheditor-1.1.9-zh-cn.min.js" type="text/javascript"></script>
<script src="ui/uploadify/scripts/swfobject.js" type="text/javascript"></script>
<script src="ui/uploadify/scripts/jquery.uploadify.v2.1.0.js" type="text/javascript"></script>

<script src="ui/js/dwz.min.js" type="text/javascript"></script>
<script src="ui/js/dwz.regional.zh.js" type="text/javascript"></script>

<script type="text/javascript">
$(function(){
	DWZ.init("ui/dwz.frag.xml", {
		loginUrl:"login_dialog.html", loginTitle:"登录",	// 弹出登录对话框
//		loginUrl:"login.html",	// 跳到登录页面
		statusCode:{ok:200, error:300, timeout:301}, //【可选】
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"ui/themes"}); // themeBase 相对于index页面的主题base路径
		}
	});
});
</script>
</head>

<body scroll="no">
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<!-- <a class="logo" href="http://">标志</a> -->
				<div style="font-size: 25px;font-weight: bold;color: #fff;padding-left:10px;height: 40px;;padding-top: 10px;">学生考勤管理系统</div>
				<ul class="nav">
					<li><a href="javascript:void(0);">您好,${username}</a></li>
					<li><a href="userupdate.html?id=${loginuser.id}" rel="info" target="dialog" width="600">个人信息</a></li>
					<li><a href="passwordupdateok.html" rel="pwd" target="dialog" width="600">修改密码</a></li>
					<li><a href="loginout.html">退出</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<!--<li theme="red"><div>红色</div></li>-->
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>

			<!-- navMenu -->
			
		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>
                  
				<div class="accordion" fillSpace="sidebar">
				
				<c:if test="${role=='role0'}">
					<div class="accordionHeader">
						<h2><span>Folder</span>班级管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>应用</a>
						
								<ul>
									<li><a href="banji/banjilist.html" target="navTab" rel="banjiList" >学院管理</a></li>
								</ul>
								<ul>
									<li><a href="subject/subjectlist.html" target="navTab" rel="subjectList" >课程管理</a></li>
								</ul>
							</li>
						</ul>
					</div>
					
					<div class="accordionHeader">
						<h2><span>Folder</span>用户管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>应用</a>
								<ul>
									<li><a href="userlist.html" target="navTab" rel="userList" >用户管理</a></li>
								</ul>
							</li>
						</ul>
					</div>
					
					<div class="accordionHeader">
						<h2><span>Folder</span>课程表管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>应用</a>
								<c:if test="${role!='role4'}">
								<ul>
									<li><a href="kecheng/kechenglist.html" target="navTab" rel="kechengList" >课程表管理</a></li>
								</ul>
								</c:if>
								<c:if test="${role=='role4'}">
								<ul>
									<li><a href="kecheng/kechenglist2.html" target="navTab" rel="kechengList2" >课程表</a></li>
								</ul>
								</c:if>
								
							</li>
						</ul>
					</div>
					
					
					</c:if>
				
				
				 <c:if test="${role=='role1'}">
				 
				 <div class="accordionHeader">
						<h2><span>Folder</span>课程表查询</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>应用</a>
								
								<ul>
									<li><a href="kecheng/kechenglist2.html" target="navTab" rel="kechengList2" >课程表查询</a></li>
								</ul>
							
								
							</li>
						</ul>
					</div>
				 
					
					<div class="accordionHeader">
						<h2><span>Folder</span>请假管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>应用</a>
						
								<ul>
									<li><a href="qingjiadan/qingjiadanlist.html" target="navTab" rel="qingjiadanList" >学生请假管理</a></li>
								</ul>
							</li>
						</ul>
					</div>
					
					
					
					<div class="accordionHeader">
						<h2><span>Folder</span>考勤情况管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>应用</a>
								<ul>
									<li><a href="kaoqinlog/kaoqinloglist.html" target="navTab" rel="kaoqinlogList" >考勤情况记录查询</a></li>
								</ul>
								
								<ul>
									<li><a href="kaoqinlog/kaoqinloglist2.html" target="navTab" rel="kaoqinlogList2" >考勤情况管理</a></li>
								</ul>
							</li>
						</ul>
					</div>			
					
					
				</c:if>
					
					
					
				<c:if test="${role=='role2'}">
				 
				 <div class="accordionHeader">
						<h2><span>Folder</span>课程表查询</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>应用</a>
								
								<ul>
									<li><a href="kecheng/kechenglist2.html" target="navTab" rel="kechengList2" >课程表查询</a></li>
								</ul>
							
								
							</li>
						</ul>
					</div>
				 
					
					<div class="accordionHeader">
						<h2><span>Folder</span>请假管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>应用</a>
						
								<ul>
									<li><a href="qingjiadan/qingjiadanlist.html" target="navTab" rel="qingjiadanList" >学生请假管理</a></li>
								</ul>
							</li>
						</ul>
					</div>
					
					
					
					<div class="accordionHeader">
						<h2><span>Folder</span>考勤情况管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>应用</a>
								<ul>
									<li><a href="kaoqinlog/kaoqinloglist.html" target="navTab" rel="kaoqinlogList" >考勤情况记录查询</a></li>
								</ul>
								<ul>
									<li><a href="kaoqinlog/kaoqinloglist2.html" target="navTab" rel="kaoqinlogList2" >考勤情况管理</a></li>
								</ul>
							</li>
						</ul>
					</div>			
					
					
				</c:if>	
					
				
					<c:if test="${role=='role3'}">
				 
				 <div class="accordionHeader">
						<h2><span>Folder</span>课程表查询</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>应用</a>
								
								<ul>
									<li><a href="kecheng/kechenglist2.html" target="navTab" rel="kechengList2" >课程表查询</a></li>
								</ul>
							
								
							</li>
						</ul>
					</div>
				 
					
					<div class="accordionHeader">
						<h2><span>Folder</span>请假管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>应用</a>
						
								<ul>
									<li><a href="qingjiadan/qingjiadanlist.html" target="navTab" rel="qingjiadanList" >学生请假管理</a></li>
								</ul>
							</li>
						</ul>
					</div>
					
					
					
					<div class="accordionHeader">
						<h2><span>Folder</span>考勤情况管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>应用</a>
								<ul>
									<li><a href="kaoqinlog/kaoqinloglist.html" target="navTab" rel="kaoqinlogList" >考勤情况记录查询</a></li>
								</ul>
								<!--  
								<ul>
									<li><a href="kaoqinlog/kaoqinloglist2.html" target="navTab" rel="kaoqinlogList2" >考勤情况管理</a></li>
								</ul>-->
							</li>
						</ul>
					</div>			
					
					
				</c:if>	
					
					
				<c:if test="${role=='role4'}">
				 
				 <div class="accordionHeader">
						<h2><span>Folder</span>课程表查询</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>应用</a>
								
								<ul>
									<li><a href="kecheng/kechenglist2.html" target="navTab" rel="kechengList2" >课程表查询</a></li>
								</ul>
							
								
							</li>
						</ul>
					</div>
				 
					
					<div class="accordionHeader">
						<h2><span>Folder</span>请假管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>应用</a>
						
								<ul>
									<li><a href="qingjiadan/qingjiadanlist.html" target="navTab" rel="qingjiadanList" >学生请假管理</a></li>
								</ul>
							</li>
						</ul>
					</div>
					
					
					
					<div class="accordionHeader">
						<h2><span>Folder</span>考勤情况管理</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
						<li><a>应用</a>
								<ul>
									<li><a href="kaoqinlog/kaoqinloglist.html" target="navTab" rel="kaoqinlogList" >考勤情况记录查询</a></li>
								</ul>
								<!-- 
								<ul>
									<li><a href="kaoqinlog/kaoqinloglist2.html" target="navTab" rel="kaoqinlogList2" >考勤情况管理</a></li>
								</ul> -->
							</li>
						</ul>
					</div>			
					
					
				</c:if>		
					
					
					
					
					
				</div>
			</div>
		</div>
		<div id="container">
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon">我的主页</span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
					<div class="page unitBox">
						<div class="accountInfo">
							<p><h1 style="font-size: 22px;text-align: center;">您好，${username}。欢迎使用学生考勤管理系统！</h1></p>
						</div>
						
						<div class="pageFormContent" layoutH="80">
							<c:if test="${role=='role4'}">
						    <p><h1 style="font-size: 22px;">${kaoqinlogtishi}</h1></p>
						</c:if>
						</div>
					</div>
					
				</div>
			</div>
		</div>

	</div>

	

</body>
</html>