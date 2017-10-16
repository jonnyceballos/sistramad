class AddReferenceToAttachment < ActiveRecord::Migration
  def change
    add_reference :attachments, :joint_plan, index: true, foreign_key: true
  end
end
