class AddMaxScoreToPolls < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :max_score, :integer
  end
end
