<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 메인페이지의 헤더와 풋터부분을 제외한 가운데 페이지 바뀌는 부분의 메인페이지 -->
<title>Main</title>

<link href="../appdata/css/main.css" rel="stylesheet">
</head>
<body>

	<%@ include file="category.jsp"%>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
		</ol>
		<div class="carousel-inner">
			<a href="#1" style="background-color: #ffeaed;"
				class="carousel-item active"> <img
				src="../appdata/images/main1.jpg">
			</a> <a href="#2" style="background-color: #fff1da;"
				class="carousel-item"> <img src="../appdata/images/main2.jpg">
			</a>
		</div>
		<button class="carousel-control-prev" type="button"
			data-target="#myCarousel" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-target="#myCarousel" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
		</button>
	</div>



	<div class="inner">

		<ul class="nav nav-pills nav-fill" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active btn-lg btn-block" id="best-tab"
					data-toggle="tab" data-target="#best" type="button" role="tab"
					aria-controls="best" aria-selected="true">MD추천도서</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link btn-lg btn-block" id="new-tab"
					data-toggle="tab" data-target="#new" type="button" role="tab"
					aria-controls="new" aria-selected="false">화제의 신간</button>
			</li>
		</ul>
		<div class="tab-content border border-secondary"
			style="padding: 20px; background-color: #f7f8f9;">
			<div class="tab-pane active" id="best" role="tabpanel"
				aria-labelledby="best-tab">
				<div class="card-deck">
					<a href="bookListOne?bookId=3" class="card"> <!-- 첫 번째 card에 대한 링크 -->
						<img src="../appdata/images/KakaoTalk_20231031_184639159_04.jpg"
						class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</a> <a href="bookListOne?bookId=4" class="card"> <!-- 두 번째 card에 대한 링크 -->
						<img src="../appdata/images/KakaoTalk_20231031_184639159_05.jpg"
						class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This card has supporting text below as a
								natural lead-in to additional content.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</a> <a href="bookListOne?bookId=5" class="card"> <!-- 세 번째 card에 대한 링크 -->
						<img src="../appdata/images/KakaoTalk_20231031_184639159.jpg"
						class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<pclass "card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                    <p class="card-text">
                        <small class="text-muted">Last updated 3 mins ago</small>
                    </p>
                </div>
					</a>
				</div>
			</div>

			<div class="tab-pane" id="new" role="tabpanel"
				aria-labelledby="new-tab">
				<div class="card-deck">
					<a href="링크4의_URL" class="card"> <!-- 네 번째 card에 대한 링크 --> <img
						src="../appdata/images/KakaoTalk_20231031_184639159_02.jpg"
						class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</a> <a href="링크5의_URL" class="card"> <!-- 다섯 번째 card에 대한 링크 --> <img
						src="../appdata/images/KakaoTalk_20231031_184639159_01.jpg"
						class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This card has supporting text below as a
								natural lead-in to additional content.</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</a> <a href="링크6의_URL" class="card"> <!-- 여섯 번째 card에 대한 링크 --> <img
						src="../appdata/images/KakaoTalk_20231031_184639159_03.jpg"
						class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<pclass "card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This card has even longer content than the first to show that equal height action.</p>
                    <p class="card-text">
                        <small class="text-muted">Last updated 3 mins ago</small>
                    </p>
                </div>
					</a>
				</div>
			</div>
		</div>

		<script>
		  $(function () {
		    $('#myTab li:first-child button').tab('show')
		  })
		</script>

		<div class="container mt-5 mb-5">
			<div class="row">
				<div class="col-sm p-3 bg-secondary text-white rounded">고객
					상담전화 1566-2547</div>
				<div class="col-sm p-3 ml-2 bg-secondary text-white rounded">
					영업점 안내</div>
				<div class="col-sm p-3 ml-2 bg-secondary text-white rounded">
					입점문의</div>
			</div>
		</div>


	</div>


	<style>
.carousel-control-next-icon, .carousel-control-prev-icon {
	width: 40px;
	height: 40px;
	background-size: 20px;
	background-position: center;
	background-color: rgba(0, 0, 0, 0.3);
	border-radius: 10px;
}

.carousel-indicators li {
	background-color: #888;
}

.nav-pills .nav-link.active {
	background-color: #285a34;
}

.container.mt-5.mb-5 {
	text-align: center;
}
</style>

</body>
</html>