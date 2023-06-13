class AddUrlImageToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :url_image, :string
  end
end
