class Comments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments, id: :uuid do |t|
      t.text :content, null: false
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :post, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
