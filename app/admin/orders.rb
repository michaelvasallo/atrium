ActiveAdmin.register Order do
  permit_params :status

  show do
    panel 'Order Items' do
      table_for order.order_items do
        column :game
        column :price
      end
    end
    default_main_content
  end
end
