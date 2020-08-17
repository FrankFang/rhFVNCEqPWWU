class FirstController < ApplicationController
  def hi
    render json: {message: 'hi'}
  end
end
