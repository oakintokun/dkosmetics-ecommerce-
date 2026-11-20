
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: "Dashboard"

  content title: "Dkosmetics Dashboard" do
    panel "Welcome Dami! " do
      para "Welcome to the Dkosmetics Administration Dashboard."

      para "Manage your beauty products, categories, orders, and store content all in one place."
    end
  end
end
