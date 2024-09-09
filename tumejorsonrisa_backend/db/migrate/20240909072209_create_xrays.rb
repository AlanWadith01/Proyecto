class CreateXrays < ActiveRecord::Migration[7.1]
  def change
    create_table :xrays do |t|

      t.timestamps
    end
  end
end
