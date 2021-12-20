class DropContents < ActiveRecord::Migration[6.1]
  def change
    drop_table :contents
  end
end
