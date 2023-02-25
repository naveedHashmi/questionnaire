class CreateQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :questionnaires do |t|
      t.string :title, default: "", null: false
      t.text   :description, default: "", null: false
      t.decimal :total_score, precision: 10, scale: 2
    end
    add_index :questionnaires, :title
  end
end
