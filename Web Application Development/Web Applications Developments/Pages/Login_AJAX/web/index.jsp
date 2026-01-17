<%-- 
    Document   : index
    Created on : Dec 19, 2011, 1:53:03 PM
    Author     : Trong Tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            var req;
            var isIE;
            function login() {
                var url = "login?action=check&id=" + escape(document.getElementById('user').value) + "&pass=" + escape(document.getElementById('pass').value);
                req = initRequest();
                req.open("GET", url, true);
                req.onreadystatechange = callback;
                req.send(null);
            }
            function initRequest() {
                if (window.ActiveXObject) {
                    return(new ActiveXObject("Microsoft.XMLHTTP"));
                } else if (window.XMLHttpRequest) {
                    return(new XMLHttpRequest());
                } else {
                    return(null);
                }
            }
            function callback() {
                if (req.readyState == 4) {
                    if (req.status == 200) {
                        document.getElementById('user').disabled = true;
                        document.getElementById('pass').disabled = true;
                        document.getElementById('login_submit').disabled = true;
                        document.getElementById('result').innerHTML = "success";
                    }
                }
            }
        </script>
    </head>
    <body>
        <form id="login" action="login" method="get">
            USERNAME: <input type="text" id="user" name="user" />
            <br />PASSWORD: <input type="password" id="pass" name="pass" />
            <br /><input type="button" value="login" onClick="login()" id="login_submit" />
            <br /><label id="result"></label>
        </form>
    </body>
</html>
