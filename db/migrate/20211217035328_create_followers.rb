class CreateFollowers < ActiveRecord::Migration[7.0]
  def change
    create_table :followers do |t|
      t.references :follower, index: true, null: false, foreign_key: {to_table: :users}
      t.references :followee, index: true, null: false, foreign_key: {to_table: :users}
      t.index [:follower_id, :followee_id], unique: true
      t.timestamps
    end
  end
end
