Rails.application.routes.draw do
  resources :portfolios, except:[:show]
  get 'portfolio/:id', to:'portfolios#show', as: 'portfolio_show'
  get 'angular-items', to:'portfolios#angular'
  
  get 'about-me', to:'pages#about'
  get 'pages/contact'

  
  resources :blogs do
    member do
      patch 'toggle_status'
      put 'toggle_status'
    end
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
