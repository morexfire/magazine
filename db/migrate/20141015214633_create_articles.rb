class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text     :title, :subtitle, :content
      t.string   :photo, :slug

      t.string   :year, :month, :day
      t.datetime :published_at

      t.timestamps
    end
  end
end
