class AddCompanyIdToTaxpayers < ActiveRecord::Migration[7.0]
  def change
    add_column :taxpayers, :company_id, :int, foreign_key: true
  end
end
