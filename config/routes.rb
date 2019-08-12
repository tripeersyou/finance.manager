Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  devise_scope :user do 
    authenticated :user do
      root 'pages#dashboard', as: :user_root
      resources 'accounts', except: [:destroy] do
        resources 'incomes', except: [:index]
        resources 'expenses', except: [:index]
        resources 'transfers', except: [:index, :destroy]
      end
      resources 'categories', except: [:destroy]
    end
  end
  get '/service-worker.js' => "service_worker#service_worker"
  get '/manifest.json' => "service_worker#manifest"
  root 'devise/sessions#new'
end