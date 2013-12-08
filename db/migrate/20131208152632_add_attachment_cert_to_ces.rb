class AddAttachmentCertToCes < ActiveRecord::Migration
  def self.up
    change_table :ces do |t|
      t.attachment :cert
    end
  end

  def self.down
    drop_attached_file :ces, :cert
  end
end
