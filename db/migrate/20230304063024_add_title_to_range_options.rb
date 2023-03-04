class AddTitleToRangeOptions < ActiveRecord::Migration[5.2]
  def up
    add_column :range_options, :title, :string, default: ""
    rename_column :options, :lepracaun_points, :leprechaun_points
    rename_column :picture_options, :lepracaun_points, :leprechaun_points
    rename_column :range_options, :lepracaun_percentage, :leprechaun_percentage

  end

  def down

    remove_column :range_options, :title
    rename_column :options, :leprechaun_points, :lepracaun_points
    rename_column :picture_options, :leprechaun_points, :lepracaun_points
    rename_column :range_options, :leprechaun_percentage, :lepracaun_percentage
  end
end
