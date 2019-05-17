BlueberryCMS::Engine.routes.draw do
  namespace :admin do
    resources :pages
    resources :menus, except: :show
  end

  if BlueberryCMS.force_locale
    scope '/:locale', locale: Regexp.new(I18n.available_locales.join('|')) do
      get '/(*path)', to: 'pages#show', as: :page
    end

    get '/(*path)', to: 'root#index'
  else
    get '/(*path)', to: 'pages#show', as: :page
  end

  root to: 'root#index'
end
