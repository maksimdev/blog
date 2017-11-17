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

  #list of post sorted by middle_rating desc
  def index
    render json: Post.select('middle_rating', 'title', 'text').where.not('middle_rating': nil).order('middle_rating desc').limit(params[:number].to_i)
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
