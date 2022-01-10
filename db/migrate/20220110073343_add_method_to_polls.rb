class AddMethodToPolls < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :method, :string, :null => false, :default => 'simple'
  end
end
