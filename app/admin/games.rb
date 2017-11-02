ActiveAdmin.register Game do
  permit_params :title, :description, :price, :release_date, :developer_id, :publisher_id, genre_ids: []

  index do
    selectable_column
    id_column
    column :title
    column :price
    column :release_date
    column :developer
    column :publisher
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :price
      f.input :release_date
      f.input :developer
      f.input :publisher
      f.input :genre_ids, label: 'Genres', as: :check_boxes, collection: Genre.all
    end
    f.actions
  end
end
