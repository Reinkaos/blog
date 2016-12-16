# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
post '/posts', to: 'posts#create'
get '/posts/new', to: 'posts#new'
resources :posts
