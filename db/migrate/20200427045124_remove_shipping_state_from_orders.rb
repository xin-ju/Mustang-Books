class RemoveShippingStateFromOrders < ActiveRecord::Migration[6.0]
  def change

    remove_column :orders, :shipping_state, :string
  end
end
