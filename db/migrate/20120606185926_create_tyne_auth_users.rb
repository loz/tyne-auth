class CreateTyneAuthUsers < ActiveRecord::Migration
  def change
    create_table :tyne_auth_users do |t|
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
