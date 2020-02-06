Rails.application.routes.draw do
  resources :comments
  devise_for :users, path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except:[:show] do
    put :sort, on: :collection
  end
  get 'portfolio/:id', to:'portfolios#show', as: 'portfolio_show'
  get 'angular-items', to:'portfolios#angular'
  
  get 'about-me', to:'pages#about'
  get 'tech-news', to:'pages#tech_news'
  get 'pages/contact'

  
  resources :blogs do
    member do
      patch 'toggle_status'
      put 'toggle_status'
    end
    collection do
      get 'topic/:title', to:'blogs#topic', as: 'topic'
    end
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
