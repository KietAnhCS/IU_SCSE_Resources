<%
  String base = (String) application.getAttribute("base");
%>
<HTML>
<HEAD>
<TITLE>Check Out</TITLE>
</HEAD>
<BODY>
<TABLE>
<TR>
  <TD COLSPAN=2><jsp:include page="Header.jsp" flush="true"/></TD>
</TR>
<TR>
  <TD><jsp:include page="Menu.jsp" flush="true"/></TD>
  <TD VALIGN="TOP">
    <FORM>
    <INPUT TYPE="HIDDEN" NAME="action" VALUE="order">
    <TABLE>
    <TR>
      <TD COLSPAN="2"><I><B>Delivery Details</B></I></TD>
    </TR>
    <TR>
      <TD>Contact Name:</TD>
      <TD><INPUT TYPE="TEXT" NAME="contactName"></TD>
    </TR>
    <TR>
      <TD>Delivery Address:</TD>
      <TD><INPUT TYPE="TEXT" NAME="deliveryAddress"</TD>
    </TR>
    <TR>
      <TD COLSPAN="2"><I><B>Credit Card Details</B></I></TD>
    </TR>
    <TR>
      <TD>Name on Credit Card:</TD>
      <TD><INPUT TYPE="TEXT" NAME="ccName"</TD>
    </TR>
    <TR>
      <TD>Credit Card Number:</TD>
      <TD><INPUT TYPE="TEXT" NAME="ccNumber"></TD>
    </TR>
    <TR>
      <TD>Credit Card Expiry Date:</TD>
      <TD><INPUT TYPE="TEXT" NAME="ccExpiryDate"</TD>
    </TR>
    <TR>
      <TD>&nbsp;</TD>
      <TD><INPUT TYPE="SUBMIT" VALUE="Check Out"></TD>
    </TR>
    </TABLE>
    </FORM>
  </TD>
</TR>
</TABLE>
</BODY>
</HTML>
