<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Gallery - Snapshot by TEMPLATED</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="resources/assets/css/main.css?after" />
	</head>
	<body>
		<div class="page-wrap">

			<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a href="${pageContext.request.contextPath}" class="active"><span class="icon fa-home"></span></a></li>
						<li><a href="${pageContext.request.contextPath}/gallery"><span class="icon fa-camera-retro"></span></a></li>
						<li><a href="${pageContext.request.contextPath}/generic"><span class="icon fa-file-text-o"></span></a></li>
					</ul>
				</nav>

			<!-- Main -->
				<section id="main">

					<!-- Header -->
						<header id="header">
							<div>Snapshot <span>by TEMPLATED</span></div>
						</header>

					<!-- Gallery -->
						<section id="galleries">

							<!-- Photo Galleries -->
								<div class="gallery">

									<!-- Filters -->
										<header>
											<h1>Gallery</h1>
											<ul class="tabs">
												<li><a href="#" data-tag="all" class="button active">All</a></li>
												<li><a href="#" data-tag="people" class="button">People</a></li>
												<li><a href="#" data-tag="place" class="button">Places</a></li>
												<li><a href="#" data-tag="thing" class="button">Things</a></li>
											</ul>
										</header>

										<div class="content">
											<div class="media all people">
												<a href="resources/images/fulls/01.jpg"><img src="resources/images/thumbs/01.jpg" alt="" title="This right here is a caption." /></a>
											</div>
											<div class="media all place">
												<a href="resources/images/fulls/05.jpg"><img src="resources/images/thumbs/05.jpg" alt="" title="This right here is a caption." /></a>
											</div>
											<div class="media all thing">
												<a href="resources/images/fulls/09.jpg"><img src="resources/images/thumbs/09.jpg" alt="" title="This right here is a caption." /></a>
											</div>
											<div class="media all people">
												<a href="resources/images/fulls/02.jpg"><img src="resources/images/thumbs/02.jpg" alt="" title="This right here is a caption." /></a>
											</div>
											<div class="media all place">
												<a href="resources/images/fulls/06.jpg"><img src="resources/images/thumbs/06.jpg" alt="" title="This right here is a caption." /></a>
											</div>
											<div class="media all thing">
												<a href="resources/images/fulls/10.jpg"><img src="resources/images/thumbs/10.jpg" alt="" title="This right here is a caption." /></a>
											</div>
											<div class="media all people">
												<a href="resources/images/fulls/03.jpg"><img src="resources/images/thumbs/03.jpg" alt="" title="This right here is a caption." /></a>
											</div>
											<div class="media all place">
												<a href="resources/images/fulls/07.jpg"><img src="resources/images/thumbs/07.jpg" alt="" title="This right here is a caption." /></a>
											</div>
											<div class="media all thing">
												<a href="resources/images/fulls/11.jpg"><img src="resources/images/thumbs/11.jpg" alt="" title="This right here is a caption." /></a>
											</div>
											<div class="media all people">
												<a href="resources/images/fulls/04.jpg"><img src="resources/images/thumbs/04.jpg" alt="" title="This right here is a caption." /></a>
											</div>
											<div class="media all place">
												<a href="resources/images/fulls/08.jpg"><img src="resources/images/thumbs/08.jpg" alt="" title="This right here is a caption." /></a>
											</div>
											<div class="media all thing">
												<a href="resources/images/fulls/12.jpg"><img src="resources/images/thumbs/12.jpg" alt="" title="This right here is a caption." /></a>
											</div>
										</div>
								</div>
						</section>


					<!-- Footer -->
						<footer id="footer">
							<div class="copyright">
								&copy; Code by My git: <a href="https://github.com/jcho5078/Blog">Git</a>. Images: <a href="https://unsplash.com/">Unsplash</a>.
							</div>
						</footer>
				</section>
		</div>

		<!-- Scripts -->
			<script src="resources/assets/js/jquery.min.js"></script>
			<script src="resources/assets/js/jquery.poptrox.min.js"></script>
			<script src="resources/assets/js/jquery.scrolly.min.js"></script>
			<script src="resources/assets/js/skel.min.js"></script>
			<script src="resources/assets/js/util.js"></script>
			<script src="resources/assets/js/main.js"></script>

	</body>
</html>