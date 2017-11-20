$(document).on('turbolinks:load', function() {
    $('a.cart.button').on('click', function() {
        $(this).addClass('loading');
    });
});
