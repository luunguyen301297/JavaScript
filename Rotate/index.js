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

function spin() {
  wheel.play();
  let box = document.getElementById("box");
  let element = document.getElementById("mainbox");
  let selectedItem = "";

  let AC = shuffle([1890, 2250, 2160]);
  let Camera = shuffle([1850, 2210, 2570]);
  let Zonk = shuffle([1770, 2130, 2490]);
  let PS = shuffle([1810, 2170, 2530]);
  let Headset = shuffle([1750, 2110, 2470]);
  let Drone = shuffle([1630, 1990, 2530]);
  let ROG = shuffle([1570, 1930, 2290]);

  let results = shuffle([AC[0], Camera[0], Zonk[0], PS[0], Headset[0], Drone[0], ROG[0]]);

  if (AC.includes(results[0])) {
    selectedItem = "AC";
  }

  if (Camera.includes(results[0])) {
    selectedItem = "Camera";
  }

  if (Zonk.includes(results[0])) {
    selectedItem = "Zonk";
  }

  if (PS.includes(results[0])) {
    selectedItem = "PS";
  }

  if (Headset.includes(results[0])) {
    selectedItem = "Headset";
  }

  if (Drone.includes(results[0])) {
    selectedItem = "Drone";
  }

  if (ROG.includes(results[0])) {
    selectedItem = "ROG";
  }

  box.style.setProperty("transition", "all ease 5s");
  box.style.transform = "rotate(" + results[0] + "deg)";
  element.classList.remove("animate");

  setTimeout(function () {
    element.classList.add("animate");
  }, 100);

  setTimeout(function () {
    win.play();
    Swal.fire({
      title: "Sweet!",
      html: "You Won " + selectedItem + " | " + '<a href="#">Claim</a>',
      imageUrl: "https://unsplash.it/400/200",
      imageWidth: 400,
      imageHeight: 200,
      imageAlt: "Custom image",
    });
  }, 110);

  setTimeout(function () {
    box.style.setProperty("transition", "initial");
    box.style.transform = "rotate(90deg)";
  }, 120);
}
