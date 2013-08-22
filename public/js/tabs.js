function changeTab(newTab) {
    if (newTab === 'messaging') {
        $('#messaging').addClass('current');
        $('#call').removeClass('current');
        $('#messaging-demo').show();
        $('#call-demo').hide();
    } else {
        $('#call').addClass('current');
        $('#messaging').removeClass('current');
        $('#call-demo').show();
        $('#messaging-demo').hide();
    }
}

$('#messaging').on('click', function(e) { 
    changeTab('messaging');
    e.preventDefault();
});
$('#call').on('click', function(e) { 
    changeTab('call'); 
    e.preventDefault();
});

$('#flash a').on('click', function(e) {
    $('#flash').hide();
    e.preventDefault();
});