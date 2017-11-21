$(document).on('turbolinks:load', function() {
    $('nav .dropdown').dropdown({
        on: 'hover'
    });

    $('nav .ui.item').on('click', function() {
       $('nav .ui.item').removeClass('active');
       $(this).addClass('active');
    }); 
});
