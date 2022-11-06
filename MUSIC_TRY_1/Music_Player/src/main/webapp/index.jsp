<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%> 
  

<% 
	String names[] = new String[]{
			"#FA2A00","#D46601", "#FF03FB", "#2C961D", "#0058D5", "#0097AC",
			"#A008FF", "#F1003F", "#43C6DB", "#736AFF", "#8467D7", "#254117"};
%> 

<%
	String database = "projectdata";
	String userid = "root";
	String password = "Shansql@007";
	String name = request.getParameter("SearchBar");    
	String driver = "com.mysql.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";%>

	<%
	try {
		Class.forName(driver);
		} catch (ClassNotFoundException e) {
		e.printStackTrace();
		}
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
    %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Musify</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <nav>
        <ul>
            <li style="font-family:cursive;font-size:x-large;">Musify</li>                 <!--navigation bar-->
            <li><a style="text-decoration:none;color:white;" href="frontpage.jsp">Home</a></li>
    		<li>
    		<form action="index.jsp">
	            <div class="wrapper" >
	                <input class="search" placeholder="Search" type="text" name="SearchBar"> 
	            </div>
            </form>
            </li>
        </ul>
    </nav>

    
        <div class="containernew">
        <h2>SEARCH RESULTS</h2>
        <div class="containerTop">
        	<table class="table">
			
				<%
				try{
				connection = DriverManager.getConnection(connectionUrl+database, userid, password);
				statement=connection.createStatement();
				String sql ="SELECT * FROM onlytable WHERE songName='"+name+"' OR artistName = '"+name+"' OR genre= '"+name+"' OR language = '"+name+"'";
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){ %>
					<tr>
					<td><%=resultSet.getString("songName")%></td>
					<td><%=resultSet.getString("artistName")%></td>
					<td><%=resultSet.getString("genre")%></td>
					<td><%=resultSet.getString("time")%></td>
					<td><button class="link" value="<%=resultSet.getString("songname")%>" ><audio controls ><source src ="<%=resultSet.getString("songName")%>.mp3" type="audio/mp3" /></audio></button></td>
					</tr>
					
				<%	
				}
				connection.close();
				} 
				catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</table>
        </div>   
         
        <h2>Explore</h2>
        <div class="containerBottom">
        	<h2>Artist</h2>
            <form action="displayartist.jsp">
        	<div class = "containerArt">
        	<%
				try{
				connection = DriverManager.getConnection(connectionUrl+database, userid, password);
				statement=connection.createStatement();
				String sql ="SELECT DISTINCT artistName FROM onlytable WHERE like_dislike > 100";
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){ 
				Random r = new Random();
				int idx = r.nextInt(names.length);
				%>
					<div><button style = "background-color: <%=names[idx] %>;" name="artistButton" value = "<%=resultSet.getString("artistName")%>" type = "submit" class = "button2">
						<span class="buttontext"><%=resultSet.getString("artistName")%></span>
					</button>
					</div>
				<%	
				}
				connection.close();
				} 
				catch (Exception e) {
				e.printStackTrace();
				}
				%> 
            
            </div>
            </form>
            
            
        	<h2>Genre</h2>
            <form action="displaygenre.jsp">
        	<div class = "containerGen">
        	<%
				try{
				connection = DriverManager.getConnection(connectionUrl+database, userid, password);
				statement=connection.createStatement();
				String sql ="SELECT DISTINCT genre FROM onlytable WHERE like_dislike > 100";
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){  
				Random r = new Random();
				int idx2 = r.nextInt(names.length);%>
					<div><button style = "background-color: <%=names[idx2] %>;" name="genreButton" value = "<%=resultSet.getString("genre")%>" type = "submit" class = "button2">
						<span class="buttontext"><%=resultSet.getString("genre")%></span>
					</button>
					</div>
				<%	
				}
				connection.close();
				} 
				catch (Exception e) {
				e.printStackTrace();
				}
				%> 
            
            </div> 
            </form> 
            
            <h2>Language</h2>
        	<form action="displaylang.jsp">         	
        	<div class = "containerLan">  
        	<%
				try{
				connection = DriverManager.getConnection(connectionUrl+database, userid, password);
				statement=connection.createStatement();
				String sql ="SELECT DISTINCT language FROM onlytable WHERE like_dislike > 100";
				resultSet = statement.executeQuery(sql);
				while(resultSet.next()){  
				Random r = new Random();
				int idx3 = r.nextInt(names.length);%>
					<div><button style = "background-color: <%=names[idx3] %>;" name="langButton" value = "<%=resultSet.getString("language")%>" type = "submit" class = "button2">
						<span class="buttontext"><%=resultSet.getString("language")%></span>
					</button>
					</div>
				<%	
				}
				connection.close();
				} 
				catch (Exception e) {
				e.printStackTrace();
				}
				%>     	
        	
            </div>
            </form>         
    	</div>           
    </div> 

    <div class="bottom">
        <input type="range" name="range" id="myProgressBar" min="0" value="0" max="100">         <!--progress bar-->
        <div class="icons">
            <!--fontawesome icons-->
            <i class="fa-regular fa-heart"></i>
            <i class="fa-2x fa-solid fa-backward" id = "previous"></i>
            <i class="fa-2x fa-solid fa-play" id="masterPlay"></i>                                      <!--buttons-->
            <i class="fa-2x fa-solid fa-forward" id="next"></i>
        </div>
    </div>
    <script src="https://kit.fontawesome.com/31e8ce7dbf.js" ></script>
    <script src="script.js"></script>
</body>

<style>
@import url('https://fonts.googleapis.com/css2?family=DM+Sans&display=swap');
@import url('https://fonts.googleapis.com/css2?family=DM+Sans&family=Oxygen:wght@300&display=swap');
body{

    background-color: silver;
    height: 100%;
    width: 100%;
}

*{
    margin: 0;
    padding: 0;
}

nav{
    font-family: 'DM', sans-serif;
}

nav ul{
        display: flex;
        align-items: center;
        list-style-type: none;
        height: 60px;
        background-color: black;
        color: white;
}



.link{
color: black;
border-style: none;
background-color: black;
}



nav ul li{
    padding: 0 12px;
}

.wrapper {
    position: relative;
    display: flex;
    min-width: 30vw;
    min-height: 0vh;
    padding: 0 0 0 20vw;
}


.search {
    border: 1px solid grey;
    border-radius: 50px;
    height: 20px;
    width: 100%;
    padding: 2px 23px 2px 30px;
    outline: 0;
    background-color: #f5f5f5;
    
  }


.container{
    min-height: 78vh;
    background-color: rgba(24, 21, 21, 0.836);
    color: white;
    font-family: 'Oxygen', sans-serif;
    margin: 0;
    overflow-y: hidden;
    padding: 30px;
    overflow-x: hidden;
}

.containernew{
    min-height: 78vh;
    background-color: rgba(24, 21, 21, 0.836);
    margin: 0;
    padding: 5px;
    display:flex;
    flex-direction: column;
    overflow-y: hidden;
    overflow-x: hidden;
}
.containerTop{
	max-height: 50%;
    height:35vh;
    position:sticky;
    overflow-y:scroll;
    width:100%;
}

.containerTop::-webkit-scrollbar {
    display: none;
}

.containerBottom{
	height: 50%;
	display:flex;
    overflow-y:scroll;
    flex-direction: column;
}

.containerBottom::-webkit-scrollbar {
    display: none;
}

.button{
    height: 24vh;
    justify-content: space-between;
    border-radius: 10px;
    display: flex;
    flex-direction: column;
    background-color: white;
    width: 180px;
    margin: 0 2vw 2vw 0;
}

.button2{
    height: 160px;
    text-align:right;
    padding: 60% 10px 0 0;
    border-radius: 10px;
    width: 180px;
    margin: 0 2vw 2vw 0;
    box-shadow: 5px 5px 8px black;
}

.buttontext{
    font-size:large;
    color: white; 
	font-family: Tahoma; 
    
}

.containerartist{
    display: flex;
   margin-top: 10vh;
   margin-bottom: 10vh;
   overflow-y: hidden;
    overflow-x: scroll;
}

.containerartist::-webkit-scrollbar {
    display: none;
}

.containergenre{
    display: flex;
    margin-top: 10vh;
    margin-bottom: 10vh;
    overflow-y: hidden;
    overflow-x: scroll;
}

.containergenre::-webkit-scrollbar {
    display: none;
}

.containerlanguage{
    display: flex;
    margin-top: 10vh;
    margin-bottom: 10vh;
    overflow-y: hidden;
    overflow-x: scroll;
}

.containerlanguage::-webkit-scrollbar {
    display: none;
}


.bottom{
    position: sticky;
    height: 100px;
    padding-right: 20px;
    background-color: black;
    color: white;
    bottom: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}



.icons i{
    cursor: pointer;
    color: white;
    padding-left: 20px;
    margin-top: 14px;

}

.fa-heart{
    margin-bottom: 15px;
}

#myProgressBar{
    width: 80vw;
    text-align: center;
    cursor: pointer;
}

.containerLan{
	display:flex;
	padding-top:2vh;
	flex-wrap: wrap;
	overflow-x: scroll;
	flex-direction: row;
	
}

.containerGen{
	display:flex;
	padding-top:2vh;
	flex-wrap: wrap;
	overflow-x: scroll;
	flex-direction: row;
}

.containerArt{
	display:flex;
	padding-top:2vh;
	flex-wrap: wrap;
	overflow-x: scroll;
	flex-direction: row;
}


.containerLan::-webkit-scrollbar {
    display: none;
}

.containerArt::-webkit-scrollbar {
    display: none;
}
.containerGen::-webkit-scrollbar {
    display: none;
}


.songItem{
    height: 50px;
    display: flex;
    margin: 12px 0;
    justify-content: space-between;
    align-items: center;
}

.timestamp{
    margin: 0 23px;
}

.timestamp i{
    cursor: pointer;
}


table{
    background-color:rgba(0, 0, 0, 0.625);
    font-size:x-large;
    color:white;
    border-collapse: collapse;
    margin: 1vh 12vw 0 8vw;
    width: 80vw;
}

h2{
	color: white;
}


td{
	max-height: 200px;
    text-align:left;
    padding: 0 2px;
    border-bottom: 1pt solid;
    border-color:gray;
    width: 16vw;
    
}
</style>

</html>

    
    