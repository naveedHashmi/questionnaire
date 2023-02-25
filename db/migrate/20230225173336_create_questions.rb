class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :questionnaire, foreign_key: true
      t.string :title, default: "", null: false
      t.decimal :score, default: 0, null: false
      t.string :question_type, default: "single_choice", null: false
    end
  end
end
