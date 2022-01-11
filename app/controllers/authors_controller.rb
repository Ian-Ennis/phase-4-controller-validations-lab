class AuthorsController < ApplicationController
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create(author_params)
    if author.valid? 
    render json: author, status: :created
    else 
      render json: { errors: author.error.full_messages}, status: :unprocessable_entity
    end
  end

  private
  
  def author_params
    params.permit(:email, :name)
  end
  
end
