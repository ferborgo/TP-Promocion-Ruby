Rails.application.routes.draw do

  mount Notifications::Engine => "/notifications"
  resources :authors
  root 'booklist#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get '/booklist/:user_id', to: 'booklist#index', as: 'booklist'
  get '/booklist/add/:id', to: 'booklist#addBook', as: 'add_book_to_booklist'
  get '/booklist/remove/:id', to: 'booklist#removeBook', as: 'remove_book_to_booklist'

  resources :books do
    collection do
      get :search
    end
  end

  resources :opinions do
    resources :likes
  end

  post '/opinions/:id/delete', to: 'opinions#destroy', as: 'delete_opinion'

  get '/profile/:id', to: 'profile#show', as:'show_profile'
  post 'booklist/update_status', to: 'booklist#updateStatus', as: 'update_status_booklist'

  get '/profile', to: 'profile#index', as:'index_profiles'

  get 'profile/:id/follow', to: 'profile#follow', as: 'follow'
  get 'profile/:id/unfollow', to: 'profile#unfollow', as: 'unfollow'
  post 'opinion', to: 'opinions#create'

  # Notifications
  resources :notifications

  # Recommendations
  post 'recommendation', to: 'recommendation#create'
  post 'recommendation/delete/:id', to: 'recommendation#delete', as:'delete_recommendation'

  # Genres
  resources :genres
end
