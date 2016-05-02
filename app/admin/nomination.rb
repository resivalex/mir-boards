ActiveAdmin.register Nomination do
  permit_params :list, :of, :attributes, :on, :model,
      :name, :gender, :age_from, :age_to, :description

end
