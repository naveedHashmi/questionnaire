class CreateRangeOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :range_options do |t|
      t.decimal :min_range
      t.decimal :max_range
      t.decimal :witch_percentage, precision: 10, scale: 2
      t.decimal :wizard_percentage, precision: 10, scale: 2
      t.decimal :lepracaun_percentage, precision: 10, scale: 2
      t.decimal :dragon_percentage, precision: 10, scale: 2
      t.decimal :human_percentage, precision: 10, scale: 2
      t.decimal :elf_percentage, precision: 10, scale: 2
      t.decimal :fairy_percentage, precision: 10, scale: 2
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
