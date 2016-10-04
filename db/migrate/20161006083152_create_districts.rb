class CreateDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :districts do |t|
      t.string :name
      t.string :country_id
      t.string :integer

      t.timestamps
    end
  end
end
