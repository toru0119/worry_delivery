class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    @in_company_reports = InCompanyReport.all
  end

  def about
  end
end