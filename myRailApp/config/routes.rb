#routers to do crud action with database
Rails.application.routes.draw do
  resources :covids, only: :writedata
  get 'covid/index', to: 'covid#index'
  post 'covid/create', to: 'covid#create'
  get 'covid/show', to: 'covid#show'
  patch '/covid/update' => 'covid#update'
  get 'covid/edit', to: 'covid#edit'
  delete 'covid/delete', to: 'covid#delete'
  get 'covid/new', to: 'covid#new'
  get 'covid/writedata' => 'covid#writedata'
  post 'covid/import' => 'covid#import'
  # end
root to: 'covid#index'
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

  # get 'covid/index'
  # resources :covid do
    # put '/update/:id', to: 'covid#update', :as => :update_recall
    # put '/delete/:id', to: 'covid#delete', :as => :delete_recall
  # collection {post :import}
  # end
