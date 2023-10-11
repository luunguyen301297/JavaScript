let input = document.getElementById('input');
let number = document.querySelectorAll('.numbers div');
let operator = document.querySelectorAll('.operators div');
let result = document.getElementById('result');
let clear = document.getElementById('clear');
let resultDisplayed = false;

for (let i = 0; i < number.length; i++) {
  number[i].addEventListener("click", (e) => {
    let currentString = input.innerHTML;
    let lastChar = currentString[currentString.length - 1];

    if (resultDisplayed === false) {
      input.innerHTML += e.target.innerHTML;
    } else if (resultDisplayed === true && lastChar === "+" || lastChar === "-" || lastChar === "x" || lastChar === ":") {
      resultDisplayed = false;
      input.innerHTML += e.target.innerHTML;
    } else {
      resultDisplayed = false;
      input.innerHTML = "";
      input.innerHTML += e.target.innerHTML;
    };
  });
};

for (let i = 0; i < operator.length; i++) {
  operator[i].addEventListener("click", (e) => {
    let currentString = input.innerHTML;
    let lastChar = currentString[currentString.length - 1];

    if (lastChar === "+" || lastChar === "-" || lastChar === "x" || lastChar === ":") {
      let newString = currentString.substring(0, currentString.length - 1) + e.target.innerHTML;
      input.innerHTML = newString;
    } else if (currentString.length == 0) {
      console.log("enter a number first");
    } else {
      input.innerHTML += e.target.innerHTML;
    };
  });
};+

result.addEventListener("click", () => {
  let inputString = input.innerHTML;
  let numbers = inputString.split(/\+|\-|\x|\:/g);
  let operators = inputString.replace(/[0-9]|\./g, "").split("");

  let add = operators.indexOf("+")
  while (add != -1) {
    numbers.splice(add, 2, parseFloat(number[add]) +parseFloat(numbers[add +1]));
    operators.splice(add, 1);
    add = operators.indexOf("+");
  };

  let subtract = operators.indexOf("-");
  while (subtract != -1) {
    numbers.splice(subtract, 2, numbers[subtract] - numbers[subtract + 1]);
    operators.splice(subtract, 1);
    subtract = operators.indexOf("-");
  };

  let multiply = operators.indexOf("x");
  while (multiply != -1) {
    numbers.splice(multiply, 2, numbers[multiply] * numbers[multiply + 1]);
    operators.splice(multiply, 1);
    multiply = operators.indexOf("x");
  };

  let divide = operators.indexOf(":");
  while (divide != -1) {
    numbers.splice(divide, 2, numbers[divide] / numbers[divide + 1]);
    operators.splice(divide, 1);
    divide = operators.indexOf(":");
  };

  input.innerHTML = numbers[0];
  resultDisplayed = true;
});

clear.addEventListener("click", () => {
  input.innerHTML = "";
});
