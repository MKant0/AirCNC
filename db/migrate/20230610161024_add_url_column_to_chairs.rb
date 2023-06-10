class AddUrlColumnToChairs < ActiveRecord::Migration[7.0]
  def change
    add_column :chairs, :url_image, :string
  end
end
