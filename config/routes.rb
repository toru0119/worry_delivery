Rails.application.routes.draw do
  devise_for :customer,skip: [:passwords,], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes#about'
    resources :items, only: [:index]
    resources :new_employees, only: [:index]
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      delete 'destroy_all' => 'cart_items#destroy_all', on: :collection
    end
    resources :orders, only: [:new, :create, :index] do
      post 'order/create' => 'order#create'
      post 'orders/complete' => 'orders#complete', on: :collection
    end
    resource :customers, only: [:show, :edit, :update] do
      # patch 'customers/withdraw' => 'customers#withdraw', on: :collection
    end
  end

  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    root 'homes#top'
    resources :items, only: [:index, :create, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :in_company_reports, only: [:index, :edit, :destroy]
  end

  devise_for :new_employee,skip: [:passwords,], controllers: {
  registrations: "member/registrations",
  sessions: 'member/sessions'
  }

  namespace :member do
    root 'homes#top'
    resources :new_employees, only: [:index, :edit, :update]
    resources :customers, only: [:index, :show]
    resources :orders, only: [:index, :show, :update]
  end
end
