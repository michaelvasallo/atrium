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
      table_for user.orders do
        column :id
        column :status
        column :total
      end
    end
    default_main_content
  end
end
