ActiveAdmin.register Product do
  permit_params :name, :description, :price,
                :stock_quantity, :category_id

  # Remove ActiveAdmin's default action buttons
  config.clear_action_items!

  # Keep the burgundy Delete Product button
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

  menu priority: 2, label: "Products"

  # Keep the rest of your existing code unchanged
end