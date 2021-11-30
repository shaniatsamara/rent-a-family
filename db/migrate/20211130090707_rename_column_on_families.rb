class RenameColumnOnFamilies < ActiveRecord::Migration[6.1]
  def change
    rename_column(:families, :race, :ethnicity)
  end
end
