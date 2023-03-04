class CreatePictureOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :picture_options do |t|
      t.references :question, foreign_key: true
      t.decimal :witch_points, precision: 10, scale: 2
      t.decimal :wizard_points, precision: 10, scale: 2
      t.decimal :lepracaun_points, precision: 10, scale: 2
      t.decimal :dragon_points, precision: 10, scale: 2
      t.decimal :human_points, precision: 10, scale: 2
      t.decimal :elf_points, precision: 10, scale: 2
      t.decimal :fairy_points, precision: 10, scale: 2

      t.timestamps
    end
  end
end
