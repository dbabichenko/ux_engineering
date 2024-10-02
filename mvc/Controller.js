// Controller.js (Controller)
class ShoppingCartController {
    constructor(cartModel, productModel, view) {
        this.cart = cartModel;
        this.products = productModel;
        this.view = view;
    }

    // Initialize the products and render them
    init() {
        const productData = [
            new Product(1, 'Laptop', 1000, 1),
            new Product(2, 'Phone', 500, 1),
            new Product(3, 'Headphones', 100, 1)
        ];

        this.view.renderProducts(productData, this);
    }

    // Handle adding a product to the cart
    handleAddToCart(product) {
        const cartProduct = this.cart.getCartProducts().find(p => p.id === product.id);

        if (cartProduct) {
            cartProduct.quantity += 1; // Increment quantity if already in the cart
        } else {
            this.cart.addProduct({...product}); // Add product if not in the cart
        }

        this.updateCartView();
    }

    // Update the view after modifying the cart
    updateCartView() {
        const total = this.cart.calculateTotal();
        const cartProducts = this.cart.getCartProducts();
        this.view.renderCart(cartProducts, total);
    }
}

// Instantiate Model, View, and Controller
const cart = new Cart();
const view = new CartView();
const controller = new ShoppingCartController(cart, Product, view);

// Initialize the application
controller.init();
