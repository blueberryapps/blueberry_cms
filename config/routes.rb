BlueberryCMS::Engine.routes.draw do
  namespace :admin do
    resources :pages
  end

  get ':locale',         to: 'pages#show', as: :root
  get ':locale/(*path)', to: 'pages#show', as: :page

  root to: 'root#index'
end
