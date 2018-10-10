class WelcomePolicy < Struct.new(:user, :welcome)

  def show?
   posts = Post.where(status: "published")
   posts
  end

end