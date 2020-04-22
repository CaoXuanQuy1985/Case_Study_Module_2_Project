let locUsername = document.getElementById("usrInput");
let locFeedbackUsername = document.getElementById("feedbackUsername");

let locPassword = document.getElementById("pwd");
let locFeedbackPassword = document.getElementById("feedbackPassword");

let locRegisterBtn2 = document.getElementById("registerBtn2");
let locPassword2 = document.getElementById("pwd2");
let locFeedbackPassword2 = document.getElementById("feedbackPassword2");

function checkUsername(event) {
    let username = locUsername.value;
    let result = username.match(/[a-zA-Z0-9_ ]/g);
    if (username.length < 5 || result == null) {
        locFeedbackUsername.className = "feedback";
        locFeedbackUsername.textContent = "Chiều dài username quá ngắn hoặc chứa kí tự đặc biệt !!!";
        event.preventDefault();
    } else {
        locFeedbackUsername.textContent = "";
    }
}

function tipUsername() {
    locFeedbackUsername.className = "tip";
    locFeedbackUsername.textContent = "Chiều dài username phải có ít nhất 5 kí tự và không chứa các kí tự đặc biệt";
}

function checkPassword(event) {
    let password = locPassword.value;
    let result = password.match(/[a-zA-Z0-9_ ]/g);
    if (password.length < 5 || result == null) {
        locFeedbackPassword.className = "feedback";
        locFeedbackPassword.textContent = "Chiều dài password quá ngắn hoặc chứa kí tự đặc biệt !!!";
        event.preventDefault();
    } else {
        locFeedbackPassword.textContent = "";
    }
}

function checkRePassword(event) {
    let password = locPassword.value;
    let password2 = locPassword2.value;

    if (password !== password2) {
        locFeedbackPassword2.className = "feedback";
        locFeedbackPassword2.textContent = "2 mẫu password không giống nhau, hãy nhập lại !!!";
        event.preventDefault();
    } else {
        locFeedbackPassword2.textContent = "";
    }
}

function tipPassword() {
    locFeedbackPassword.className = "tip";
    locFeedbackPassword.textContent = "Password phải có ít nhất 5 kí tự và không chứa các kí tự đặc biệt";
}

tipUsername();
tipPassword();

locRegisterBtn2.addEventListener("click", function(event){
    checkUsername(event);
    checkPassword(event);
    checkRePassword(event);
}, false);
