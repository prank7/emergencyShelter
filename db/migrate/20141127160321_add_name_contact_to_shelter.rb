class AddNameContactToShelter < ActiveRecord::Migration
  def change
  	add_column :shelters, :name, :string
  	add_column :shelters, :contact, :string
  end
end
