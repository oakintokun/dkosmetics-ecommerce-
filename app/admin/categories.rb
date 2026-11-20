
ActiveAdmin.register Category do
  permit_params :name, :description

  menu priority: 3, label: "Categories"

  config.filters = false
  config.clear_action_items!

  action_item :new, only: :index do
    link_to "New Category", new_resource_path
  end

  action_item :edit, only: :show do
    link_to "Edit Category", edit_resource_path(resource)
  end

  action_item :delete_category, only: :show do
  if resource.products.empty?
    form action: resource_path(resource),
         method: :post,
         style: "display: inline-block;" do

      input type: "hidden", name: "_method", value: "delete"
      input type: "hidden",
            name: "authenticity_token",
            value: form_authenticity_token

      input type: "submit",
            value: "Delete Category",
            data: { confirm: "Are you sure you want to delete this category?" },
            style: "background: #842342; color: white; padding: 10px 18px; border: 0; border-radius: 8px; cursor: pointer;"
    end
  end
end

  index do
    id_column
    column :name
    column :description
    column("Products") { |category| category.products.count }

    actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row("Number of Products") { |category| category.products.count }
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Category Information" do
      f.input :name, label: "Category Name"
      f.input :description, as: :text
    end

    f.actions
  end
end
