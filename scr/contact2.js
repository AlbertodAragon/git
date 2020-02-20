$(document).ready(function () {


    $("#contactform2 div ul li input").keypress(function () {
        var aaa = $(this).val();
        var bbb = aaa.length;

        //alert(aaa + ' -- ' + bbb);
        if (bbb > 0) {
            if (!$(this).parent().hasClass('filled')) {
                $(this).parent().attr('class', $(this).parent().attr('class') + ' filled');
            }
        }
        else {
            $(this).parent().attr('class', $(this).parent().attr('class'));
        }

    });

    $("#contactform2 div ul li textarea").keypress(function () {
        var aaa = $(this).val();
        var bbb = aaa.length;
        // alert(aaa + ' -- ' + bbb);
        if (bbb > 0) {
            $(this).parent().attr('class', $(this).parent().attr('class') + ' filled');
        }
        else {
            $(this).parent().attr('class', $(this).parent().attr('class'));
        }
    });


    PreFilledLogin2();

    $("#faditional").click(function (event) {
        var prevval = $('#faditionallabel').val();

        if (prevval == "yes") {
            $('#faditional').attr('src', '/gfx/checkboxno.jpg');
            $('#faditionallabel').val("no");
            $('.numberguest').attr('style', 'visibility:hidden')
            
        }
        else {
            $('#faditional').attr('src', '/gfx/checkboxyes.jpg');
            $('#faditionallabel').val("yes");
            $('.numberguest').attr('style', 'visibility:visible')
        }
    });

});

function SubmitEvent() {

    $("#titleform2").fadeOut();

    var isOK, postData = 'fsubject=Contact';

    var isOK = CheckRequired('contactform2', '');

   /* if ($('#fenquiry-source').val() == "" && isOK == '') {
        alert("Please say How Did You Hear About Lyons Place? Thank you");
        $('#fenquiry-source').attr("style", "border-bottom: 1px solid red;")
        $('#fenquiry-source').focus();
        isOK = "no";
    }
    else {
        if ($('#inputcheckterms').val() != "yes") {
            alert("Please agree to our Terms and Conditions.");
            isOK = "no";
        }
    }*/


    if (isOK == '') {
        $("#submitforevent").prop('onclick', null).off('click');

        $('#titleform2 #outcomemsg').html('<img src="/gfx/ajax-loader.gif" alt="processing .."/>');
        $('#contactform2 #outcomemsg').show();

        $('#contactform2 *').filter(':input').each(function () {
            fieldID = $(this).attr('id');

            if (fieldID != null && fieldID != '' && ($(this).attr('class') != "interestedhidden")) {
                postData += "&" + fieldID + "=" + $(this).val();
            }

        });

        postData += '&gGuest=';

        if ($('#faditionallabel').val() == "yes") {
                postData += "Yes"
        } else {
            postData += "No"
        }

        var thename = $("#ffirst-name").val() + ' ' + $("#flast-name").val();
  
        /* alert(postData);*/

        $.ajax({
            type: 'POST',
            url: '/ProcessForm2.aspx',
            data: postData,
            error: function (msg) {
                $("#submitforevent").click(function (event) {
                   // alert("entra");
                    event.preventDefault();
                });
                $('#contactform2 #outcomemsg').html('Sorry not able to send your register request at present, please try again later.');
            },
            success: function (msg) {
                if (msg == 'OK') {
                    $('#contactform2 #outcomemsg').html('');
                    $('#contactform2').html('<div id="thankyoumsg"><h1>Thank you<br/>' + thename + '</h1><br/></div>');
                }
                else {
                    $("#submitforevent").click(function (event) {
                        event.preventDefault();
                    });
                    $('#outcomemsg').html('Sorry not able to send your register request at present, please try again later.');
                }
            }
        });
    }
    else {
        $('#contactform2 #outcomemsg').html("Please specify " + isOK + ".");
        $('#contactform2 #outcomemsg').show();
        /*return false;*/
    }
}



function PreFilledLogin2() {
    $("#contactform2 div ul li input").change(function () {
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

    $("#contactform2 div ul li select").each(function () {
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
