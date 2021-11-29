class AddTitleToFamilies < ActiveRecord::Migration[6.1]
  def change
    add_column :families, :title, :string
  end
end
