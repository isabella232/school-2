Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :sections do
    resources :sections, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :sections, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :sections, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
