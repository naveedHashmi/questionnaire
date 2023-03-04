class ChangeQeustionTypeType < ActiveRecord::Migration[5.2]
  def up
    remove_column :questions, :question_type
    add_column :questions, :question_type, :integer,  default: 0
  end

  def dwon
    change_column :questions, :question_type, :string, default: 'single_choice'
  end
end
