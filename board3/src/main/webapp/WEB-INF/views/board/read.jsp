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
<%@include file="../includes/footer.jsp"%>

</body>

</html>
