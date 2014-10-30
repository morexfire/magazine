class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name, :twitter, :slug
      t.text :url

      t.timestamps
    end
  end
end
