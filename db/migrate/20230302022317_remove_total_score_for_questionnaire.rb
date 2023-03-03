class RemoveTotalScoreForQuestionnaire < ActiveRecord::Migration[5.2]
  def change
    remove_column :questionnaires, :total_score
    remove_column :questions, :score
  end
end
