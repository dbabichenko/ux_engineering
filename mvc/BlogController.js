// BlogController.js (Controller)
class BlogController {
    constructor(blogModel, blogView) {
        this.blogModel = blogModel;
        this.blogView = blogView;

        // Bind view button to controller action
        this.blogView.createPostButton.addEventListener('click', () => this.handleCreatePost());

        // Initialize with some authors
        this.initAuthors();
        this.updateView();
    }

    // Initialize default authors
    initAuthors() {
        const authors = [
            new Author(1, 'John Doe'),
            new Author(2, 'Jane Smith')
        ];
        authors.forEach(author => this.blogModel.addAuthor(author));

        // Update the author select dropdown in the view
        this.blogView.renderAuthors(this.blogModel.getAuthors());
    }

    // Handle creating a new post
    handleCreatePost() {
        const title = this.blogView.postTitleInput.value;
        const content = this.blogView.postContentInput.value;
        const authorId = parseInt(this.blogView.postAuthorSelect.value);

        const author = this.blogModel.getAuthors().find(a => a.id === authorId);
        const newPost = new Post(Date.now(), title, content, author);

        this.blogModel.addPost(newPost);
        this.updateView();
    }

    // Handle adding a comment to a post
    handleAddComment(postId) {
        const commentContent = document.getElementById(`commentContent-${postId}`).value;
        const author = this.blogModel.getAuthors()[0]; // Assuming the first author adds comments for simplicity

        const newComment = new Comment(Date.now(), postId, commentContent, author);
        this.blogModel.addCommentToPost(postId, newComment);
        this.updateView();
    }

    // Update the view to reflect the current state of the blog
    updateView() {
        this.blogView.renderPosts(this.blogModel.getPosts(), this);
    }
}

// Instantiate Model, View, and Controller
const blogModel = new BlogModel();
const blogView = new BlogView();
const blogController = new BlogController(blogModel, blogView);
