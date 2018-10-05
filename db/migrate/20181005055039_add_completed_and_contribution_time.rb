class AddCompletedAndContributionTime < ActiveRecord::Migration[5.2]
  def change
    add_column :gifts, :completed, :boolean, :default => false
    add_column :gifts, :time_of_contribution, :datetime
  end
end