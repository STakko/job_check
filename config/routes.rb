Rails.application.routes.draw do
  #管理者用  
  devise_for :admins,skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
  }
  
  #共同アカウント
  devise_for :shared_users,skip: [:registrations, :passwords] ,contrllers: {
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #管理者用
  namespace :admin do
    resources :wokers, only: [:index, :create, :edit, :update]
  end
end
