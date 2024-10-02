// Presenter.js (Presenter)
class MediaPresenter {
    constructor(mediaModel, mediaView) {
        this.mediaModel = mediaModel;
        this.mediaView = mediaView;

        // Initialize view with the first song
        this.updateView();

        // Bind buttons to presenter methods
        this.mediaView.bindPlayPause(this.handlePlayPause.bind(this));
        this.mediaView.bindNext(this.handleNext.bind(this));
        this.mediaView.bindPrevious(this.handlePrevious.bind(this));
    }

    // Update the view with the current song details and play/pause status
    updateView() {
        const currentSong = this.mediaModel.getCurrentSong();
        this.mediaView.renderSongDetails(currentSong);
        this.mediaView.updatePlayPauseButton(this.mediaModel.isPlayingStatus());
    }

    // Handle Play/Pause button click
    handlePlayPause() {
        if (this.mediaModel.isPlayingStatus()) {
            this.mediaModel.pause();
        } else {
            this.mediaModel.play();
        }
        this.updateView(); // Update the play/pause button in the view
    }

    // Handle Next button click
    handleNext() {
        this.mediaModel.next();
        this.updateView(); // Update the song details in the view
    }

    // Handle Previous button click
    handlePrevious() {
        this.mediaModel.previous();
        this.updateView(); // Update the song details in the view
    }
}

// Instantiate the Model, View, and Presenter
const mediaModel = new MediaModel();
const mediaView = new MediaView();
const mediaPresenter = new MediaPresenter(mediaModel, mediaView);
