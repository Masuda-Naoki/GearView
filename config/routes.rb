Rails.application.routes.draw do

devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resources :items, only: [:index, :show]
    resources :genres, only: [:index, :show]
    resources :posts do
      resources :comments, only: [:create]
      resource :favorites, only: [:create, :destroy]
    end
    get 'customers/information' => 'customers#show', as: 'customer'
    get    'customers/information/edit' => 'customers#edit',   as: 'edit_customer'
    patch  'customers/information' => 'customers#update', as: 'update_customer'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'customer_unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'customer_withdraw'
    get "search" => "searches#search"
    get "search_tag" => "searches#search_tag"
  end

  namespace :admin do
    root to: 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :posts, only: [:index, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end