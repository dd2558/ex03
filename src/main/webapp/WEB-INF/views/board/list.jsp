<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<%@include file ="../includes/header.jsp" %> <!-- 잘라간 부분 연결 -->

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Board List Page</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board List Page
				<button id="regBtn" type="button" class="btn btn-xs pull-right">Register New Board</button>
				</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table width="100%"
						class="table table-striped table-bordered table-hover"
						id="dataTables-example">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자(s)</th>
								<th>작성일</th>
								<th>수정일</th>
							</tr>
						</thead>
						<c:forEach items="${list }" var="board">
							<tr>
								<td><c:out value="${board.bno }" /></td>
								<td><a class="move" href="/board/get?bno=${board.bno}">
								<c:out value="${board.title }" /></a></td>
								<td><c:out value="${board.writer }" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.regdate }" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${board.updateDate }" /></td>
							</tr>
						</c:forEach>
					</table>
				<div class="pull-right">
					<ul class="pagination">
						<c:if test="${pageMaker.prev }">
							<li class="pagination_button previous">
								<a href="${pageMaker.startPage -1 }">Previous</a>
							</li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage }"
						end = "${pageMaker.endPage }">
						<li class="paginate_button ${pageMaker.cri.pageNum==num? "active":""}">
							<a href="${num }">${num }</a></li>
						</c:forEach>
						
						<c:if test="${pageMaker.next }">
							<li class="pagination_button next">
								<a href="${pageMaker.endPage +1 }">Next</a>
							</li>
						</c:if>
					</ul>
				</div>					
				<form id="actionForm" action="/board/list" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
				</form>	
					<!-- 모달시작 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save</button>
							</div>
						</div>
						<!-- <!— /.modal-content —> -->
					</div>
					<!-- <!— /.modal-dialog —> -->
				</div>

					<!-- 모달종료 -->
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-6 -->
	</div>
	<!-- /.row -->
</div>
<!-- /#wrapper -->
<script>
         		$(document).ready(function(){ // jquery 기본형식
         			let result = '<c:out value = "${result}"/>';
         			
         			checkModal(result);
         			
         			history.replaceState({},null,null); // history 삭제
         			
         			function checkModal(result){
         				if(result==='' || history.state){
         					return;	
         				}
         				if(parseInt(result)>0){
         					$(".modal-body").html("게시글 " + parseInt(result) + 
         						" 번이 등록되었습니다.");
         				}
         				$("#myModal").modal("show");
         			}
					$("#regBtn").on("click",function(){
						self.location ="/board/register";
					});					   
					let actionForm = $("#actionForm");
					$(".paginate_button a").on("click",function(e){
						e.preventDefault();
						console.log('click');
						actionForm.find("input[name='pageNum']").val($(this).attr("href"));
						actionForm.submit();
					});
					$(".move").on("click", function(e) {
					    e.preventDefault();
					    var bnoValue = $(this).attr("href").split("=")[1]; // href 속성에서 bno 값 추출
					    actionForm.append("<input type='hidden' name='bno' value='" + bnoValue + "'>");
					    actionForm.attr("action", "/board/get")
					    actionForm.submit();
					});
         			
         		});
         </script>



<%@include file ="../includes/footer.jsp" %> <!-- 잘라간 부분 연결 -->
