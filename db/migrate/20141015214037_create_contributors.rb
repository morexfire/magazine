class CreateContributors < ActiveRecord::Migration
  def change
    create_table :contributors do |t|
      t.string :name, :twitter
      t.text :url

      t.timestamps
    end
  end
end
