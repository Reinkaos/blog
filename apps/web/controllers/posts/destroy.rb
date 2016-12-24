module Web::Controllers::Posts
  # app/wb/controllers/posts/destroy.rb
  class Destroy
    include Web::Action

    def call(params)
      PostRepository.new.delete(params[:id])
    end
  end
end
