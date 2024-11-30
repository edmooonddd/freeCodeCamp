const checkButton = document.getElementById("check-btn");
const clearButton = document.getElementById("clear-btn");
const result = document.getElementById("results-div");

function validatePhoneNumber() {
    const userInput = document.getElementById("user-input").value;
    const regex = /^(1\s?)?(\(\d{3}\)|\d{3})[- ]?\d{3}[- ]?\d{4}$/;
    const regexResult = regex.test(userInput);
    
    if(!userInput) {
        alert("Please provide a phone number")
    }

    if (regexResult) {
        result.innerText = `Valid US number: ${userInput}`;
        result.className = "valid";
        return
    } else {
        result.innerText = `Invalid US number: ${userInput}`;
        result.className = "invalid";
        return
    }
}

function clearInput() {
    document.getElementById("user-input").value = "";
    result.innerText = "";
    result.className = "";
}

checkButton.addEventListener("click", validatePhoneNumber); 
clearButton.addEventListener("click", clearInput);