class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :content_id
      t.integer :commenter_id
      t.string :sub_text

      t.timestamps
    end
  end
end
