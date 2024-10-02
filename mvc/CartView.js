// CartView.js (View)
class CartView {
    constructor() {
        this.productListElement = document.getElementById('productList');
        this.cartListElement = document.getElementById('cartList');
        this.cartTotalElement = document.getElementById('cartTotal');
    }

    // Render the available products
    renderProducts(products, controller) {
        this.productListElement.innerHTML = '';
        products.forEach(product => {
            const productItem = document.createElement('li');
            productItem.textContent = `${product.name} - $${product.price}`;
            
            const addToCartButton = document.createElement('button');
            addToCartButton.textContent = 'Add to Cart';
            addToCartButton.addEventListener('click', () => {
                controller.handleAddToCart(product);
            });

            productItem.appendChild(addToCartButton);
            this.productListElement.appendChild(productItem);
        });
    }

    // Render the cart products
    renderCart(cartProducts, total) {
        this.cartListElement.innerHTML = '';
        cartProducts.forEach(product => {
            const cartItem = document.createElement('li');
            cartItem.textContent = `${product.name} - $${product.price} x ${product.quantity}`;
            this.cartListElement.appendChild(cartItem);
        });
        this.cartTotalElement.textContent = total.toFixed(2);
    }
}
