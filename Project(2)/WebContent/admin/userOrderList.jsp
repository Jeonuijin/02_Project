<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../user/category.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 주문정보 결과</title>
</head>
<style>

   .searchTable {
      margin: auto;
        padding: 0px;
          width: 100%;
       flex: 1;
   }
   
   table {
       margin: auto; 
       padding: 0px;
       border-collapse: collapse;
       border: none;
       width: 1000px;
       font-size: 15px;
       
   }
   
   hr {
      background: #C2C2C2;
          height:1px;
       border:0;
       width: 1000px;
   }
   
   table th, table td {
      
      padding: 5px;
       height: 50px;
       text-align: center;
       border-top: 1px solid;
       border-bottom: 1px solid;
       border-color: #ddd;
   }
   

    .searchTableH {
        text-align: center;
   } 
   

   table, td, th {
   
       border-collapse : collapse;
       border : thin solid #C2C2C2;
       text-align: center;
   }
   
   
   table th {
      background-color: #285A34;
      color: #fff;
   }
   
   table tr:nth-child(odd) {
      background-color: #F0F0F0;
   }
   
   
   table tr:nth-child(even) {
      background-color: #fff;
   }
   
   table tr:hover {
      background-color: #D5D5D5;   
      

   } 
</style>

<script>

   function prevPage() {
       
       history.go(-1);
    }
   
</script>

<body>
<div class="inner">
   <div class="searchTable">
   
   <br><br>
   <h2 class="searchTableH" style="color: #285A34;">주문정보 조회 결과</h2>
   <hr>
   <h5 class="searchTableH">회원아이디 <font size="5em" color="#285A34">"${list[0].memId}"</font> 님의 주문정보 조회 결과입니다.</h5>
   <br><br>
   
   <table>
      <colgroup>
           <col width="8%" />
           <col width="8%" />
           <col width="11%" />
           <col width="11%" />
           <col width="10%" />
           <col width="5%" />
           <col width="12%" />
           <col width="25%" />
           <col width="11%" />
       </colgroup>
         <tr>
            <th>주문번호</th>
            <th>주문금액</th>
            <th>주문일자</th>
            <th>배송예정일</th>
            <th>결제수단</th>
            <th>수량</th>
            <th>[수령인]연락처</th>
            <th>[수령인]주소</th>
            <th>[수령인]이름</th>
         </tr>

         <c:forEach var="vo" items="${list}">
            <tr>
               <td>${vo.orderId}</td>
               <td>${vo.totalPrice}</td>
               <td>${vo.orderdate}</td>
               <td>${vo.dlvydate}</td>
               <td>${vo.payment}</td>
               <td>${vo.totalCnt}</td>
               <td>${vo.rcvPhone}</td>
               <td>${vo.rcvAddress}</td>
               <td>${vo.rcvName}</td>
               
            </tr>
         </c:forEach>
      </table>
      <br><br>
      
   </div>
</div>
</body>
</html>