class CreateContents < ActiveRecord::Migration[6.1]
  def change
    create_table :contents do |t|
      t.integer :poster_id
      t.string :text

      t.timestamps
    end
  end
end
