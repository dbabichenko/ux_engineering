// Blog.js (Model)

class Author {
    constructor(id, name) {
        this.id = id;
        this.name = name;
    }
}

class Post {
    constructor(id, title, content, author) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.author = author;
        this.comments = [];
    }

    addComment(comment) {
        this.comments.push(comment);
    }
}

class Comment {
    constructor(id, postId, content, author) {
        this.id = id;
        this.postId = postId;
        this.content = content;
        this.author = author;
    }
}

class BlogModel {
    constructor() {
        this.posts = [];
        this.authors = [];
    }

    addAuthor(author) {
        this.authors.push(author);
    }

    getAuthors() {
        return this.authors;
    }

    addPost(post) {
        this.posts.push(post);
    }

    getPosts() {
        return this.posts;
    }

    getPostById(postId) {
        return this.posts.find(post => post.id === postId);
    }

    addCommentToPost(postId, comment) {
        const post = this.getPostById(postId);
        if (post) {
            post.addComment(comment);
        }
    }
}
