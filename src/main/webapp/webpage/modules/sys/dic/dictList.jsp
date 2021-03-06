<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>字典管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/webpage/include/treetable.jsp" %>
	<script type="text/javascript">
	
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
	    	return false;
	    }
		
	</script>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
<div class="ibox">
<div class="ibox-title">
		<h5>字典列表 </h5>
		<div class="ibox-tools">
		</div>
	</div>
    
    <div class="ibox-content">
	<sys:message content="${message}"/>
	
	<!-- 查询条件 -->
	<div class="row">
	<div class="col-sm-12">
	<form:form id="searchForm" modelAttribute="dict" action="${ctx}/sys/dict/" method="post" class="form-inline">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/><!-- 支持排序 -->
		<div class="form-group">
			<span>类型：</span>
				<form:select id="type" path="type" class="form-control m-b"><form:option value="" label=""/><form:options items="${typeList}" htmlEscape="false"/></form:select>
			<span>描述 ：</span>
				<form:input path="description" htmlEscape="false" maxlength="50" class="form-control"/>
		 </div>	
	</form:form>
	<br/>
	</div>
	</div>
	
		<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
			<shiro:hasPermission name="sys:dict:add">
				<c:choose>
					<c:when test="${flag == 1}">
							<table:addRow url="${ctx}/sys/dict/form?type=${dict.type}&sort=${dict.sort+10}&description=${dict.description}" title="键值"></table:addRow><!-- 增加按钮 -->
					</c:when>
					<c:otherwise>
						<table:addRow url="${ctx}/sys/dict/form" title="字典"></table:addRow><!-- 增加按钮 -->
					</c:otherwise>
				</c:choose>
			</shiro:hasPermission>
		<%--	 <shiro:hasPermission name="sys:dict:edit">
			    <table:editRow url="${ctx}/sys/dict/form" id="contentTable"  title="字典"></table:editRow><!-- 编辑按钮 -->
			</shiro:hasPermission>--%>
			<shiro:hasPermission name="sys:dict:del">
				<table:delRow url="${ctx}/sys/dict/deleteAll" id="contentTable"></table:delRow><!-- 删除按钮 -->
			</shiro:hasPermission>
	       <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>
		
			</div>
		<div class="pull-right">
			<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i> 查询</button>
			<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
		</div>
	</div>
	</div>
	
	<table id="contentTable" class="table table-striped table-bordered  table-hover table-condensed  dataTables-example dataTable">
		<thead>
			<tr>
				<th width="1px" align="center">
					<input type="checkbox" class="i-checks">
				</th>
				<c:if test="${flag=='1'}">
				<th  >键值</th>
				<th >标签</th>
				</c:if>
				<th  >类型</th>
				<th  >描述</th>
				<th  >排序</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="dict" varStatus="status">
			<tr>
				<td align="center">
					<c:choose>
						<c:when test="${flag == 1}">
							<input type="checkbox" id="${dict.id}" class="i-checks">
						</c:when>
						<c:otherwise>
							<input type="checkbox" dictype="${dict.type}" class="i-checks">
						</c:otherwise>
					</c:choose>

				</td>
				<c:if test="${flag=='1'}">
				<td>${dict.value}</td>
				<td>
   					<a  href="#" onclick="openDialogView('查看字典', '${ctx}/sys/dict/form?id=${dict.id}','800px', '500px')">${dict.label}</a>
				</td>
				</c:if>
				<td><a href="javascript:" onclick="$('#type').val('${dict.type}');$('#searchForm').submit();return false;">${dict.type}</a></td>
				<td>${dict.description}</td>
				<td>${dict.sort}<c:if test="${flag=='1'}">...</c:if></td>
				<td>
				<c:if test="${flag=='1'}">
					<shiro:hasPermission name="sys:dict:view">
						<a href="#" onclick="openDialogView('查看字典', '${ctx}/sys/dict/form?id=${dict.id}','800px', '500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="sys:dict:edit">
    					<a href="#" onclick="openDialog('修改字典', '${ctx}/sys/dict/form?id=${dict.id}','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>
    				</shiro:hasPermission>
    			</c:if>
    				<shiro:hasPermission name="sys:dict:del">
						<a href="${ctx}/sys/dict/delete?id=${dict.id}&type=${dict.type}&parentId=${dict.parentId}" onclick="return confirmx('确认要删除该字典吗？', this.href)"   class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
					</shiro:hasPermission>
					<c:if test="${flag != 1}">
						<shiro:hasPermission name="sys:dict:add">
							<a href="#" onclick="openDialog('添加键值', '${ctx}/sys/dict/form?type=${dict.type}&sort=${dict.sort+10}&description=${dict.description}','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 添加键值</a>
						</shiro:hasPermission>
					</c:if>

				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<!-- 分页代码 -->
	<table:page page="${page}"></table:page>
	<br/>
	<br/>
	</div>
	</div>
</div>
</body>
</html>