class AddAttachmentImage5ToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :image5
    end
  end

  def self.down
    remove_attachment :users, :image5
  end
end
