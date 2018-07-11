Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :users, only: %i(index)
  resources :transactions, only: %i(create) do
    collection do
      get 'history'
    end
  end

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      namespace :users do
        get 'current'
      end
    end
  end
end
