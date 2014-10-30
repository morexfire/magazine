class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text     :title, :subtitle, :content
      t.string   :year, :month, :day, :slug
      t.datetime :published_at

      t.timestamps
    end
  end
end
