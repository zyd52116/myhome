class CreateMsgboards < ActiveRecord::Migration
  def change
    create_table :msgboards do |t|
      t.string :email
      t.text :content

      t.timestamps
    end
  end
end
