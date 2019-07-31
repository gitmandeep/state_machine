class AddStatusToPosts < ActiveRecord::Migration[5.2]
  def change
  	add_column :posts, :aasm_state, :string
  	add_column :posts, :verified_at, :string
  	add_column :posts, :published_at, :string
	end
end
