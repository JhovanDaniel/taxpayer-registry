Rails.application.routes.draw do
  devise_for :users, :controllers => { :users => "users" }
  as :user do
    authenticated :user do
    root "pages#home", as: :authenticated_root
    end
  
    unauthenticated :user do
      root "devise/sessions#new", as: :unauthenticated_root
    end
  end
  
  devise_scope :user do  
     get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  

  concern :with_datatable do
    post 'datatable', on: :collection
  end
  
   resources :users, concerns: [:with_datatable]  do 
    member do
      patch 'reset_password'
      patch 'activate_account'
      patch 'deactivate_account'
      patch 'unlock_account'
      get 'update_password'
      post 'update_password'
      get 'profile'
    end
  end

  
  resources :taxpayers, concerns: [:with_datatable] 
  resources :companies, concerns: [:with_datatable] 
end
