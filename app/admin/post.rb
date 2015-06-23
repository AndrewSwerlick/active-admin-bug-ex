ActiveAdmin.register Post do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  batch_action "Feature posts", confirm: "Select a data role", form: { apply_to_hidden_pages: "checkbox" } do |selection, inputs|
    collection = inputs[:apply_to_hidden_pages] ? batch_action_collection : Post.where(id: selection)

    collection.update_all(featured: true)

    redirect_to :admin_posts, notice: "#{collection.size} post(s) featured"
  end



end
