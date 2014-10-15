class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.text :url
      t.integer :role_id

      t.timestamps
    end
  end
end
