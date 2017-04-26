class AddCodenameColumnToCloud < ActiveRecord::Migration[5.0]
  def change
    add_column :clouds, :codename, :text
  end
end
