<%-- 
    Document   : Quadratic
    Created on : Oct 9, 2011, 11:45:23 AM
    Author     : Trong Tin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Quadratic Equation Solving Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>Enter the three coeffecient for the Quadratic Equation</h1>
        <h2>The equation has a form of a*x^2 + b*x + c = 0</h2>
        <FORM action="./Solve" method="POST">
            <label><b>a:</b></label>
            <input class="textbox" name="a"/>
            <label><b>b:</b></label>
            <input class="textbox" name="b"/>
            <label><b>c:</b></label>
            <input class="textbox" name="c"/>
            <br /><br /><font size="x-small"><b>*Note:</b> negative number <b>MUST BE</b> enter with the sign and the value next to each other (no space between)<b>*</b> </font>
            <br /><font size="x-small"><u>Example:</u> -2 <b>(true)</b> and - 2 <del>(false)</del></font>
            <br /><h2>Then, click the SOLVE button to see the result</h2>
            <input class="button" type="Submit" value="SOLVE" />
        </form>
    </body>
</html>
