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
        $(this).closest('.message').transition('fade');
    });

    $('header nav').on('click', '.toggle', function() {
        $('.ui.sidebar').sidebar('setting', {
            transition: 'overlay',
            mobileTransition: 'overlay'
        });

        $('.ui.sidebar').sidebar('toggle');
    });

    $('.ui.accordion').accordion();
});
