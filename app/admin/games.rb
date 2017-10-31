ActiveAdmin.register Game do
  permit_params :title, :description, :price, :release_date, :developer_id, :publisher_id
end
