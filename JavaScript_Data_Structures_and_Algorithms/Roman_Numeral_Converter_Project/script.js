const convertButton = document.getElementById("convert-btn");
const output = document.getElementById("output");

function romanNumeralConverter() {
    let inputNumber = parseInt(document.getElementById("number").value, 10 ); 

    if (isNaN(inputNumber)) {
         output.innerText = "Please enter a valid number";
         output.className = "error"
        return;
    } else if (inputNumber <= 0) {
        output.innerText = "Please enter a number greater than or equal to 1";
        output.className = "error"
        return;
    } else if (inputNumber >= 4000) {
        output.innerText = "Please enter a number less than or equal to 3999";
        output.className = "error"
        return
    }

    let romanOutput = "";

    const romanArray = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];
    const arabicArray = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];

    for (let i = 0; i < arabicArray.length; i++) {
        while (arabicArray[i] <= inputNumber) {
          inputNumber -= arabicArray[i];
          romanOutput += romanArray[i];
      }
    }
    output.innerHTML = romanOutput;
    output.className = "valid"
}

convertButton.addEventListener("click", romanNumeralConverter);