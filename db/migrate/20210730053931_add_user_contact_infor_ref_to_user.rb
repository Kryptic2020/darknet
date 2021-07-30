class AddUserContactInforRefToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_contact_infos, :user, foreign_key: true
  end
end
