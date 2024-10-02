// MediaModel.js (Model)

class Song {
    constructor(id, title, artist, duration) {
        this.id = id;
        this.title = title;
        this.artist = artist;
        this.duration = duration; // duration in seconds
    }
}

class MediaModel {
    constructor() {
        this.currentSongIndex = 0;
        this.isPlaying = false;
        this.songs = [
            new Song(1, "Song A", "Artist A", 180),
            new Song(2, "Song B", "Artist B", 200),
            new Song(3, "Song C", "Artist C", 240)
        ];
    }

    getCurrentSong() {
        return this.songs[this.currentSongIndex];
    }

    play() {
        this.isPlaying = true;
    }

    pause() {
        this.isPlaying = false;
    }

    next() {
        if (this.currentSongIndex < this.songs.length - 1) {
            this.currentSongIndex++;
        } else {
            this.currentSongIndex = 0; // Loop back to the first song
        }
    }

    previous() {
        if (this.currentSongIndex > 0) {
            this.currentSongIndex--;
        } else {
            this.currentSongIndex = this.songs.length - 1; // Loop back to the last song
        }
    }

    isPlayingStatus() {
        return this.isPlaying;
    }
}
