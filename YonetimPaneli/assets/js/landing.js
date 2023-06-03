//Onex 2 Landing Page Scripts

function Login() {
    $.ajax({
        url: 'fn_login.asp?username=' + $('#username').val() + '&password=' + $('#password').val(),
        success: function (data) {
            if (data == "0") {
                $('#MainForm').animate({
                    'margin-top': '40px'
                }, 500, function () {
                    // Animation complete.
                });
                $('.formvalidate').show();
            }

		  else
		  {window.location='main.asp';}
        }
    });
}