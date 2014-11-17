class CreateShelters < ActiveRecord::Migration
  def change
    create_table :shelters do |t|
      t.text :address
      t.float :latitude
      t.float :longitude
      t.text :description

      t.timestamps
    end
  end
end
