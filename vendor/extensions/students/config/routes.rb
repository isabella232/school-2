Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :students do
    resources :students, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :students, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :students, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
