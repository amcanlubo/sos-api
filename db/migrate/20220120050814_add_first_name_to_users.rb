class AddFirstNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :emergencies, :first_name, :string
    add_column :emergencies, :last_name, :string
  end
end
