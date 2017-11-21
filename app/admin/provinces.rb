ActiveAdmin.register Province do
  config.sort_order = 'id_asc'

  permit_params :name, :abbr, :pst, :gst, :hst
end
