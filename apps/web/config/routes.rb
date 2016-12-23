# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
delete '/posts/:id', to: 'posts#destroy'
resources :posts
root to: 'posts#index'
