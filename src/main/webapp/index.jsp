
<%@page import="com.util.db.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.util.db.BookManager"%>
<%@page import="com.util.db.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Accueil</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/bootstrap.js"></script>
</head>
<body>


	<%
	Student s = (Student) session.getAttribute("student");
	BookManager bm = new BookManager();
	List<Book> ab ;
	%>



	<%
	if (request.getParameter("op") != null) {
		if (request.getParameter("op").equals("add")) {
			int student_id = Integer.parseInt(request.getParameter("student_id"));
			int book_id = Integer.parseInt(request.getParameter("book_id"));
			bm.addBookFromStudent(student_id, book_id);
		}
	}
	%>


	<jsp:include page="navBar.jsp"></jsp:include>


	<%
	if (request.getParameter("Cop") != null) {
		/* la list des livres de bibliotheque par categorie*/
		
		String Cop = request.getParameter("Cop");
		 ab = bm.allBooksByCategorie(Cop);
	} else if (request.getParameter("Aop") != null) {
		/* la list des livres de bibliotheque par auteur */
		
		String Aop = request.getParameter("Aop");
		 ab = bm.allBooksByAuthor(Aop);
	}else{	
	
	
	 	 ab = bm.allBooksAvailable();
	}
	%>


	<div class="Container m-5">
		<div class="row ">
			<div class="col-4"></div>
			<div class="col-4 offset-4 d-flex flex-row" style="display: flex!important;
    justify-content: flex-start;
    width: -1%;
    margin-left: 0%;">
				<div class="row">
					<div class="col-10 offset-2  ">

						<form class="d-flex mb-2" method="Get">
							<input class="form-control me-2" type="search" placeholder="Categorie" aria-label="Search" name="Cop">
							<button class="btn btn-outline-primary center" type="submit">Search</button>
						</form>
						<form class="d-flex mb-2">
							<input class="form-control me-2" type="search" placeholder="Auteur" aria-label="Search" name="Aop">
							<button class="btn btn-outline-primary" type="submit">Search</button>
						</form>
					</div>
				</div>
			</div>



			<hr>
			<%
			for (Book b : ab) {
			%>
			<div class="col-4 mt-3">
				<div class="card">
					<div class="card-header">
						<div class="row justify-content-between">
							<div class="col-5">
								<h5><%=b.getName().toUpperCase()%></h5>
							</div>

							<div class="col-4">
								<a
									href="?op=add&student_id=<%=s.getId()%>&book_id=<%=b.getId()%>"
									class="btn btn-success px-4 py-2">Emprunter</a>
							</div>
						</div>

					</div>
					<div class="card-body">

						<p class="card-text ">
							<b>Categorie : </b><%=b.getCategorie()%>
						</p>
						<p class="card-text ">
							Autheur : <%=b.getAuthor()%>
							
						</p>

					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>