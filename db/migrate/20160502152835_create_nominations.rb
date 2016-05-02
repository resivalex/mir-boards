class CreateNominations < ActiveRecord::Migration
  def change
    create_table :nominations do |t|
      t.string :name
      t.integer :gender
      t.integer :age_from
      t.integer :age_to
      t.text :description
    end
  end
end
