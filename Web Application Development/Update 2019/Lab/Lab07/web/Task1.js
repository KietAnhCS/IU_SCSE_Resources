var submitButton = document.getElementById('submit')

var nameField = document.getElementById('name')
var emailField = document.getElementById('email')
var usernameField = document.getElementById('username')
var pswField = document.getElementById('psw')
var repswField = document.getElementById('repsw')

var nameCheck = document.getElementById('nameCheck')
var emailCheck = document.getElementById('emailCheck')
var usernameCheck = document.getElementById('usernameCheck')
var pswCheck = document.getElementById('pswCheck')
var repswCheck = document.getElementById('repswCheck')

var nameCondition = false
var emailCondition = false
var usernameCondition = false 
var pswCondition = false
var repswCondition = false

const getCookie = (name) => {
    var re = new RegExp(name + "=([^;]+)");
    var value = re.exec(document.cookie);
    return (value != null) ? unescape(value[1]) : null;
}

nameField.value = getCookie("name")
emailField.value = getCookie("email")
usernameField.value = getCookie("username")
pswField.value = getCookie("password")
repswField.value = getCookie("password")

const focusOnLoaded = () => {
    nameField.focus()
}

const validateEmail = (email) => {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}

const checkName = () => {
    if (nameField.value.length === 0 ){
        nameCondition = false
        nameCheck.style.color = 'red'
        nameCheck.innerHTML = 'Required'
        
    } else {
        nameCondition = true
        nameCheck.style.color = 'green'
        nameCheck.innerHTML = 'PASS'
    }
    check()
}

const checkEmail = () => {
    if (validateEmail(emailField.value)){
        emailCondition = true
        emailCheck.style.color = 'green'
        emailCheck.innerHTML = 'PASS'
    } else {
        emailCondition = false
        emailCheck.style.color = 'red'
        emailCheck.innerHTML = 'Invalid'
    }
    check()
}

const checkUsername = () => {
    if (usernameField.value.length === 0 ){
        usernameCondition = false
        usernameCheck.style.color = 'red'
        usernameCheck.innerHTML = 'Required'
        
    } else {
        usernameCondition = true
        usernameCheck.style.color = 'green'
        usernameCheck.innerHTML = 'PASS'
    }
    check()
}

const checkPassword = () => {
    if (pswField.value.length === 0 ){
        pswCondition = false
        
        pswCheck.style.color = 'red'
        pswCheck.innerHTML = 'Required'
    } else {
        pswCondition = true
        pswCheck.style.color = 'green'
        pswCheck.innerHTML = 'PASS'
    }
    check()
}

const checkRePassword = () => {
    if (repswField.value.length > 0 && pswField.value === repswField.value){
        repswCondition = true
        repswCheck.style.color = 'green'
        repswCheck.innerHTML = 'PASS'
    } else {
        repswCondition = false
        repswCheck.style.color = 'red'
        repswCheck.innerHTML = 'Invalid'
    }
    check()
}

const check = () => {
    if (nameCondition  && emailCondition  && usernameCondition && pswCondition && repswCondition){
        submitButton.disabled = false
    } else {
        submitButton.disabled = true
    }
}

const onFormSubmit = () => {
    document.cookie = "name="+ escape(nameField.value) + "; path=/;"
    document.cookie = "email="+ escape(emailField.value) + "; path=/;"
    document.cookie = "username="+ escape(usernameField.value) + "; path=/;"
    document.cookie = "password="+ escape(pswField.value) + "; path=/;"
}



