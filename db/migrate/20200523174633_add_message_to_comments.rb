class AddMessageToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :message, :text
  end
end
