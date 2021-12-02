class AddCoordinatesToFamilies < ActiveRecord::Migration[6.1]
  def change
    add_column :families, :latitude, :float
    add_column :families, :longitude, :float
  end
end
