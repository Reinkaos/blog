module Web::Controllers::Posts
  class Create
    include Web::Action

    expose :post

    def call(params)
      @post = PostRepository.new.create(params[:post])

      redirect_to '/posts'
    end
  end
end
