class RatingsController < ApplicationController
  # allowable value of rating
  @@rating = [1, 2, 3, 4, 5]

  def create
    if data_valid?
      @middle_rating = ((@post['middle_rating'] || 0) *
                        (@post['num_of_voices'] || 1) +
                         @data['rating']) / ((@post['num_of_voices'] || 0) + 1)
      @post.update(num_of_voices: (@post['num_of_voices'] || 0) + 1,
                                    middle_rating: @middle_rating)
      render json: { middle_rating: @middle_rating }
    else
      render status: 422
    end
  end

  private

    def data_valid?
      @data = JSON.parse(params[:data])
      @post = Post.find_by(id: @data['id'])
      if @post && @@rating.include?(@data['rating'])
        true
      else
        false
      end
    end
end
