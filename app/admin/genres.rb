ActiveAdmin.register Genre do
  config.sort_order = 'id_asc'

  permit_params :name
end
