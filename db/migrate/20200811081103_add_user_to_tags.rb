class AddUserToTags < ActiveRecord::Migration[6.0]
  def change
    add_reference :tags, :user
  end
end
