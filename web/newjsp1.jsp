<%@page import="java.util.ArrayList"%>
<%@page import="com.onlineteaching.entities.Course"%>
<%@page import="com.onlineteaching.dao.CourseDAO"%>
<%@page import="com.onlineteaching.helper.ConnectionProvider"%>
<%@page import="com.onlineteaching.helper.ConnectionProvider"%>
<link href='https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css' rel='stylesheet'>
<% CourseDAO coursed = new CourseDAO(ConnectionProvider.getConnection()); %>
<table id="example" class="table table-striped" style="width:100%">
    <thead>
        <tr>
            <th scope="col">CourseID</th>
            <th scope="col">CourseName</th>
            <th scope="col">DepartmentID</th>
            <th scope="col">CourseCode</th>
            <th scope="col">WeekDay</th>
            <th scope="col">Room</th>
            <th scope="col">Instructor</th>
            <th scope="col">StartSlot</th>
            <th scope="col">NumbersOfSlots</th>
            <th scope="col">ClassID</th>
            <th scope="col">Semester</th>
            <th scope="col">SchoolYear</th>
            <th scope="col">GroupClass</th>
            <th scope="col">Lab</th>
            <th scope="col">LabGroup</th>
            <th scope="col">UserID</th>
        </tr>
    </thead>
    <tbody>
        <%
                            ArrayList<Course> listc = coursed.getAllCourses();
                            for (Course d : listc) {
                        %>
                        <tr>
                            <th scope="row"><%=d.getCourseID()%></th>
                            <td><%=d.getCourseName()%></td>
                            <td><%=d.getDepartmentID()%></td>
                            <td><%=d.getCourseCode()%></td>
                            <td><%=d.getWeekDay()%></td>
                            <td><%=d.getRoom()%></td>
                            <td><%=d.getInstructor()%></td>
                            <td><%=d.getStartSlot()%></td>
                            <td><%=d.getNumbersOfSlots()%></td>
                            <td><%=d.getClassID()%></td>
                            <td><%=d.getSemester()%></td>
                            <td><%=d.getSchoolYear()%></td>
                            <td><%=d.getGroup()%></td>
                            <td><%=d.getLab()%></td>
                            <td><%=d.getHasLab()%></td>
                            <td><%=d.getUserID()%></td>
                        </tr>
                    <%
                        }
                    %>
    </tbody>
    <tfoot>
        <tr>
            <th>Name</th>
            <th>Position</th>
            <th>Office</th>
            <th>Age</th>
            <th>Start date</th>
            <th>Salary</th>
        </tr>
    </tfoot>
</table>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script>
    $(document).ready(function () {
        $('#example').DataTable();
    });
</script>
