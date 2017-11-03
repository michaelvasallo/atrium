ActiveAdmin.register Company do
  config.sort_order = 'name_asc'

  permit_params :name
end
