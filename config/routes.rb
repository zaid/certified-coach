Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      constraints format: 'json' do
        resources :coach_directory, only: :index
      end
    end
  end
end
