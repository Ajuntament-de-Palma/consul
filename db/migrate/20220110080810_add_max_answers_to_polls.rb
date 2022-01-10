class AddMaxAnswersToPolls < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :max_answers, :integer
  end
end
