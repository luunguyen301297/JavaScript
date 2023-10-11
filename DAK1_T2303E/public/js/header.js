$(function () {
  $(document).on("mousewheel", function () {
    if ($(this).scrollTop() < 1) {
      $(".nav").css("transform", "translateY(0%)");
    } else {
      $(".nav").css("transform", "translateY(-20.3%)");
    }
  });
  $(document).on("keydown", function () {
    if ($(this).scrollTop() < 1) {
      $(".nav").css("transform", "translateY(0%)");
    } else {
      $(".nav").css("transform", "translateY(-20.3%)");
    }
  });
  $(document).on("scroll", function () {
    if ($(this).scrollTop() < 1) {
      $(".nav").css("transform", "translateY(0%)");
    } else {
      $(".nav").css("transform", "translateY(-20.3%)");
    }
  });

  $("#myInput").bind("input", function () {
    var current = $("#myInput").val();
    var newData = current.replace("X", "");
    newData = newData.replace("x", ""); // small x if you want
    $("#myInput").val(newData);
  });
});

var dropdown = document.getElementsByClassName("dropdown-btn");
for (let i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function () {
    this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
}
