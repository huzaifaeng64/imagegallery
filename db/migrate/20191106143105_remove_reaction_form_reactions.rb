class RemoveReactionFormReactions < ActiveRecord::Migration[5.0]
  def up
  	remove_column :reactions, :reaction
  end

  def down
  	add_column :reactions, :reaction, :boolean
  end
end
