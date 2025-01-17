class Users < ActiveRecord::Migration[8.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :fullname
      t.string :email, null: false
      t.string :phone_number, null: true
      t.string :password_digest
      t.string :avatar, null: true
      t.string :role, default: 'customer'
      t.boolean :email_verified, default: false
      t.timestamps :email_verified_at, null: true

      t.timestamps
    end
  end
end
