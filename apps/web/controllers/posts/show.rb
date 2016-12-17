module Web::Controllers::Posts
  # apps/web/controllers/posts.show
  class Show
    include Web::Action

    expose :post

    def call(params)
      @post = PostRepository.new.find(params[:id])
    end
  end
end
