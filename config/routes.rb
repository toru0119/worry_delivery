Rails.application.routes.draw do

  devise_for :customer,skip: [:passwords,], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  scope module: :public do
    root 'homes#top'
    get 'homes/about' => 'homes#about'
    get '/search' => 'searches#search'
    resources :items, only: [:index]
    resources :new_employees, only: [:index]
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      delete 'destroy_all' => 'cart_items#destroy_all', on: :collection
    end
    resources :orders, only: [:new, :create, :index] do
      post 'order/create' => 'order#create'
      get 'orders/complete' => 'orders#complete', on: :collection
    end
    resource :customers, only: [:show, :edit, :update] do
    end
  end

  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  namespace :admin do
    root 'homes#top'
    resources :items, only: [:index, :create, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :in_company_reports, only: [:index, :create, :edit, :update]
    resources :new_employees, only: [:index]
  end

  devise_for :new_employee,skip: [:passwords,], controllers: {
  registrations: "member/registrations",
  sessions: 'member/sessions'
  }

  namespace :member do
    root 'homes#top'
    get '/search' => 'searches#search'
    resources :new_employees, only: [:index, :edit, :update]
    resources :customers, only: [:index, :show]
    resources :orders, only: [:index, :show, :update]
  end
end
