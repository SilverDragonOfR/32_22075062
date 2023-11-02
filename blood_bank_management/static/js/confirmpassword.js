var doesSignupWorks = false
passwordInput = document.querySelector("#password")
repasswordInput = document.querySelector("#repassword")
passwordHint = document.querySelector("#password-hint")
postButton = document.querySelector("#post-button")
passwordHint.style.color = "red"
postButton.disabled = true

passwordInput.addEventListener("keyup", () => {
    if(passwordInput.value=="" && repasswordInput.value=="") {
        passwordHint.textContent = "... Password is empty"
        passwordHint.style.color = "red"
        postButton.disabled = true
    } else {
        if ( passwordInput.value == repasswordInput.value ) {
            passwordHint.textContent = "... Password match"
            passwordHint.style.color = "green"
            postButton.disabled = false
        } else {
            passwordHint.textContent = "... Passwords do not match"
            passwordHint.style.color = "red"
            postButton.disabled = true
        }
    }
})

repasswordInput.addEventListener("keyup", () => {
    if(passwordInput.value=="" && repasswordInput.value=="") {
        passwordHint.textContent = "... Password is empty"
        passwordHint.style.color = "red"
        postButton.disabled = true
    } else {
        if ( passwordInput.value == repasswordInput.value ) {
            passwordHint.textContent = "... Password match"
            passwordHint.style.color = "green"
            postButton.disabled = false
        } else {
            passwordHint.textContent = "... Passwords do not match"
            passwordHint.style.color = "red"
            postButton.disabled = true
        }
    }
})