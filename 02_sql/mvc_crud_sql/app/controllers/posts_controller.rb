require_relative '../models/post'
require_relative '../views/posts_view'

class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST NOT use the global variable DB in this file #
  ################################################################

  def index
    # TODO: implement listing all posts
    @posts = Post.all
    @view.display(@posts)
  end

  def create
    # TODO: implement creating a new post
    title = @view.ask_for_stuff("title")
    url = @view.ask_for_stuff("url")
    post = Post.new(title: title, url: url)
    post.save
    index
  end

  def update
    # TODO: implement updating an existing post
    puts `clear`
    index
    id = @view.ask_for_id
    post = Post.find(id)
    title = @view.ask_for_stuff("title")
    post.title = title
    url = @view.ask_for_stuff("url")
    post.url = url
    post.save
  end

  def destroy
    # TODO: implement destroying a post
    puts `clear`
    index
    id = @view.ask_for_stuff("ID")
    post = Post.find(id)
    post.destroy
  end

  def upvote
    # TODO: implement upvoting a post
    puts `clear`
    index
    id = @view.ask_for_id
    post = Post.find(id)
    post.votes += 1
    post.save
  end
end
