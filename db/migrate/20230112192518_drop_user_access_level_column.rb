class DropUserAccessLevelColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :access_level
  end
end
