class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.references :event, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
