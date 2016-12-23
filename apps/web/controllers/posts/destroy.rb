module Web::Controllers::Posts
  class Destroy
    include Web::Action

    def call(params)
      p params[:id]
      PostRepository.new.delete(params[:id])
    end
  end
end
