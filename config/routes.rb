Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  scope 'sessions' do
    get 'login', to: 'sessions#new', as: :login
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy', as: :logout
  end

  scope 'movies' do
    get '/filmes', to: 'movies#index', as: :index_movies
    get '/novo', to: 'movies#new', as: :new_movie
    post '/novo', to: 'movies#create', as: :create_movie
    get '/editar/:id', to: 'movies#edit', as: :edit_movie
    get '/mostrar/:id', to: 'movies#show', as: :show_movie
    delete '/deletar/:id', to: 'movies#destroy', as: :destroy_movie
  end

  root 'application#homepage'

  scope 'users' do
    get 'usuario/:id', to: 'users#show', as: 'show_user'
    get '/cadastro', to: 'users#new', as: 'new_user'
    post '/cadastro', to: 'users#create'
    get 'editar/:id', to: 'users#edit', as: 'edit_user'
    patch 'editar/:id', to: 'users#update'
  end


  #root 'landpage#index'


end
