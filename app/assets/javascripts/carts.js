$(document).on('turbolinks:load', function() {
    $('main').on('click', 'a.cart.button', function() {
        $(this).addClass('loading');
    });
});
