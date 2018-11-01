<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">LIST</h1>
		<form action="/board/register" method="get">
		<h1><button class="tn btn-primary">Register</button></h1>
		</form>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
			<select name='display' id='display'>
				<option value="" >--</option>
				<option value=10 <c:out value="${pageObj.display == 10?'selected':''}"/>>10</option>
				<option value=20 <c:out value="${pageObj.display == 20?'selected':''}"/>>20</option>
				<option value=50 <c:out value="${pageObj.display == 50?'selected':''}"/>>50</option>
				<option value=100 <c:out value="${pageObj.display == 100?'selected':''}"/>>100</option>
			</select>
			Board List</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="table-responsive">
				
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>BNO</th>
								<th>TITLE</th>
								<th>WRITER</th>
								<th>REGDATE</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="board">
								<tr>
									<td><c:out value="${board.bno}" /></td>
									<td><a href="${board.bno}" class="board"><c:out
												value="${board.title}" /></a></td>
									<td><c:out value="${board.writer}" /></td>
									<td><fmt:formatDate value="${board.regdate}"
											pattern="yyyy-MM-dd HH:dd" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<form id="searchForm" action="/board/list" method="get">
					<select name="type">
					<option value='' <c:out value="${pageObj.type == null?'selected':''}"/>>--</option>
					<option value='t' <c:out value="${pageObj.type == 't'?'selected':''}"/>>제목</option>
					<option value='w' <c:out value="${pageObj.type == 'w'?'selected':''}"/>>작성자</option>
					<option value='c' <c:out value="${pageObj.type == 'c'?'selected':''}"/>>내용</option>
					<option value='tc' <c:out value="${pageObj.type == 'tc'?'selected':''}"/>>제목+내용</option>
					<option value='twc' <c:out value="${pageObj.type == 'twc'?'selected':''}"/>>모두</option>
					</select>
					<input type="text" name="keyword" value="${pageObj.keyword}">
					<input type="hidden" name = "page" value = "${pageObj.page}">
					<input type="hidden" name = "display" value = "${pageObj.display}">
					<button id="searchBtn" class="btn btn-primary">검색</button>
					</form>
				</div>
				<!-- /.table-responsive -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	
	<form id="actionForm">
		<input type="hidden" name="page" id="page" value="${pageObj.page}">
		<input type='hidden' name='display' value="${pageObj.display}">
		<input type='hidden' name='type' value="${pageObj.type}">
		<input type='hidden' name='keyword' value="${pageObj.keyword}">
	</form>
		<div class="col-sm-12">
		<div class="dataTables_paginate paging_simple_numbers"
			id="dataTables-example_paginate">
			<ul class="pagination">
			<c:if test="${pageObj.prev}">
				<li class="paginate_button previous"
					aria-controls="dataTables-example" tabindex="0"
					id="dataTables-example_previous"><a href="${pageObj.start-1}">Previous</a></li>
			</c:if>
			
			<c:forEach begin="${pageObj.start}" end="${pageObj.end}" var="num">
				<li class="paginate_button " data-page="${num}"
					aria-controls="dataTables-example" tabindex="0"><a href="${num}"><c:out value="${num}"/></a></li>
			</c:forEach>
			
			<c:if test="${pageObj.next}">
				<li class="paginate_button next" aria-controls="dataTables-example"
					tabindex="0" id="dataTables-example_next"><a href="${pageObj.end+1}">Next</a></li>
			</c:if>
			</ul>
		</div>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal</h4>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
	
<%@include file="../includes/footer.jsp"%>



<script>
	$(document).ready(function() {
		
		var searchForm = $("#searchForm")
		var actionForm = $("#actionForm");
		var pagination = $(".pagination li a");
		var page = ${pageObj.page};
		var msg = $("#myModal");
		var result = "<c:out value="${result}"/>";
		var display = $("#display");
		var searchBtn = $("#searchBtn");
		
		$("#searchBtn").on("click", function(e) {
			
			if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 선택하세요");
				return false;
			}
			
			searchForm.find("input[name='page']").val(1);
			e.preventDefault();
			
			searchForm.submit();
			
		})
		
		$(".board").on("click",function(e){
			e.preventDefault();
			var bno = $(this).attr("href");
			actionForm.append("<input type='hidden' name='bno' value='"+bno+"'>");			
			actionForm.attr("action","/board/read").attr("method", "get").submit();
			
		});
		
		checkModal(result);
		
		history.replaceState({}, null, null);
		
		pagination.on("click",function(e){
			e.preventDefault();
			
			var num = $(this).attr("href");
			$("#page").val(num);
			actionForm.attr("action","/board/list").attr("method", "get").submit();
					
		});
		
		$('.pagination li[data-page='+page+']').addClass("active");
		
		function checkModal(result){
			if(result === '' || history.state){
				return;
			}
			if(result === 'SUCCESS'){
				msg.modal("show");
				$(".modal-body").html("작업성공");
			}
		}
		
		display.on("change", function(e){
			
			var displayValue = display[0].value;
			if (displayValue == null) {
				displayValue = 10;
			}
			
			actionForm.attr("action","/board/list");
			actionForm.find("input[name='display']").val(displayValue);
			$("#page").val(1);
			actionForm.submit();
			
			
		});
	});
</script>

</body>

</html>