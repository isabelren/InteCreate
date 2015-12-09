class AddStatementToUsers < ActiveRecord::Migration
  def change
    add_column :users, :statement, :string
  end
end
