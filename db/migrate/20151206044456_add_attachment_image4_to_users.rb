class AddAttachmentImage4ToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :image4
    end
  end

  def self.down
    remove_attachment :users, :image4
  end
end
