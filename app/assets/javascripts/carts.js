$(document).on('turbolinks:load', function() {
    $('form.cart button').on('click', function() {
        $(this).addClass('loading');
    });
});
