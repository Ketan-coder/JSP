<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Machine List Page</title>
</head>
<body>

<div id="list">
    <ul>
        <li><a href="home.jsp">Home</a></li>
        <li><a href="machineList.jsp">Machine List</a></li>
        <li><a href="feedback.jsp">Feedback</a></li>
    </ul>
</div>

<div id="content">
    <h2>Machine List</h2>
    <table border="1">
        <tr>
            <th>Model_no</th>
            <th>Processor</th>
            <th>RAM</th>
            <th>Cost</th>
        </tr>

        <% 
            // Assuming you have set up a DataSource named "jdbc/machineDB" in your servlet container
            try {
                Context initContext = new InitialContext();
                Context envContext = (Context) initContext.lookup("java:/comp/env");
                DataSource ds = (DataSource) envContext.lookup("jdbc/machineDB");

                try (Connection conn = ds.getConnection();
                     Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery("SELECT * FROM Machine_Listing")) {

                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getString("model_no") + "</td>");
                        out.println("<td>" + rs.getString("processor") + "</td>");
                        out.println("<td>" + rs.getString("RAM") + "</td>");
                        out.println("<td>" + rs.getString("cost") + "</td>");
                        out.println("</tr>");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</div>

</body>
</html>
