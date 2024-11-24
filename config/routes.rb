Rails.application.routes.draw do
  get 'rooms/index'
  get 'users/update'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  #deviseのcontrollerを作成した際にセットアップした
  
  root 'top#index'
  get 'top/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
