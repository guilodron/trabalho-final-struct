Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'landpage#index'

  scope 'movies' do
    get '/index', to: 'movies#index', as: :index_movies
    get '/new', to: 'movies#new', as: :new_movie
    post '/new', to: 'movies#create', as: :create_movie
    get '/edit/:id', to: 'movies#edit', as: :edit_movie
    get '/show/:id', to: 'movies#show', as: :show_movie
    delete '/delete/:id', to: 'movies#destroy', as: :destroy_movie
  end
end
