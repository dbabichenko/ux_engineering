// MediaView.js (View)
class MediaView {
    constructor() {
        this.songTitleElement = document.getElementById('songTitle');
        this.songArtistElement = document.getElementById('songArtist');
        this.songDurationElement = document.getElementById('songDuration');
        this.playPauseButton = document.getElementById('playPauseBtn');
        this.prevButton = document.getElementById('prevBtn');
        this.nextButton = document.getElementById('nextBtn');
    }

    // Render the current song details
    renderSongDetails(song) {
        this.songTitleElement.textContent = song.title;
        this.songArtistElement.textContent = `Artist: ${song.artist}`;
        this.songDurationElement.textContent = `Duration: ${Math.floor(song.duration / 60)}:${song.duration % 60}`;
    }

    // Update the Play/Pause button text
    updatePlayPauseButton(isPlaying) {
        this.playPauseButton.textContent = isPlaying ? 'Pause' : 'Play';
    }

    // Attach event listeners to the buttons
    bindPlayPause(handler) {
        this.playPauseButton.addEventListener('click', handler);
    }

    bindNext(handler) {
        this.nextButton.addEventListener('click', handler);
    }

    bindPrevious(handler) {
        this.prevButton.addEventListener('click', handler);
    }
}
