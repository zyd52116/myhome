class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :email
      t.string :content
      t.integer :article_id

      t.timestamps 
    end
    add_index :comments, [:article_id, :created_at]
  end
end
