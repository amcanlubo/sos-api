class CreateEmergencies < ActiveRecord::Migration[6.1]
  def change
    create_table :emergencies do |t|
      t.integer :user_id
      t.decimal :latitude
      t.decimal :longitude
      t.string :emergency_type
      t.boolean :on_going
      t.timestamps
    end
  end
end
