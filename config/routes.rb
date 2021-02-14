Rails.application.routes.draw do
#Root Principal
  root 'home#index'
#Banco Admin
  namespace :banco_admin do
    root 'auth#login'
    post 'auth/login'
    get 'auth/logout'
    get 'painel/visao_geral'
    resources :bancos, except: [:index, :create, :delete, :new, :update]
    resources :banco_users, except: [:show, :create, :delete, :new]
    resources :agencia, except: [:show, :delete]
    resources :conta_tipos, except: [:show, :delete]
    resources :conta_movimento_tipos, except: [:show, :delete]
    #cliente
    get 'cliente/index'
    get 'cliente/ativar_cliente'
    patch 'cliente/ativar_cliente'
    get 'conta/index'
    get 'conta/gerenciar_conta'
    patch 'conta/gerenciar_conta'
  end
  #Cadastro cliente
  get 'home/cadastro_cliente'
  post 'home/cadastro_cliente'
#Banco Cliente
  namespace :banco_cliente do
    root 'auth#login'
    post 'auth/login'
    get 'auth/logout'
    get 'painel_cliente/visao_geral'
    resources :conta do collection do get :encerrar_conta; patch :encerrar_conta;  end end
    resources :moviments do collection do get :extract_moviment end end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
