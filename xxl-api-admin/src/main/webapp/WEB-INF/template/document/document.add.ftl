<!DOCTYPE html>
<html>
<head>
  	<title>API管理平台</title>
  	<#import "/common/common.macro.ftl" as netCommon>
    <link rel="stylesheet" href="${request.contextPath}/static/adminlte/plugins/select2/select2.min.css">
    <link rel="stylesheet" href="${request.contextPath}/static/adminlte/plugins/iCheck/square/_all.css">
	<@netCommon.commonStyle />

</head>
<body class="hold-transition skin-blue sidebar-mini <#if cookieMap?exists && "off" == cookieMap["adminlte_settings"].value >sidebar-collapse</#if>">
<div class="wrapper">
	<!-- header -->
	<@netCommon.commonHeader />
	<!-- left -->
	<@netCommon.commonLeft "projectList" />

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Content Header (Page header) -->
		<section class="content-header">
			<h1>新增接口<small>API管理平台</small></h1>
		</section>

        <section class="content">
            <form class="form-horizontal">
                <input type="hidden" name="projectId" value="${productId}" >

                <#--基础信息-->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">基础信息</h3>
                        <div class="box-tools pull-right">
                            <button class="btn btn-info btn-xs" type="button" onclick="javascript:window.open('${request.contextPath}/group?productId=${productId}')" >返回接口列表</button>
                        </div>
                    </div>

                    <div class="box-body">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">接口分组</label>
                            <div class="col-sm-10">
                                <select class="form-control select2" style="width: 100%;" name="groupId">
                                    <option value="0">默认分组</option>
                                    <#if groupList?exists && groupList?size gt 0>
                                        <#list groupList as group>
                                            <option value="${group.id}">${group.name}</option>
                                        </#list>
                                    </#if>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">接口状态</label>
                            <div class="col-sm-10">
                                <input type="radio" class="iCheck" name="status" value="0" checked >启用  &nbsp;&nbsp;
                                <input type="radio" class="iCheck" name="status" value="1" >维护  &nbsp;&nbsp;
                                <input type="radio" class="iCheck" name="status" value="2" >废弃
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">接口名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="name" placeholder="请输入接口名称" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">接口URL</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" name="requestUrl" placeholder="请输入接口URL（相对地址）" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">请求方法</label>
                            <div class="col-sm-10">
                                <select class="form-control select2" style="width: 100%;" name="requestMethod">
                                    <#list RequestMethodEnum as item>
                                        <option value="item">${item}</option>
                                    </#list>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>

                <#--请求头部-->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">请求头部</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" id="requestHeaders_add" ><i class="fa fa-plus"></i></button>
                        </div>
                    </div>

                    <div id="requestHeaders_example" style="display: none;" >
                        <div class="form-group item" >
                            <label class="col-sm-1 control-label">头部标签</label>
                            <div class="col-sm-4 item">
                                <select class="form-control select2_tag_new key" style="width: 100%;">
                                    <option value=""></option>
                                <#list requestHeadersList as item>
                                    <option value="${item}">${item}</option>
                                </#list>
                                </select>
                            </div>
                            <label class="col-sm-1 control-label">头部内容</label>
                            <div class="col-sm-5 item">
                                <input type="text" class="form-control value">
                            </div>
                            <button type="button" class="col-sm-1 btn btn-box-tool delete" ><i class="fa fa-fw fa-close"></i></button>
                        </div>
                    </div>

                    <div class="box-body" id="requestHeaders_parent" >
                    </div>
                </div>


            </form>

        </section>

	</div>

	<!-- footer -->
	<@netCommon.commonFooter />
</div>

<@netCommon.commonScript />
<script src="${request.contextPath}/static/adminlte/plugins/select2/select2.min.js"></script>
<script src="${request.contextPath}/static/adminlte/plugins/iCheck/icheck.min.js"></script>
<script src="${request.contextPath}/static/plugins/jquery/jquery.validate.min.js"></script>
<script src="${request.contextPath}/static/js/document.add.1.js"></script>
</body>
</html>