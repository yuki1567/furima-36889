class RenameMunicipalitiesColumnToAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :addresses, :municipalities, :municipality
  end
end
