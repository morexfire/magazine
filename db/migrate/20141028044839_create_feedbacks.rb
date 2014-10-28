class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text   :url, :content
      t.string :name, :email

      t.timestamps
    end
  end
end
