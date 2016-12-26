# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
patch '/posts/:id', to: 'posts#update'
delete '/posts/:id', to: 'posts#destroy'
resources :posts
root to: 'posts#index'
