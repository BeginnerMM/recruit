
function register() {
    var nickName = $('#name').val();
    var mobile = $("#tel").val();
    var pass = $("#password").val();
    $.ajax({
        url: "/user/registerPost" + "?mobile=" + mobile + "&password=" + pass + "&nickName=" + nickName,
        type: "post",
        dataType: "json",
        success: function (output) {
            if (output == "1") {
                swal("注册成功", "注册成功", "success");
                setTimeout(function () {
                    window.location.href = "/user/login";
                }, 3000);

            } else {
                swal("注册失败", "注册失败", "error");
            }
        }
    });

}

function showPass() {
    console.log("change showing~");
    var pass_notshow = document.getElementById("password");
    if (show_flag == 0) {
        pass_notshow.type = 'text';
        show_flag = 1;
        document.getElementById("show_pass").src = "sign_up/img/openeye.jpg";
    } else {
        pass_notshow.type = 'password';
        show_flag = 0;
        document.getElementById("show_pass").src = "sign_up/img/closeeye.jpg";
    }
}

