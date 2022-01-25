class Public::SearchesController < ApplicationController
  def search
    # binding.pry
    @customers = Customer.search(params[:keyword])
  end
end
