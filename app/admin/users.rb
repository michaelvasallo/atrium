ActiveAdmin.register User do
  actions :all, except: [:edit, :update, :destroy]

  scope :with_orders

  index do
    selectable_column
    id_column
    column :username
    column :email
    column :full_name
    actions
  end

  show do
    panel 'Orders' do
      user.orders.each do |order|
        h3 "Order ##{order.id}"
        table_for order.order_items do
          column :game
          column :price
        end
        attributes_table_for order do
          row :id do
            link_to order.id, admin_order_path(order)
          end
          row :status
          row :total
        end
      end

    end
    default_main_content
  end
end
