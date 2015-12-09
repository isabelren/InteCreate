class AddAttachmentImage3ToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :image3
    end
  end

  def self.down
    remove_attachment :users, :image3
  end
end
