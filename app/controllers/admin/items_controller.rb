class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @item = Item.new
    @items = Item.all
    # @item = Item.find(params[:id])indexのみで新規機能、一覧機能、編集機能はできないのか
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path, notice: "商品の追加完了!"
    else
      flash.now[:alert] = "商品未入力"
      render :index
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_items_path, notice: "ジャンルの変更完了！"
    else
      flash.now[:alert] = "ジャンルが未入力"
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :genre_id, :is_active)
  end
end
