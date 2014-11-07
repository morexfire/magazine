class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.string :name, :twitter, :slug
      t.text :url, :bio

      t.timestamps
    end
  end
end
