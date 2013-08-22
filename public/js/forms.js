function showFlash(message) {
    $('#flash span').html(message);
    $('#flash').show();
}

// TODO: Lot of duplication here, need to tighten this up.

$('#message-form').on('submit', function(e) {
    e.preventDefault();
    $.ajax('/message', {
        method:'POST',
        dataType:'text',
        data:{
            to:$('#messageTo').val()
        },
        success: function(data) {
            showFlash(data);
        },
        error: function(jqxhr) {
            alert('There was an error sending a request to the server :(');
        }
    })
});

$('#call-form').on('submit', function(e) {
    e.preventDefault();
    $.ajax('/call', {
        method:'POST',
        dataType:'text',
        data:{
            to:$('#callTo').val()
        },
        success: function(data) {
            showFlash(data);
        },
        error: function(jqxhr) {
            alert('There was an error sending a request to the server :(');
        }
    })
});