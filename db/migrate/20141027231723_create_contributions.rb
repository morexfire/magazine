class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :person_id
      t.integer :article_id
      t.integer :role_id

      t.timestamps
    end
  end
end
