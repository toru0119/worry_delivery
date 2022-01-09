class CreateInCompanyReports < ActiveRecord::Migration[5.2]
  def change
    create_table :in_company_reports do |t|

      t.timestamps
    end
  end
end
