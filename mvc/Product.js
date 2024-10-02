// Product.js (Model)
class Product {
    constructor(id, name, price, quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }
}

// Cart Model to hold products
class Cart {
    constructor() {
        this.products = [];
    }

    addProduct(product) {
        this.products.push(product);
    }

    removeProduct(productId) {
        this.products = this.products.filter(p => p.id !== productId);
    }

    calculateTotal() {
        return this.products.reduce((total, product) => {
            return total + (product.price * product.quantity);
        }, 0);
    }

    getCartProducts() {
        return this.products;
    }
}
