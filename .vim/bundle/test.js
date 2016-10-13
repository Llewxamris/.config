
function test() {
    console.log("Test")
}

$.$.ajax({
    url: 'mydomain.com/url',
    type: 'POST',
    dataType: 'xml/html/script/json',
    data: $.param( $('Element or Expression') ),
    complete: function (jqXHR, textStatus) {
        // callback
    },
    success: function (data, textStatus, jqXHR) {
        // success callback
    },
    error: function (jqXHR, textStatus, errorThrown) {
        // error callback
    }
});

fs = require
