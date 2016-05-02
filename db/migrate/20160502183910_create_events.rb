class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.references :nomination, index: true, foreign_key: true
      t.string :location
      t.date :date
      t.text :description
      t.attachment :photo
    end
  end
end
