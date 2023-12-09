<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="category.jsp"%>
<!DOCTYPE html>
<!-- 책리스트에서 책 한권을 눌렀을 때 볼 수 있는 책 상세정보 -->
<html>
<head>
<meta charset="UTF-8">

<title>책 상세정보</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
input[readonly] {
	border: none; /* 테두리 제거 */
	outline: none; /* 포커스 표시 제거 */
	background-color: transparent; /* 배경 색상 투명으로 설정 */
}

/* 테두리를 표시한 일반 input 요소에 대한 스타일 */
input {
	border: 1px solid #ccc; /* 기본 테두리 스타일 지정 */
	padding: 5px; /* 내부 여백 설정 (선택 사항) */
}

textarea[readonly] {
	border: none; /* 테두리 제거 */
	outline: none; /* 포커스 표시 제거 */
	background-color: transparent; /* 배경 색상 투명으로 설정 */
}

textarea {
	border: 1px solid #ccc; /* 기본 테두리 스타일 지정 */
	padding: 5px; /* 내부 여백 설정 (선택 사항) */
}
</style>

<script>
var bookId = "" 
var memId = ""	
//리뷰 조회 ajax
function loadComments() {
	 bookId = "${list[0].bookId}";
	 //memId = "$("#memId").val()";
	 
    $.ajax("getBookReview",{
        type: "GET",
        data: { bookId: bookId },/* { memId: memId}, */
        dataType: "json",
        success: function(data) {
        	
			//alert("Ajax 처리 성공 - 응답받은 데이터 : " + data);
			let htmlTag = "";
			let alist = data.list; 
			$.each(alist, function(index, category){
				//console.log("this.name : " + this.name);
				//console.log("member.name : " + member.name);
				memId = this.memId;
				htmlTag += "<tr>";
				htmlTag += "<td><input type='text' class='memId' value='작성자 id : " + this.memId + "' readonly></td>";
				 htmlTag += "<td><input type='radio' class='Grade' name='grade' value='1' id='grade1' hidden>";
		            htmlTag += "<label for='grade1' hidden>1점</label>";
		            htmlTag += "<input type='radio' class='Grade' name='grade' value='2' id='grade2' hidden>";
		            htmlTag += "<label for='grade2'hidden>2점</label>";
		            htmlTag += "<input type='radio' class='Grade' name='grade' value='3' id='grade3' hidden>";
		            htmlTag += "<label for='grade3' hidden>3점</label>";
		            htmlTag += "<input type='radio' class='Grade' name='grade' value='4' id='grade4' hidden>";
		            htmlTag += "<label for='grade4' hidden>4점</label>";
		            htmlTag += "<input type='radio' class='Grade' name='grade' value='5' id='grade5' hidden>";
		            htmlTag += "<label for='grade5' hidden>5점</label>";
			//	htmlTag += "</tr>";
			//	htmlTag += "<tr>";
				htmlTag += "<td><input type='text' class='Grade2' value='평점 : " + this.Grade + "점' readonly></td>";
				htmlTag += "<td><input type='text' class='reviewId' value='" + this.reviewId +  "' hidden></td>";
			//	htmlTag += "</tr>";
				
				 
	      
	          //  htmlTag += "<tr>";
	          htmlTag += "<td><textarea class='reviewContent' readonly>" + this.reviewContent + "</textarea></td>";
				//htmlTag += "</tr>";
				//htmlTag += "<tr>";
				htmlTag += "<td><input type='text' class='RegDate' value='" + this.RegDate + "' readonly></td>";
			//	htmlTag += "</tr>";
				htmlTag += "<td><button id='reviewBtn' onclick='deleteReview(" + this.reviewId + ")'>삭제</button></td>";
				// 수정 버튼 추가 및 클릭 시 리뷰 수정 폼 열기
				htmlTag += "<td><button id='reviewBtn' class='editButton'>수정</button></td>";
				htmlTag += "</tr>";
			    if (index < alist.length - 1) {
			        htmlTag += "<tr><td colspan='8'><hr></td></tr>";
			    }
			
			});
			 $("#commentBody").html(htmlTag); // 댓글을 테이블에 추가
			 $(".editButton").click(function() {
					let $row = $(this).closest("tr");
					
					
					// 라디오 버튼 활성화 (수정 버튼을 눌렀을 때만 활성화)
				    $row.find("input[type='radio']").prop("hidden", false);
				    $row.find("label").prop("hidden", false);
				    // readonly 속성을 제거하여 편집 가능하게 함
				    $row.find(".reviewContent").prop("readonly", false);
				    $row.find(".Grade").prop("readonly", false);
				    //$row.find(".memId").prop("readonly", false);
				    $row.find(".RegDate").prop("readonly", false);
				    
				    // 날짜 부분 숨기기
				    $row.find(".RegDate").hide();
				    //평점부분 숨기기
				     $row.find(".Grade2").hide();
				    
				    // 버튼 텍스트를 "저장"으로 변경하고 이벤트 핸들러를 업데이트
				    $(this).text("저장").removeClass("editButton").addClass("saveButton").off("click");
				    
				    $(this).click(function() {
				         // 업데이트된 값을 가져옴
				         let reviewContent = $row.find(".reviewContent").val();
				         let grade = $row.find("input[name='grade']:checked").val();
				         let reviewId = $row.find(".reviewId").val();
				         
				         // AJAX를 사용하여 업데이트 작업			         
						 	  $.ajax({
								type: "GET",
								url: "ReviewUpdate",
								data: {
										reviewId: reviewId,
										grade: grade,
										reviewContent: reviewContent,
				  
										 },
				            dataType: "json",
				            success: function(respData) {
				                if (respData.result === "success") {
				                    alert("리뷰가 성공적으로 수정되었습니다.");
				                    document.getElementById("reviewForm").reset();
				                    loadComments();
				                } else {
				                    alert("리뷰 수정에 실패했습니다.");
				                    
				                }
				            },
				            error: function(jqXHR, textStatus, errorThrown) {
				                alert("실패!! 값을 입력하세요");
				                
				            }
				        });
				        return false; 
				         // 날짜 부분 다시 표시
						//$row.find(".RegDate").show();
				         
				     });
				});
			 
        },
        error:  function(jqXHR, textStatus, errorThrown){
			
		}
    });
}



//입력시에 입력 안했을때 check
function validateForm() {
    var grade = document.getElementsByName("grade");
    var isChecked = false;

    for (var i = 0; i < grade.length; i++) {
        if (grade[i].checked) {
            isChecked = true;
            break;
        }
    }

    if (!isChecked) {
        alert("도서 평점을 선택해주세요.");
        return false; // 페이지 전환을 막음
    }

    var content = document.getElementsByName("content")[0].value;
    if (content.trim() === "") {
        alert("내용을 입력해주세요.");
        return false; // 페이지 전환을 막음
    }

    return true; // 선택된 평점이 있고 내용이 입력되면 페이지 전환을 허용
}


//리뷰등록 ajax
$(document).ready(function() {
    $("#submitReviewButton").click(function() {
        var memId = $("#memId").val();
        var grade = $("input[name='grade']:checked").val();
        var reviewContent = $("#reviewContent").val();
        var bookId = $("#bookId").val();

        $.ajax({
            type: "GET",
            url: "bookReview",
            data: {
                memId: memId,
                grade: grade,
                reviewContent: reviewContent,
                bookId: bookId
            },
            dataType: "json",
            success: function(respData) {
                if (respData.result === "success") {
                    alert("리뷰가 성공적으로 저장되었습니다.");
                    document.getElementById("reviewForm").reset();
                    loadComments();
                } else {
                    alert("리뷰 저장에 실패했습니다.");
                    
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                alert("로그인 후 이용해주세요");
            }
        });
        return false; 
    });
});

loadComments(); //페이지 로딩 시 댓글을 불러오는 함수호출

//리뷰수정
function openUpdateReviewForm(memId, reviewId, reviewContent) {
	alert("댓글수정시작");
    var reviewDiv = $("#review-" + reviewId);
    reviewDiv.empty(); // 댓글 내용을 비웁니다.

    var updateForm = $("<form>");
    updateForm.attr("id", "updateForm-" + reviewId);

    var inputField = $("<input>");
    inputField.attr("type", "text");
    inputField.attr("value", reviewContent);
    inputField.attr("id", "updateReviewContent-" + reviewId);
    inputField.attr("name", "updateReviewContent");
    inputField.attr("required", "required");

    var saveButton = $("<button>");
    saveButton.attr("type", "button");
    saveButton.text("저장");
    saveButton.click(function() {
        var updatedReviewContent = $("#updateReviewContent-" + reviewId).val();
        // 여기에 수정된 내용을 서버로 보내는 AJAX 요청을 추가할 수 있습니다.

        // 수정 내용을 저장한 후, 수정 폼을 닫고 댓글을 업데이트합니다.
        closeUpdateReviewForm(memId, reviewId, updatedReviewContent);
    });

    var cancelButton = $("<button>");
    cancelButton.attr("type", "button");
    cancelButton.text("취소");
    cancelButton.click(function() {
        closeUpdateReviewForm(memId, reviewId, reviewContent);
    });

    updateForm.append(inputField);
    updateForm.append(saveButton);
    updateForm.append(cancelButton);

    reviewDiv.append(updateForm);
}
function closeUpdateReviewForm(memId, reviewId, updatedReviewContent) {
    var reviewDiv = $("#review-" + reviewId);
    reviewDiv.empty(); // 댓글 내용을 비웁니다.

    // 수정된 내용으로 댓글을 업데이트합니다.
    reviewDiv.append(updatedReviewContent);

    // 여기에 수정 내용을 서버로 보내는 AJAX 요청을 추가할 수 있습니다.
}
//아이디값 받아서 리뷰삭제 ajax
function deleteReview(reviewId) {

    // 삭제 버튼을 클릭할 때 호출될 함수
    $.ajax({
        type: "GET",
        url: "deleteReview",
        data: {
            memId: memId, // memId를 Ajax 요청 데이터에 추가
            reviewId: reviewId
        },
        dataType: "json",
        success: function(respData) {
            if (respData.result === "success") {
                alert("리뷰가 성공적으로 삭제되었습니다.");
                loadComments(); // 댓글을 다시 로드하여 최신 상태 유지
            } else {
                alert("리뷰 삭제에 실패했습니다.");
            }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert("Ajax 처리 실패: " + textStatus + ", " + errorThrown);
        }
    });
}

</script>

</script>
</head>
<body>
	<div class="inner">


		<%
   
   HttpSession session1 = request.getSession();
   MembersVO membersVO = (MembersVO)session.getAttribute("loginUser");
   
   %>
		<script>
        function processAction(action) {
            var bookId = document.querySelector("input[name='bookId']").value;
            var quantity = document.querySelector("input[name='quantity']").value;
			
            
            if (action === 'orderSelNow') {
            	
            	 <%
          	   try {
          	        if (membersVO.getMemId() == null) {
          	    %>
          	         alert("로그인 후 이용해주세요");
          	         window.location.href = '../members/02_login.jsp'
          	   <%
          	      
          	   }else {%>
          	 		url = "orderSelNow?bookId=" + bookId + "&quantity=" + quantity;
          	<%  }
          	        // 로그인한 사용자일 경우 원하는 작업을 수행
          	        // memId 변수에 로그인한 사용자의 아이디가 저장됨
          	    } catch (NullPointerException e) {
          	%>
          	      alert("로그인 후 이용해주세요");
          	      window.location.href = '../members/02_login.jsp'
          	<%
          	        
          	    }
          	%>
            	 
            } else if (action === 'addToCart') {
            	alert("장바구니에 추가 버튼을 클릭했습니다.");

            	   <%
            	   try {
            	        if (membersVO.getMemId() == null) {
            	    %>
            	         alert("로그인 후 이용해주세요");
            	         window.location.href = '../members/02_login.jsp'
            	   <%
            	      
            	   }else {%>
            	        $.ajax({
            	          type : "get",
            	          url : "addCart",
            	          dataType : "json",
            	          data : {"bookId": bookId}, //나중에 1대신 bookId로 변경해서 addCartController로 전달함을 표현
            	          success : function(respData){
            	         console.log("받은 데이터 " + respData);
            	            console.log(respData.list);
            	            

            	            if(confirm("도서를 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?")) {
            	                location.href = "cart.jsp?quantity=" + quantity;
            	         } else {
            	             
            	         }
            	      },
            	      error : function(request, status, error){
            	         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            	          }   
            	       })
            	<%  }
            	        // 로그인한 사용자일 경우 원하는 작업을 수행
            	        // memId 변수에 로그인한 사용자의 아이디가 저장됨
            	    } catch (NullPointerException e) {
            	%>
            	      alert("로그인 후 이용해주세요");
            	      window.location.href = '../members/02_login.jsp'
            	<%
            	        
            	    }
            	%>
            } else if (action === 'addToWishlist') {
            	alert("찜 버튼을 클릭했습니다.");

                <%
                try {
                     if (membersVO.getMemId() == null) {
                 %>
                      alert("로그인 후 이용해주세요");
                      window.location.href = '../members/02_login.jsp'
                <%
                   
                }else {%>
                   $.ajax({
                      type : "get",
                      url : "addLike",
                      dataType : "json",
                      data : {"bookId": bookId}, 
                      success : function(respData){
                         console.log("받은 데이터 " + respData);
                            console.log(respData.list);
                         if (respData.count >= 1) {
                            if(confirm("이미 찜 목록에 등록된 도서입니다. 찜 목록으로 이동하시겠습니까?")) {
                               location.href = "like.jsp";
                            } else { }
                              } else {
                               if(confirm("찜 목록에 등록되었습니다. 찜 목록으로 이동하시겠습니까?")) {
                               location.href = "like.jsp?quantity="+quantity;
                            } else { }
                            }
                      },
                      error : function(request, status, error){
                           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                      }   
                   })
             <%  }
                     // 로그인한 사용자일 경우 원하는 작업을 수행
                     // memId 변수에 로그인한 사용자의 아이디가 저장됨
                 } catch (NullPointerException e) {
             %>
                   alert("로그인 후 이용해주세요");
                   window.location.href = '../members/02_login.jsp'
             <%
                     
                 }
             %>
            }

            window.location = url;
        }
        
        
    </script>
		<div class="inner">
			<h4 class="mt-4 mb-4"></h4>
			<div class="innerDetail d-flex">

				<div class="book-info col-md-9 row">
					<c:forEach var="vo" items="${list}">
						<dl class="bookImage col col-sm-4">
							<dd>
								<img src="<c:url value='/upload/${vo.bookImage}' />" alt="Image">
							</dd>
						</dl>
						<div class="book-infolist col col-sm-8">
							<p class="h3 ">${vo.bookName}</p>

							<hr class="mt-3 mb-3">

							<div class="info01">
								<dl class="row">
									<dt class="col-sm-3">저자</dt>
									<dd class="col-sm-9">${vo.author}</dd>
								</dl>
								<dl class="row">
									<dt class="col-sm-3">출판사</dt>
									<dd class="col-sm-9">${vo.publisher}</dd>
								</dl>

								<dl class="row">
									<dt class="col-sm-3">카테고리</dt>
									<dd class="col-sm-9">${vo.category}</dd>
								</dl>

								<dl class="row">
									<dt class="col-sm-3">가격</dt>
									<dd class="col-sm-9">${vo.price}</dd>
								</dl>
							</div>

						</div>

					</c:forEach>
				</div>

				<div class="detailCart col d-flex align-items-center p-4">
					<form id="purchaseForm" method="POST">
						<input type="hidden" name="bookId" value="${list[0].bookId}">
						<div class="numInput d-flex flex-row ">
							<label class="col" for="quantity">수량:</label> <input
								class="form-control form-control-sm col" type="number"
								id="quantity" name="quantity" value="1" min="1">
						</div>
						<hr class="mt-3 mb-3">
						<span class="orderbtn"><button type="button"
								class="btn btn-danger btn-lg btn-block mt-2 mb-2"
								onclick="processAction('orderSelNow')">바로구매</button></span> <span
							class="cartbtn"><button type="button"
								class="btn btn-success btn-lg btn-block mt-2 mb-2"
								onclick="processAction('addToCart')">장바구니 담기</button></span> <span
							class="likebtn"><button type="button"
								class="btn btn-outline-secondary btn-lg btn-block mt-2 mb-2"
								onclick="processAction('addToWishlist')">찜하기</button></span>
					</form>
				</div>
			</div>

			<hr class="mt-3 mb-3">

			<dl class="book-details rounded p-4 mt-4">
				<dt>내용</dt>
				<dd>${list[0].details}</dd>
			</dl>

			<hr class="mt-3 mb-3">

			<div class="review">


				<h5>독자서평</h5>

				<form id="reviewForm" action="bookReview" method="get"
					onsubmit="return validateForm();">

					<p>
						도서 평점: <input type="radio" name="grade" value="1" id="grade1"><label
							for="grade1">1점</label> <input type="radio" name="grade"
							value="2" id="grade2"><label for="grade2">2점</label> <input
							type="radio" name="grade" value="3" id="grade3">
						<labelfor"grade3">3점</label> <input type="radio" name="grade"
							value="4" id="grade4"> <label for="grade4">4점</label> <input
							type="radio" name="grade" value="5" id="grade5"> <label
							for="grade5">5점</label>
					</p>
					<input type="hidden" id="bookId" name="bookId"
						value="${list[0].bookId}"> <input type="hidden"
						name="bookImage" value="${list[0].bookImage}">
					<p>
						내용:
						<textarea id="reviewContent" name="reviewContent" rows="4"
							cols="55"></textarea>
					</p>
					<input type="submit" id="submitReviewButton" value="댓글저장">

				</form>
				<table id="commentTable">
					<tbody id="commentBody">
						<hr class="mt-3 mb-3">
					</tbody>

				</table>
				<hr>
			</div>
</body>
<style>
.bookImage img {
	display: block;
	width: 100%;
}

.detailCart, .book-details {
	background-color: #f2f2f2;
}

.cartbtn .btn-success {
	background-color: #285a34;
}

#reviewContent {
	width: -webkit-fill-available;
}

#reviewBtn {
	line-height: 1;
	width: max-content;
	border: none;
	font-size: large;
}

#reviewBtn:hover {
	background-color: #285a34;
	color: white;
}
</style>
</html>