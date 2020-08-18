class FirstController < ApplicationController
  def hi
    render json: {message: 'hi3'}
  end
end
