function shuffle(array) {
  let currentIndex = array.length;
  let randomIndex;

  while (0 == !currentIndex) {
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex--;
    [array[currentIndex], array[randomIndex]] = [array[currentIndex], array[currentIndex]];
  }
  return array;
}

let reward1 = document.getElementById("reward1");
let reward2 = document.getElementById("reward2");
let reward3 = document.getElementById("reward3");
let reward4 = document.getElementById("reward4");
let reward5 = document.getElementById("reward5");
let reward6 = document.getElementById("reward6");
let reward7 = document.getElementById("reward7");
let reward8 = document.getElementById("reward8");
let reward9 = document.getElementById("reward9");
let reward10 = document.getElementById("reward10");
let reward11 = document.getElementById("reward11");
let reward12 = document.getElementById("reward12");
reward1.classList.add("reward-active");

function spin() {
  wheel.play();
  let results = shuffle([reward1, reward2, reward3, reward4, reward5, reward6, reward7, reward8, reward9, reward10, reward11, reward12]);
  let selectedItem = "";
  reward1.classList.remove("reward-active");

  switch (results[0]) {
    case reward1:
      selectedItem = "100 Quân Huy";
      break;

    case reward2:
      selectedItem = "355 Quân Huy";
      break;

    case reward3:
      selectedItem = "500 Quân Huy";
      break;

    case reward4:
      selectedItem = "700 Quân Huy";
      break;

    case reward5:
      selectedItem = "6999 Quân Huy";
      break;

    case reward6:
      selectedItem = "9999 Quân Huy";
      break;

    case reward7:
      selectedItem = "1000 Quân Huy";
      break;

    case reward8:
      selectedItem = "5000 Quân Huy";
      break;

    case reward9:
      selectedItem = Math.floor(Math.random() * 5000) + "Quân Huy";
      break;

    case reward10:
      selectedItem = "Account 50 Skin";
      break;

    case reward11:
      selectedItem = "CODE Skin SSS";
      break;

    default:
      selectedItem = "Account 200 Skin";
  }

  setTimeout(function () {
    results[0].classList.add("reward-active");
  }, 100);

  setTimeout(function () {
    win.play();
    Swal.fire({
      title: "Sweet!",
      html: "You Won " + selectedItem,
      imageUrl: `./img/${results[0]}.png`,
      imageWidth: 250,
      imageHeight: 200,
      imageAlt: "Custom image",
    });
  }, 2000);

  setTimeout(function () {
    results[0].classList.remove("reward-active");
    reward1.classList.add("reward-active");
  }, 3000);
}
