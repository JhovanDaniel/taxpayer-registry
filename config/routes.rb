Rails.application.routes.draw do

  concern :with_datatable do
    post 'datatable', on: :collection
  end
  
  root "pages#home"
  
  resources :taxpayers, concerns: [:with_datatable] 
  resources :companies, concerns: [:with_datatable] 
end
