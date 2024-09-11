class AddDocumentoToPatients < ActiveRecord::Migration[7.1]
  def change
    add_column :patients, :documento, :string, null: true
    add_index :patients, :documento, unique: true
  end
end
