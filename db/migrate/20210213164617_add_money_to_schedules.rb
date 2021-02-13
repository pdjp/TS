class AddMoneyToSchedules < ActiveRecord::Migration[6.1]
  def change
    add_column :schedules, :money, :integer
  end
end
