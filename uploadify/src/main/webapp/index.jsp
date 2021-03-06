<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>Upload</title>
 
<!--装载文件-->
<link href="css/uploadify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="uploadify/jquery-1.11.1.js"></script>
<script type="text/javascript" src="uploadify/jquery.uploadify.min.js"></script>

<!--ready事件-->
<script type="text/javascript">
    $(document).ready(function() {
        $("#uploadify").uploadify({
            'uploader' : 'servlet/Upload',
            'swf' : 'uploadify/uploadify.swf',
            'cancelImg' : 'img/uploadify-cancel.png',
//             'folder' : 'uploads', //官方文档已无此参数,您想将文件保存到的路径
            'queueID' : 'fileQueue', //与下面的id对应
            'queueSizeLimit' : 5,  //当允许多文件生成时，设置选择文件的个数（就是能选择到页面中就绪的文件个数），默认值：999 。
//             'fileDesc' : 'rar文件或zip文件',  //官方文档已无此参数，这个属性值必须设置fileExt属性后才有效，用来设置选择文件对话框中的提示文本。
//             'fileExt' : '*.rar;*.zip', //官方文档已无此参数，控制可上传文件的扩展名，启用本项时需同时声明fileDesc,虽然设置的这两个但是好像都可以选
            'auto' : false, //设置为true当选择文件后就直接上传了，为false需要点击上传按钮才上传 。
            'multi' : true, //设置为true时可以上传多个文件。
//             'simUploadLimit' : 2, //官方文档已无此参数，多文件上传时，同时上传文件数目限制。默认1一次可传几个文件。
            'buttonText' : '选择文件', //默认按钮的名字。默认BROWER
//             'uploadLimit' : 2,//上传到服务器上的总文件数量限制
           	'onDialogOpen' : function() {//当选择文件对话框打开时触发
//            		alert( 'Open!');
           	},
           	'onSelect' : function(file) {//当每个文件添加至队列后触发
//            		alert( 'id: ' + file.id
//            				+ ' - 索引: ' + file.index
//            				+ ' - 文件名: ' + file.name
//            				+ ' - 文件大小: ' + file.size
//            				+ ' - 类型: ' + file.type
//            				+ ' - 创建日期: ' + file.creationdate
//            				+ ' - 修改日期: ' + file.modificationdate
//            				+ ' - 文件状态: ' + file.filestatus);
           	},
           	'onSelectError' : function(file,errorCode,errorMsg) {//当文件选定发生错误时触发
	           		switch(errorCode) {
	                case -100:
	                    alert("上传的文件数量已经超出系统限制的 "+$('#uploadFile').uploadify('settings','queueSizeLimit')+"个文件！");
	                    break;
	                case -110:
	                    alert("文件 ["+file.name+"] 大小超出系统限制的 "+$('#uploadFile').uploadify('settings','fileSizeLimit')+"大小！");
	                    break;
	                case -120:
	                    alert("文件 ["+file.name+"] 大小异常！");
	                    break;
	                case -130:
	                    alert("文件 ["+file.name+"] 类型不正确！");
	                    break;
	                }
//            		alert( 'id: ' + file.id
//            			+ ' - 索引: ' + file.index
//            			+ ' - 文件名: ' + file.name
//          			+ ' - 文件大小: ' + file.size
//            			+ ' - 类型: ' + file.type
//            			+ ' - 创建日期: ' + file.creationdate
//            			+ ' - 修改日期: ' + file.modificationdate
//            			+ ' - 文件状态: ' + file.filestatus
//            			+ ' - 错误代码: ' + errorCode
//            			+ ' - 错误信息: ' + errorMsg);
           	},
           	'onDialogClose' : function(swfuploadifyQueue) {//当文件选择对话框关闭时触发
				if( swfuploadifyQueue.filesErrored > 0 ){
//           			alert( '添加至队列时有'
// 						+swfuploadifyQueue.filesErrored
// 	           			+'个文件发生错误n'
// 	           			+'错误信息:'
// 	           			+swfuploadifyQueue.errorMsg
// 	           			+'n选定的文件数:'
// 	           			+swfuploadifyQueue.filesSelected
// 	           			+'n成功添加至队列的文件数:'
// 	           			+swfuploadifyQueue.filesQueued
// 	           			+'n队列中的总文件数量:'
// 	       				+swfuploadifyQueue.queueLength);
           		}
           	},
           	'onQueueComplete' : function(stats) {//当队列中的所有文件全部完成上传时触发
//            		alert( '成功上传的文件数: ' + stats.successful_uploads
//            			+ ' - 上传出错的文件数: ' + stats.upload_errors
//            			+ ' - 取消上传的文件数: ' + stats.upload_cancelled
//            			+ ' - 出错的文件数' + stats.queue_errors);
           	},
           	'onUploadComplete' : function(file,swfuploadifyQueue) {//队列中的每个文件上传完成时触发一次
//            		alert( 'id: ' + file.id
//            			+ ' - 索引: ' + file.index
//            			+ ' - 文件名: ' + file.name
//            			+ ' - 文件大小: ' + file.size
//            			+ ' - 类型: ' + file.type
//            			+ ' - 创建日期: ' + file.creationdate
//            			+ ' - 修改日期: ' + file.modificationdate
//            			+ ' - 文件状态: ' + file.filestatus);
           	},
           	'onUploadError' : function(file,errorCode,errorMsg,errorString,swfuploadifyQueue) {//上传文件出错是触发（每个出错文件触发一次）
//            		alert( 'id: ' + file.id
//            			+ ' - 索引: ' + file.index
//            			+ ' - 文件名: ' + file.name
//            			+ ' - 文件大小: ' + file.size
//            			+ ' - 类型: ' + file.type
//            			+ ' - 创建日期: ' + file.creationdate
//            			+ ' - 修改日期: ' + file.modificationdate
//            			+ ' - 文件状态: ' + file.filestatus
//            			+ ' - 错误代码: ' + errorCode
//            			+ ' - 错误描述: ' + errorMsg
//            			+ ' - 简要错误描述: ' + errorString);
           	},
           	'onUploadProgress' : function(file,fileBytesLoaded,fileTotalBytes,queueBytesLoaded,swfuploadifyQueueUploadSize) {//上传进度发生变更时触发
//            		alert( 'id: ' + file.id
//            			+ ' - 索引: ' + file.index
//            			+ ' - 文件名: ' + file.name
//            			+ ' - 文件大小: ' + file.size
//            			+ ' - 类型: ' + file.type
//            			+ ' - 创建日期: ' + file.creationdate
//            			+ ' - 修改日期: ' + file.modificationdate
//            			+ ' - 文件状态: ' + file.filestatus
//            			+ ' - 当前文件已上传: ' + fileBytesLoaded
//            			+ ' - 当前文件大小: ' + fileTotalBytes
//            			+ ' - 队列已上传: ' + queueBytesLoaded
//            			+ ' - 队列大小: ' + swfuploadifyQueueUploadSize);
           	},
           	'onUploadStart': function(file) {//上传开始时触发（每个文件触发一次）
//            		alert( 'id: ' + file.id
//            			+ ' - 索引: ' + file.index
//            			+ ' - 文件名: ' + file.name
//            			+ ' - 文件大小: ' + file.size
//            			+ ' - 类型: ' + file.type
//            			+ ' - 创建日期: ' + file.creationdate
//            			+ ' - 修改日期: ' + file.modificationdate
//            			+ ' - 文件状态: ' + file.filestatus );
           	},
           	'onUploadSuccess' : function(file,data,response) {//上传完成时触发（每个文件触发一次）
//            		alert( 'id: ' + file.id
//            			+ ' - 索引: ' + file.index
//            			+ ' - 文件名: ' + file.name
//            			+ ' - 文件大小: ' + file.size
//            			+ ' - 类型: ' + file.type
//            			+ ' - 创建日期: ' + file.creationdate
//            			+ ' - 修改日期: ' + file.modificationdate
//            			+ ' - 文件状态: ' + file.filestatus
//            			+ ' - 服务器端消息: ' + data
//            			+ ' - 是否上传成功: ' + response);
           	}
        });
    });
</script>
</head>
 
<body>
    <div id="fileQueue"></div>
    <input type="file" name="uploadify" id="uploadify" />
    <p>
    	<!-- 上传第一个未上传的文件 -->
      	<a href="javascript:$('#uploadify').uploadify('upload')">上传</a>
      	<!-- 取消第一个未取消的文件 -->
        <a href="javascript:$('#uploadify').uploadify('cancel')">取消上传</a>
        
        <a href="javascript:$('#uploadify').uploadify('upload','*')">开始上传所有文件</a>&nbsp;
        <a href="javascript:$('#uploadify').uploadify('cancel','*')">取消所有上传</a>
    </p>
</body>
</html>