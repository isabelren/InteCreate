class AddAttachmentImage2ToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :image2
    end
  end

  def self.down
    remove_attachment :users, :image2
  end
end
