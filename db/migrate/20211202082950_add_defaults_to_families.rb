class AddDefaultsToFamilies < ActiveRecord::Migration[6.1]
  def change
    change_column :families, :adult_male, :integer, default: 0
    change_column :families, :adult_female, :integer, default: 0
    change_column :families, :child_male, :integer, default: 0
    change_column :families, :child_female, :integer, default: 0
    change_column :families, :senior_male, :integer, default: 0
    change_column :families, :senior_female, :integer, default: 0
  end
end
