

<%@page import="com.util.db.Student"%>


<%
	Student s= (Student)session.getAttribute("student");
%>


<%
String status = "disabled";
if(s != null){
	if(s.getRole().equalsIgnoreCase("admin")){
		status = "enabled";
	}	
}

%>

	<nav class="navbar navbar-expand-lg navbar-dark bg-light">
	<div class="container">
 
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link " href="index.jsp">Accueil </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="myBooks.jsp">Mes livres</a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link <%=status %>" href="booksHandling.jsp">Livres</a>
      </li>
       <li class="nav-item">
        <a class="nav-link <%=status %>" href="studentHandling.jsp">Etudiants</a>
      </li>
    </ul>
   
  </div>
  </div>
</nav>
