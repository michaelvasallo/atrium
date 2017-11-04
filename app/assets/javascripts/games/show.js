$(document).on('turbolinks:load', function(){
    $('.ui.embed').embed({
        parameters: {
            autoplay: true,
            mute: true
        }
    });
})
