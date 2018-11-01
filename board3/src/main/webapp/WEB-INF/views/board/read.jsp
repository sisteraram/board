<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@include file="../includes/header.jsp"%>

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Forms</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Basic Form Elements
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                
                                        <div class="form-group">
                                            <label>TITLE</label>
                                            <input class="form-control" name="title" readonly="readonly" value="<c:out value="${board.title}"/>">
                                            <p class="help-block"></p>
                                        </div>
                                         <div class="form-group">
                                            <label>WRITER</label>
                                            <input class="form-control" name="writer" readonly="readonly" value="<c:out value="${board.writer}"/>">
                                            <p class="help-block"></p>
                                        </div>
                                       
                                        <div class="form-group">
                                            <label>CONTENT</label>
                                            <textarea class="form-control" rows="3" name="content" readonly="readonly"><c:out value="${board.content}"/></textarea>
                                        </div>
                                    <form action="/board/modify" method="get">
                                   		<input type="hidden" name="bno" value="<c:out value="${board.bno}"/>">
                                   		<input type="hidden" name="page" value="<c:out value="${pageObj.page}"/>">
                                        <button type="submit" class="btn btn-default">Modify</button>
                                    </form>
                                   	<form action="/board/delete" method="post">
                                   		<input type="hidden" name="bno" value="<c:out value="${board.bno}"/>">
                                        <button type="submit" class="btn btn-default">Delete</button>
                                    </form>
                                    <form action="/board/list" method="get">
                                    	<input type="hidden" name="page" value="<c:out value="${pageObj.page}"/>">
                                        <button type="submit" class="btn btn-default">Go to List</button>
                                    </form>
                                </div>
         
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="bigPictureWrapper">
            <div class="bigPicture">
            </div>
            </div>
            
            <style>
.uploadResult{
	width:100%;
	background-color: gray;
}
.uploadResult ul{
	display:flex;
	flex-flow:row;
	justify-content:center;
	align-items:center;
}
.uploadResult ul li {
	list-style:none;
	padding:10px;
}
.uploadResult ul li img{
	width:100px;
}
.uploadResult ul li span{
	color:white;
}

.bigPictureWrapper{
	position:absolute;
	display:none;
	justify-content:center;
	align-items:center;
	top:0%;
	width:100%;
	height:100%;
	background-color:gray;
	z-index:100;
	background:rgba(255,255,255,0.5);
}
.bigPicture{
	position:relative;
	display:flex;
	justify-content:center;
	align-items:center;
}

.bigPicture img{
	width:600px;
}

</style>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Files</div>
			<div class="panel-body">
				<div class="uploadResult">
					<ul>

					</ul>
				</div>
				<!-- /.row (nested) -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	</div>
            
<%@include file="../includes/footer.jsp"%>


<script>
$(documnet).ready(function() {
	(function() {
		var bno = '<c:out value="${board.bno}"/>';
		$.getJSON("/board/getAttachList", {bno:bno}, function(arr) {
			console.log(arr);
			
			var str = "";
			
			$(arr).each(function(t, attach) {
				if (attach.fileType) {
					var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
					
					str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "' ><div>";
				}
			})
		})
	})
})

</script>
</body>

</html>
