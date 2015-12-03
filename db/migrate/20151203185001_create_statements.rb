class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.string :text

      t.timestamps null: false
    end
  end
end
