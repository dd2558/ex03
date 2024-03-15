<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board Modify Page</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board Modify Page</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<form role="form" action="/board/modify" method="post">
						<div class="form-group">
							<label>Bno</label><input class="form-control" name="bno"
							value = '<c:out value="${board.bno }"/>' readonly="readonly"> 
						</div>

						<div class="form-group">
							<label>Title</label><input class="form-control" name="title"
							value = '<c:out value="${board.title }"/>'> 
						</div>

						<div class="form-group">
							<label>Text area</label>
							<textarea rows="3" class="form-control" name='content' ><c:out value ="${board.content }"/></textarea>
							
						</div>

						<div class="form-group">
							<label>Writer</label><input class="form-control" name="writer"
							value = '<c:out value ="${board.writer }" />' readonly="readonly">
							
						</div>

						<div class="form-group">
							<label>RegDate</label><input class="form-control" name="regDate"
							value = '<fmt:formatDate pattern = "yyyy-MM-dd" value="${board.regdate }"/>' readonly="readonly">
						</div>

						<div class="form-group">
							<label>Update Date</label><input class="form-control" name="updateDate"
							value = '<fmt:formatDate pattern = "yyyy-MM-dd" value="${board.updateDate }"/>' readonly="readonly">
						</div>

						<button type="submit" data-oper="modify" class="btn btn-default">
						Modify</button>
						<button type="submit" data-oper="remove" class="btn btn-danger">Remove</button>
						<button type="submit" data-oper="list" class="btn btn-info">List</button>

					</form>
				</div>
				<!-- /.table-responsive -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
 	<!-- /.col-lg-6-->
</div>

<script>
	window.onpageshow = function(event) { //글쓰고 뒤로가면 새로고침
		//back 이벤트 일 경우
		if (event.persisted) {
			location.reload(true);
		}

	}
	
	$(document).ready(function(){
		let formObj = $("form");
		
		$('button').on("click",function(e){
			e.preventDefault();
			
			let operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation==="remove"){
				formObj.attr("action", "/board/remove");
			}else if(operation==="list"){
				//list로 반환
				formObj.attr("action","/board/list").attr("method","get");
				formObj.empty();
			}
			formObj.submit();
		});
	});
	
</script>

<%@include file="../includes/footer.jsp"%>