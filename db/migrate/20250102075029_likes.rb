class Likes < ActiveRecord::Migration[8.0]
  def change
    create_table :likes, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :post, type: :uuid, foreign_key: true
      t.references :comment, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
