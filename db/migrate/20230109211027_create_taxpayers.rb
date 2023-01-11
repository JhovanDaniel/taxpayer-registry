class CreateTaxpayers < ActiveRecord::Migration[7.0]
  def change
    create_table :taxpayers do |t|
      t.integer :ird_no
      t.string :old_ird_no
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :address
      t.string :entity_type
      t.string :active_status

      t.timestamps
    end
  end
end
