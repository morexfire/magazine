class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title, :subtitle
      t.string :year, :month, :day
      t.string :photo

      t.timestamps
    end
  end
end
