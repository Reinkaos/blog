module Web::Controllers::Posts
  # apps/webs/controllers/posts/update.rb
  class Update
    include Web::Action

    def call(params)
      PostRepository.new.update(params[:post][:id], title: params[:post][:title], body: params[:post][:body])
    end
  end
end
