class CreateFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :families do |t|
      t.string :race
      t.integer :price
      t.integer :adult_male
      t.integer :adult_female
      t.integer :child_male
      t.integer :child_female
      t.integer :senior_male
      t.integer :senior_female
      t.text :description
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
