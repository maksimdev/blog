class PostsController < ApplicationController
  #data post
  def create
    @post = Post.new(post_params_filter)
    if @post.save
      render json: @post, status: 200
    else
      render status: 422
    end
  end

  private
    #check login
    def post_params_filter
      @data = JSON.parse(params[:post])
      @data['user_id'] = (User.find_by(login: @data['login']) || User.create(login: @data['login'])).id
      @data.delete('login')
      @data
    end
end
