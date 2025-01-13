const result = document.getElementById("result");

function palindromeCheck() {
    const userInput = document.getElementById("text-input").value;
    const cleanInput = userInput.toLowerCase().replace(/[^A-Za-z0-9]/g, "");
    const reverseInput = cleanInput.split("").reverse().join("");

    if (!userInput) {
        alert("Please input a value")
    }

    if (cleanInput === reverseInput) {
        return result.innerText = `${userInput} is a palindrome`;
    }else {
        return result.innerText = `${userInput} is not a palindrome`;
    }
}