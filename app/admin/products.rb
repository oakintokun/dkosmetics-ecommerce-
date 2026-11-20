
ActiveAdmin.register Product do
  permit_params :name, :description, :price,
                :stock_quantity, :category_id, :image

  menu priority: 2, label: "Products"

  config.filters = false

  # Remove default action buttons
  config.clear_action_items!

  # New Product button
  action_item :new, only: :index do
    link_to "New Product", new_resource_path
  end

  # Edit Product button
  action_item :edit, only: :show do
    link_to "Edit Product", edit_resource_path(resource)
  end

  # Custom burgundy Delete Product button
  action_item :delete_product, only: :show do
    form action: resource_path(resource),
         method: :post,
         style: "display: inline-block;" do

      input type: "hidden", name: "_method", value: "delete"
      input type: "hidden",
            name: "authenticity_token",
            value: form_authenticity_token

      input type: "submit",
            value: "Delete Product",
            style: "background: #842342; color: white; padding: 10px 18px; border: 0; border-radius: 8px; cursor: pointer;"
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :category
    column :description
    column("Price") { |product| number_to_currency(product.price) }
    column :stock_quantity
    actions
  end

  
show do
  attributes_table do
    row :name
    row :description
    row :category
    row("Price") { |product| number_to_currency(product.price) }
    row :stock_quantity

    row "Product Image" do |product|
      if product.image.attached?
        image_tag url_for(product.image), width: 180
      else
        "No image uploaded"
      end
    end

    row :created_at
    row :updated_at
  end
end

  form do |f|
    f.inputs "Product Information" do
      f.input :name, label: "Product Name"
      f.input :description, as: :text

      f.input :category, as: :select,
              collection: Category.order(:name).map { |category| [category.name, category.id] },
              include_blank: "Select a Category"

      f.input :price, label: "Price (CAD)",
              input_html: { min: 0.01, step: 0.01 }

      f.input :stock_quantity, label: "Quantity in Stock"

      f.input :image, as: :file, label: "Product Image"
    end

    f.actions
  end
end
