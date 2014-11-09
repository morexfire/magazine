class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.text   :content
      t.string :name, :email

      t.timestamps
    end
  end
end
