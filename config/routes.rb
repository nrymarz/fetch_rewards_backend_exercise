Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :transactions, only: [:create,:index]
  get 'points', to: 'payers#index'
  post 'spend', to: 'payers#spend'
end
