Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#homepage'

  scope 'users' do
    get ':id/', to: 'users#show', as: 'show_user'
    get 'cadastro', to: 'users#new', as: 'new_user'
    post 'cadastro', to: 'users#create'
    get ':id/editar', to: 'users#edit', as: 'edit_user'
    patch ':id/editar', to: 'users#update'

  end

end
