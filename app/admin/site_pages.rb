ActiveAdmin.register SitePage do
  menu label: "Website Pages", priority: 3

  permit_params :title, :content

  config.filters = false
  config.clear_action_items!

  actions :index, :show, :edit, :update

  action_item :edit, only: :show do
    link_to "Edit Page", edit_resource_path(resource)
  end

  index do
    id_column
    column :title
    column :slug
    column :updated_at
    actions defaults: false do |page|
      item "View", resource_path(page)
      item "Edit", edit_resource_path(page)
    end
  end

  show do
    attributes_table do
      row :title
      row :slug
      row :content
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Page Content" do
      f.input :title
      f.input :content, as: :text,
              input_html: { rows: 12 }
    end

    f.actions
  end
end