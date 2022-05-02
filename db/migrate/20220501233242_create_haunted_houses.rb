class CreateHauntedHouses < ActiveRecord::Migration[6.1]
  def change
    create_table :haunted_houses do |t|
      t.string :address

      t.timestamps
    end
  end
end
