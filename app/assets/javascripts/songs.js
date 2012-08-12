$('.mozer-play').click(function() {
    var audioId = $(this).data("song-id");
    var audioElement = document.getElementById(audioId);
    
    audioElement.play();
    $(this).addClass('hide');
    $(this).parent().find('.mozer-pause').removeClass('hide');
});
$('.mozer-pause').click(function() {
    var audioId = $(this).data("song-id");
    var audioElement = document.getElementById(audioId);
    
    audioElement.pause();
    $(this).addClass('hide');
    $(this).parent().find('.mozer-play').removeClass('hide');
});