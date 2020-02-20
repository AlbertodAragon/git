$(document).ready(function () {
    $("#contactform > input").keypress(function () {
        var aaa = $(this).val();
        var bbb = aaa.length;


        //alert(aaa + ' -- ' + bbb);
        if (bbb > 0) {
            $(this).parent().attr('class', $(this).parent().attr('class') + ' filled');
        }
        else {
            $(this).parent().attr('class', $(this).parent().attr('class'));
        }
    });

    PreFilledLogin();
});

function PreFilledLogin() {
    $("#contactform > input").each(function () {
        var aaa = $(this).val();
        var bbb = aaa.length;


        //alert(aaa + ' -- ' + bbb);
        if (bbb > 0) {
            $(this).parent().attr('class', $(this).parent().attr('class') + ' filled');
        }
        else {
            $(this).parent().attr('class', $(this).parent().attr('class'));
        }
    });
}

//Cookies policy Master page
			if (Session["lpcookie"] == null)
			{
				Session["lpcookie"] = 1;
				cookiepolicyagreediv.Visible = true;
			}
			else
			{
				cookiepolicyagreediv.Visible = false;
			}
			
	// Master Page		
			<div id="cookiepolicyagreediv" runat="server">
        <p>By using this website you agree to our use of cookies. View <a href="javascript:OpenFooter('privacy');">Privacy Policy</a></p>
        <a class="linkcookie" href="javascript:closecookies();">Accept</a>
    </div> 