$(document).on('turbolinks:load', function() {
    $('.ui.embed').embed({
        parameters: {
            autoplay: true,
            mute: true
        }
    });

    $('.game').hover(
        function() {
            $(this).find('.price-tag').addClass('blue');
        },
        function() {
            $(this).find('.price-tag').removeClass('blue');
        }
    );

    $('.ui.dropdown.switch').dropdown();

    $('#add-to-cart').on('click', function() {
        $(this).addClass('loading');
    });
});
