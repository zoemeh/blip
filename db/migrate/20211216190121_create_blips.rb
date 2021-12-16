class CreateBlips < ActiveRecord::Migration[7.0]
  def change
    create_table :blips do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
