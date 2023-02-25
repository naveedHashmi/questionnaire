class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.references :question, foreign_key: true
      t.string :title, default: "", null: false
      t.decimal :points, default: 0, null: false
    end
  end
end
