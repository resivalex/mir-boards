ActiveAdmin.register Entry do
  permit_params :list, :of, :attributes, :on, :model,
      :event_id, :user_id

  index do
    id_column
    column :event
    column :user
    actions
  end
end
