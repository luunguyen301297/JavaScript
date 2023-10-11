$(document).ready(function () {

  $('.nav_item_1').on("click", function () {
    $('.nav_item_1').addClass('nav_active nav_item_1');
    $('.nav_item_2, .nav_item_3').removeClass('nav_active nav_pro_items');

    $('.content_1').addClass('content_show').removeClass('content_hidden');
    $('.content_2, .content_3').addClass('content_hidden').removeClass('content_show');
  });

  $('.nav_item_2').on("click", function () {
    $('.nav_item_2').addClass('nav_active nav_item_2');
    $('.nav_item_1, .nav_item_3').removeClass('nav_active nav_pro_items');

    $('.content_2').addClass('content_show').removeClass('content_hidden');
    $('.content_1, .content_3').addClass('content_hidden').removeClass('content_show');
  });

  $('.nav_item_3').on("click", function () {
    $('.nav_item_3').addClass('nav_active nav_item_3');
    $('.nav_item_1, .nav_item_2').removeClass('nav_active nav_pro_items');

    $('.content_3').addClass('content_show').removeClass('content_hidden');
    $('.content_1, .content_2').addClass('content_hidden').removeClass('content_show');
  });

  $('#button_submit').prop('disabled', true);
  $('input[name=check_agree]').click(() => {
    $('#button_submit').prop('disabled', !$("input[name=check_agree]").prop("checked"));
  });

  $(".form_content").validate({
    onfocusout: false,
    onkeyup: false,
    onclick: false,
    rules: {
      "userName": {
        required: true
      },
      "userPhoneNumber": {
        required: true,
        maxlength: 15
      },
      "userEmail": {
        required: true,
      },
      "userAddress": {
        required: true,
      }
    },
    messages: {
      "userName": {
        required: "Bắt buộc nhập họ và tên"
      },
      "userPhoneNumber": {
        required: "Bắt buộc nhập số điện thoại",
        minlength: "Vui lòng nhập số điện thoại hợp lệ"
      },
      "userEmail": {
        required: "Vui lòng nhập email"
      },
      "userAddress": {
        required: "Vui lòng nhập địa chỉ"
      }
    }
  });

  $('#button_submit').on('click', function (event) {
    event.preventDefault();
    $(".form_content").valid();
    let name = $('#name');
    let phoneNumber = $('#phoneNumber');
    let email = $('#email');
    let address = $('#address');
    let req = new XMLHttpRequest();

    req.open('POST', '/dang-ky');
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.send('userName=' + name.val() + '&userPhoneNumber=' + phoneNumber.val() + '&userEmail=' + email.val() + '&userAddress=' + address.val());

    req.onreadystatechange = () => {
      if (req.readyState == 4 && req.status == 200 && $(".form_content").valid()) {
        $("#message").text(req.responseText);
        $(".alert_message").show();
        name.val('');
        phoneNumber.val('');
        email.val('');
        address.val('');
      }
    };
  });

  $('input').on('input', () => {
    $('input').css('color', 'black').removeClass('error');
    $('.error').css('display', 'none');
  });

});
