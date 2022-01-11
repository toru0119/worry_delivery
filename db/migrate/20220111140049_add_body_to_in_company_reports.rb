class AddBodyToInCompanyReports < ActiveRecord::Migration[5.2]
  def change
    add_column :in_company_reports, :body, :text
  end
end
