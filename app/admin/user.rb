ActiveAdmin.register User do
  permit_params :list, :of, :attributes, :on, :model,
      :name, :role, :email, :password, :avatar
      
  before_create do |user|
   user.skip_confirmation!
  end

  index do
    id_column
    column :avatar do |ad|
      image_tag(ad.avatar.url(:thumb))
    end
    column :name
    column :role
    column :email
    actions
  end

  # Don't forget to add the image attribute (here thumbnails) to permitted_params
  # controller do
  #   def permitted_params
  #     params.permit project: [:title, :summary, :description, :thumbnail, :date, :url, :client_list, :technology_list, :type_list]
  #   end
  # end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "User Details" do
      f.input :name
      f.input :role
      f.input :email
      # f.input :password
      f.input :avatar, :required => false, :as => :file
    end
    f.actions
  end

  show do |user|
      attributes_table do
        row :name
        row :avatar do
          user.avatar ? image_tag(user.avatar.url(:thumb)) : content_tag('No avatar')
        end
        # Will display the image on show object page
      end
    end
end
