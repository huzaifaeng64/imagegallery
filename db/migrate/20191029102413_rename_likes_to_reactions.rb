class RenameLikesToReactions < ActiveRecord::Migration[5.0]
  def change
  	rename_table :likes, :reactions
  end
end
