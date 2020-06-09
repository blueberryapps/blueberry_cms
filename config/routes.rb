require 'graphiql/rails'

BlueberryCMS::Engine.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql'
  end
  post '/graphql', to: 'graphql#execute'

  namespace :admin do
    resources :pages
    resources :menus, except: :show
  end
end
