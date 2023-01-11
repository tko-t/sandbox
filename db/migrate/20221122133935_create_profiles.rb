class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.integer :account_id, null: false, foreign_key: true, unique: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.date :birthday, null: false
      t.integer :gender, null: false
      t.string :zip, null: false
      t.integer :country_id, null: false, foreign_key: true
      t.integer :city_id, null: false, foreign_key: true
      t.string :address, null: false
      t.virtual :full_name, type: :string, as: 'CONCAT(first_name, " ", last_name)', stored: true

      t.index [:first_name, :last_name], name: 'index_name_of_profile'
      t.index [:full_name], name: 'index_full_name_of_profile'
      t.index [:country_id], name: 'index_country_id_of_profile'
      t.index [:city_id], name: 'index_city_id_of_profile'

      t.timestamps
    end
  end
end
