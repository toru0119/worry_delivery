class Admin::GenresController < ApplicationController
  # 管理者認識機能(管理者以外はいじれない)
  # before_action :authenticate_admin!, only: [:create, :index, :edit, :update]

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path, notice: "ジャンルの追加完了!"
    else
      flash.now[:alert] = "ジャンル未入力"
      render :index
    end
  end

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: "ジャンルの変更完了！"
    else
      flash.now[:alert] = "ジャンルが未入力"
      render :edit
    end

  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
