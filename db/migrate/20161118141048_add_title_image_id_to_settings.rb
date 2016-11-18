class AddTitleImageIdToSettings < ActiveRecord::Migration
  def change
    add_column :settings, :title_image_id, :integer
    add_column :settings, :title_image_title, :string
  end
end
