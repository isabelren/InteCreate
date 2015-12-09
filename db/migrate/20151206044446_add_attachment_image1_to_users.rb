class AddAttachmentImage1ToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :image1
    end
  end

  def self.down
    remove_attachment :users, :image1
  end
end
