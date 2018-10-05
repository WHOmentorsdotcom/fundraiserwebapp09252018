class AddContributionOptionIdToGifts < ActiveRecord::Migration[5.2]
  def change
    add_column :gifts, :contribution_option_id, :integer
  end
end
