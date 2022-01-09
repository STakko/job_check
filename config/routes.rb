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
    resources :clients, only: [:index, :create, :edit, :update]
    resources :records, except: [:create] do
      resources :record_comments, only: [:create, :destroy]
    end
  end
  
  #共同アカウント
  namespace :public do
    resources :records, except: [:destroy, :edit] do
      resources :record_comments, only: [:create]
    end
  end
end
