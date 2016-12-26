module Web::Controllers::Posts
  class Update
    include Web::Action

    def call(params)

      # repository = PostRepository.new
      # post = repository.find(params[:post][:id])
      #
      # p post.id

      PostRepository.new.update(params[:post][:id], title: params[:post][:title], body: params[:post][:body])

      # post = repository.update(post.id, title: 'yeh', body: 'na')
    end
  end
end
