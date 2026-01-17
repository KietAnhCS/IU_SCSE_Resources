<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="stylesheet.css" title="style" />
        <script type="text/javascript" src="javascript.js"></script>
    </head>
    <body>
        <h2><b>Lab 09</b></h2>
        <h2><b>AJAX: Auto-Completion using AJAX</b></h2>
        <p style="color: #6D7B8D">This example shows how you can do real time auto-completion using Asynchronous JavaScript and XML (Ajax) interactions.</p>
        <p style="color: #6D7B8D">In the form below enter a name. Possible names that will be completed are displayed below the form. For example, try typing in "Sinh", "Khanh", or "Van", then click on one of the selections to see composer details.</p>
        <form name="autofillform" action="AutoCompleteServlet">
            <table border="0" cellpadding="5">
                <tbody>
                    <tr>
                        <td><strong>Composer Name:</strong></td>
                        <td>
                            <input type="text" size="40" id="complete-field" onkeyup="doCompletion()" />
                        </td>
                    </tr>
                    <tr>
                        <td id="auto-row" colspan="2">
                            <table id="complete-table" class="popupBox"></table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </body>
</html>
