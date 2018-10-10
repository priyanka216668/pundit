class WelcomeController < ApplicationController

  def show
    @posts = Post.all
    authorize :welcome, :show?
  end
end
