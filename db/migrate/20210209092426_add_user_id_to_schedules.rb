class AddUserIdToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :user_id, :integer
  end
end
