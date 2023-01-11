class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :ird_no
      t.string :name
      t.string :address
      t.string :entity_type
      t.string :activity_status
      t.integer :paye_no

      t.timestamps
    end
  end
end
