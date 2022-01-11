class Admin::InCompanyReportsController < ApplicationController
  def create
    @in_company_report = InCompanyReport.new(in_company_report_params)
    if @in_company_report.save
      redirect_to admin_in_company_reports_path, notice: "社内報の追加完了!"
    else
      flash.now[:alert] = "社内報未入力"
      render :index
    end
  end

  def index
    @in_company_reports = InCompanyReport.all
    @in_company_report = InCompanyReport.new
  end

  def edit
    @in_company_report = InCompanyReport.find(params[:id])
  end

  def update
    @in_company_report = InCompanyReport.find(params[:id])
    if @in_company_report.update(in_company_report_params)
      redirect_to admin_in_company_reports_path, notice: "社内報の変更完了！"
    else
      flash.now[:alert] = "社内報が未入力"
      render :edit
    end

  end

  private

  def in_company_report_params
    params.require(:in_company_report).permit(:body)
  end
end
