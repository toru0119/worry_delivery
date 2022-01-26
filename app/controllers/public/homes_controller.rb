class Public::HomesController < ApplicationController
  def top
    @rank_order_details = OrderDetail.find(OrderDetail.group(:item_id).order('count(amount) desc').limit(4).pluck(:id))
    @in_company_reports = InCompanyReport.all
  end

  def about
  end
end