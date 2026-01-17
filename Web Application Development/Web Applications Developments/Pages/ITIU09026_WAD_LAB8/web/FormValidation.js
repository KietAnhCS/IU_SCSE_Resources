/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
var valid
var name
var mail
var username
var password
var retype
            
function generatePage() {
    if ((getCookieValue("name") != null) && (getCookieValue("mail") != null) && (getCookieValue("username") != null) && (getCookieValue("password") != null)) {
        document.writeln("<h1>Registration Information</h1>")
        document.writeln("* you have already registered *")
        document.writeln("<hr />")
        document.writeln("<h3>Full name: ")
        document.writeln(getCookieValue("name") + "</h3>")
        document.writeln("<h3>Email: ")
        document.writeln(getCookieValue("mail") + "</h3>")
        document.writeln("<h3>Username: ")
        document.writeln(getCookieValue("username") + "</h3>")
        document.writeln("<h3>Password: ")
        document.writeln(getCookieValue("password") + "</h3>")
    } else {
        document.getElementById('name').focus()
    }
}
            
function checkForm() {
    valid = true;
    name = document.getElementById('name').value
    mail = document.getElementById('mail').value
    username = document.getElementById('username').value
    password = document.getElementById('pass').value
    retype = document.getElementById('retype').value
            
    // check white space and null input
    if (name.match(/^\s*$/)) {
        document.getElementById('namelab').innerHTML = "Full name is empty!";
        valid = false
    } else {
        document.getElementById('namelab').innerHTML = ""
    }
                
    if (username.match(/^\s*$/)) {
        document.getElementById('usernamelab').innerHTML = "Username is empty!";
        valid = false
    } else {
        document.getElementById('usernamelab').innerHTML = ""
    }
                
    if (password.match(/^\s*$/)) {
        document.getElementById('passlab').innerHTML = "Please enter password!";
        document.getElementById('pass').value = ""
        document.getElementById('retype').value = ""
        valid = false
    } else {
        document.getElementById('passlab').innerHTML = ""
    }
                
    // check password re-enter mismatch
    if (password != retype) {
        document.getElementById('retypelab').innerHTML = "Re-type password mismatch!"
        document.getElementById('pass').value = ""
        document.getElementById('retype').value = ""
        valid = false
    } else {
        document.getElementById('retypelab').innerHTML = ""
    }
                
    // check invalid email address
    if ((mail.length < 9) || (mail.indexOf('@') == -1) || (mail.indexOf('.') == -1)){
        document.getElementById('maillab').innerHTML = "Invalid Email address!"
        valid = false
    } else {
        document.getElementById('maillab').innerHTML = ""
    }
                
    // store and submit user's input
    if (valid == true) {
        storeData(name, mail, username, password)
    }
}
            
function storeData(name, mail, username, password) {
    setCookie("name", name,365)
    setCookie("mail", mail, 365)
    setCookie("username", username, 365)
    setCookie("password", password, 365)
    document.getElementById('name').disabled = true
    document.getElementById('mail').disabled = true
    document.getElementById('username').disabled = true
    document.getElementById('pass').disabled = true
    document.getElementById('retype').disabled = true
    document.getElementById('submit').disabled = true
    document.getElementById('checklab').innerHTML = "Registration Completed! Thank you!"
}
            
function setCookie(cookie_name,cookie_value,expire_days)
{
    var expire = new Date()
    expire.setDate(expire.getDate() + expire_days)
    var value = escape(cookie_value) + ((expire_days == null) ? "" : "; expires=" + expire.toUTCString())
    document.cookie = cookie_name + "=" + value
}
            
function getCookieValue(cookie_name) {
    var cookies = document.cookie.split( ';' )
    var temp = ''
    var name = ''
    var value = ''
    var found = false
    for (i = 0; i < cookies.length; i++ )
    {
        temp = cookies[i].split( '=' )
        name = temp[0].replace(/^\s+|\s+$/g, '')

        if (name == cookie_name )
        {
            found = true
            if (temp.length > 1)
            {
                value = unescape(temp[1].replace(/^\s+|\s+$/g, ''))
            }
            return value
            break
        }
        temp = null
        name = ''
    }
    if (!found)
    {
        return null
    }
}

