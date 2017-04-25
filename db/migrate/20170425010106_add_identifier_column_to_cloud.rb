class AddIdentifierColumnToCloud < ActiveRecord::Migration[5.0]
  def change
    add_column :clouds, :identifier, :string
  end
end
