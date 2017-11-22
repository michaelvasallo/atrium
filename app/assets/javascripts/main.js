$(document).on('turbolinks:load', function() {
    $('nav .ui.dropdown').dropdown({
        on: 'hover'
    });

    $('select.dropdown').dropdown();

    $('nav .ui.item').on('click', function() {
       $('nav .ui.item').removeClass('active');
       $(this).addClass('active');
    });

    $('.message').on('click', '.close', function() {
        $(this).closest('.message').transition('fade')
    })
});
