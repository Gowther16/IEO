document.addEventListener("DOMContentLoaded", function() {
    const audioPlayer = document.getElementById("audioPlayer");
    const currentTime = document.getElementById("currentTime");
    const duration = document.getElementById("duration");
    const progressBar = document.getElementById("progressBar");

    audioPlayer.addEventListener("loadedmetadata", function() {
        const totalDuration = formatTime(audioPlayer.duration);
        duration.textContent = totalDuration;
    });

    audioPlayer.addEventListener("timeupdate", function() {
        const currentTimeFormatted = formatTime(audioPlayer.currentTime);
        currentTime.textContent = currentTimeFormatted;

        const progress = (audioPlayer.currentTime / audioPlayer.duration) * 100;
        progressBar.value = progress;
    });

    progressBar.addEventListener("input", function() {
        const seekTime = (progressBar.value / 100) * audioPlayer.duration;
        audioPlayer.currentTime = seekTime;
    });

    function formatTime(time) {
        const minutes = Math.floor(time / 60);
        const seconds = Math.floor(time % 60);
        return `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
    }
});