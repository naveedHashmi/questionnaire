class AddTimeStampsToQuestionnaires < ActiveRecord::Migration[6.1]
  def up
    # add_column :questionnaires, :created_at, :datetime
    # add_column :questionnaires, :updated_at, :datetime

    # Questionnaire.update_all(created_at: Time.current, updated_at: Time.current)

    # change_column :questionnaires, :created_at, :datetime, null: false
    # change_column :questionnaires, :updated_at, :datetime, null: false
  end

  def def down
    remove_column :questionnaires, :created_at
    remove_column :questionnaires, :updated_at
  end
end
