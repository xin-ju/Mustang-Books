class CartItemsController < ApplicationController

    def create
        @cart = current_cart
        @cart_item = @cart.cart_items.new(cart_params)
        @cart.save
        session[:cart_id] = @cart.id
    end



    def update #Update Cart
        @cart = current_cart
        @cart_item = @cart.cart_items.find(params[:id])
        @cart_item.update_attributes(cart_params)
        @cart_items = current_cart.cart_items
        redirect_to carts_url
    end

    def destroy #Remove from Cart
        @cart = current_cart
        @cart_item = @cart.cart_items.find(params[:id])
        @cart_item.destroy
        @cart_items = current_cart.cart_items
        redirect_to carts_url
    end



    private
    
     def cart_params 
        params.require(:cart_item).permit(:book_id, :quantity)
     end
end

