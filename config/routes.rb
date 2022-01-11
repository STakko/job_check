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
    get '/', to: 'homes#top'
    resources :workers, only: [:index, :create, :edit, :update]
    resources :clients, only: [:index, :create, :edit, :update]
    resources :events
    resources :contacts, only: [:new, :create]
    post 'contacts/confirm', to: 'contacts#confirm'
    post 'contacts/back', to: 'contacts#back'
    get 'done', to: 'contacts#done', as: 'done'
    resources :records, except: [:create] do
      resources :admin_comments, only: [:create, :destroy]
      resource :confirmation, only: [:create, :destroy]
    end
  end

  get 'a_worker_search', to: 'admin/records#worker_search'
  get 'a_client_search', to: 'admin/records#client_search'
  #共同アカウント
  scope module: :public do
    root to: 'homes#top'
    resources :events, only: [:index, :show]
    resources :records, except: [:destroy, :edit] do
      resources :public_comments, only: [:create, :destroy]
    end
  end

  get 'p_worker_search', to: 'public/records#worker_search'
  get 'p_client_search', to: 'public/records#client_search'
end
