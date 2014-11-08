class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.string :name, :short_code
      t.text :description,  :url

      t.timestamps
    end
  end
end
