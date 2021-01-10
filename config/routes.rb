Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#homepage'

  scope 'users' do
    get 'usuario/:id', to: 'users#show', as: 'show_user'
    get '/cadastro', to: 'users#new', as: 'new_user'
    post '/cadastro', to: 'users#create'
    get 'editar/:id', to: 'users#edit', as: 'edit_user'
    patch 'editar/:id', to: 'users#update'

  end

end
