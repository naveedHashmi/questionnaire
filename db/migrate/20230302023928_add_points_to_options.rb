class AddPointsToOptions < ActiveRecord::Migration[5.2]
  def up
    change_table :options, bulk: true do |t|
      t.remove  :points
      t.decimal :witch_points, precision: 10, scale: 2
      t.decimal :wizard_points, precision: 10, scale: 2
      t.decimal :lepracaun_points, precision: 10, scale: 2
      t.decimal :dragon_points, precision: 10, scale: 2
      t.decimal :human_points, precision: 10, scale: 2
      t.decimal :elf_points, precision: 10, scale: 2
      t.decimal :fairy_points, precision: 10, scale: 2
    end
  end

  def down
    change_table :options, bulk: true do |t|
      t.decimal  :points, precision: 10, scale: 2
      t.remove :witch_points
      t.remove :wizard_points
      t.remove :lepracaun_points
      t.remove :dragon_points
      t.remove :human_points
      t.remove :elf_points
      t.remove :fairy_points
    end
  end
end
