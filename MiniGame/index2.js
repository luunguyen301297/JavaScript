let items = document.getElementsByClassName("item");
let rewards = ["100 Quân Huy", "355 Quân Huy", "500 Quân Huy", "700 Quân Huy", "6999 Quân Huy", "9999 Quân Huy", "1000 Quân Huy", "5000 Quân Huy", Math.floor(Math.random() * 5000) + " Quân Huy", "Account 50 Skin", "CODE Skin SSS", "Account 200 Skin"];
let selectedItem = "";

items[0].classList.add("reward-active");

function spin() {
  wheel.play();
  let reward_varible = (Math.random() * 100).toFixed();
  console.log("Biến chạy: " + reward_varible);

  let y = 0,
    i = 0;
  for (; i < reward_varible; i++) {
    setTimeout(function () {
      if (y == 0) {
        items[y].classList.add("reward-active");
        items[items.length - 1].classList.remove("reward-active");
        y++;
      } else if (y == items.length) {
        items[y - 1].classList.remove("reward-active");
        y = 0;
        items[y].classList.add("reward-active");
      } else {
        items[y].classList.add("reward-active");
        items[y - 1].classList.remove("reward-active");
        y++;
      }
    }, i * 100);
  }

  let promise = new Promise(function (resolve, reject) {
    setTimeout(() => {
      if (i == reward_varible) {
        y--;
        resolve(y);
      }
    }, reward_varible * 100);
  });

  promise
    .then(function (y) {
      console.log(y);
      rewards.forEach((element, p) => {
        switch (y) {
          case p:
            selectedItem = element;
            break;
        }
      });
      console.log(selectedItem);
    })
    .catch(function () {
      console.log("Error!");
    })
    .finally(function () {
      console.log("Finally!");
    });
}
