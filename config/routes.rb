Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#homepage'

  scope 'users' do
    get 'cadastro', to: 'users#new', as: 'new_user'
    post 'cadastro', to: 'users#create'
  end

end
