$(document).on('turbolinks:load', function() {
    $('main').on('click', 'a.checkout.button', function() {
        $(this).addClass('loading');
    });
});
