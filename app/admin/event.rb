ActiveAdmin.register Event do
  permit_params :list, :of, :attributes, :on, :model,
      :name, :nomination_id, :location, :date, :description, :photo

  index do
    id_column
    column :photo do |event|
      image_tag(event.photo.url(:thumb))
    end
    column :name
    column :nomination
    column :location
    column :date
    column :description
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
    f.inputs 'Событие' do
      f.input :name
      f.input :nomination
      f.input :location
      f.input :date
      f.input :description
      f.input :photo, :required => false, :as => :file, hint: f.object.photo? ? image_tag(f.object.photo.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
    end
    f.actions
  end

  show do |user|
    attributes_table do
      row :name
      row :nomination
      row :location
      row :date
      row :description
      row :photo do
        user.photo ? image_tag(user.photo.url(:thumb)) : content_tag('No photo')
      end
    end
  end
end
