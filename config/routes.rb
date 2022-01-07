Rails.application.routes.draw do
  devise_for :customer,skip: [:passwords,], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  devise_for :new_employee,skip: [:passwords,], controllers: {
  registrations: "member/registrations",
  sessions: 'member/sessions'
  }
end
