ActiveAdmin.register Game do
  config.sort_order = 'title_asc'

  permit_params :title, :description, :price, :release_date, :image, :developer_id, :publisher_id, genre_ids: []

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

  show do
    attributes_table do
      row :image do |game|
        image_tag game.image
      end
      row :title
      row :description
      row :price
      row :release_date
      row :developer
      row :publisher
      row :genres do |game|
        game.genres.pluck(:name).join(', ')
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :image, as: :file
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
