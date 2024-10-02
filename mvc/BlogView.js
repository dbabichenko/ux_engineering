// BlogView.js (View)
class BlogView {
    constructor() {
        this.postListElement = document.getElementById('postList');
        this.postTitleInput = document.getElementById('postTitle');
        this.postContentInput = document.getElementById('postContent');
        this.postAuthorSelect = document.getElementById('postAuthor');
        this.createPostButton = document.getElementById('createPostBtn');
    }

    // Render available authors in the author select dropdown
    renderAuthors(authors) {
        this.postAuthorSelect.innerHTML = '';
        authors.forEach(author => {
            const option = document.createElement('option');
            option.value = author.id;
            option.textContent = author.name;
            this.postAuthorSelect.appendChild(option);
        });
    }

    // Render blog posts and their comments
    renderPosts(posts, controller) {
        this.postListElement.innerHTML = '';
        posts.forEach(post => {
            const postItem = document.createElement('li');
            postItem.innerHTML = `
                <h3>${post.title}</h3>
                <p>${post.content}</p>
                <small>By: ${post.author.name}</small>
                <ul>${post.comments.map(comment => `<li>${comment.content} - <small>by ${comment.author.name}</small></li>`).join('')}</ul>
                <textarea placeholder="Add a comment" id="commentContent-${post.id}"></textarea>
                <button onclick="controller.handleAddComment(${post.id})">Add Comment</button>
            `;
            this.postListElement.appendChild(postItem);
        });
    }
}
