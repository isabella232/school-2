Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :employees do
    resources :employees, :path => '', :only => [:index, :show] do 
      collection do 
        get 'coaches'
      end
    end  
  end

  # Admin routes
  namespace :employees, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :employees, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end


  # Frontend routes
  namespace :employees do
    resources :roles, :only => [:index, :index]
  end

  # Admin routes
  namespace :employees, :path => '' do
    namespace :admin, :path => "#{Refinery::Core.backend_route}/employees" do
      resources :roles, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
