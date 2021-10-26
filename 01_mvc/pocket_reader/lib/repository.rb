require "csv"
require_relative "post"

class Repository
  def initialize(csv_file)
    @posts = []
    @csv_file = csv_file
    load_csv
  end

  def all
    @posts
  end

  def add(post)
    @posts << post
    save
  end

  def find(index)
    @posts[index]
  end

  def mark_as_read(index)
    @posts[index].mark_as_read!
    save
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      @posts << Post.new(
        path: row[0],
        title: row[1],
        content: row[2],
        author: row[3],
        read: row[4]
      )
    end
  end

  def save
    CSV.open(@csv_file, "wb") do |csv|
      @posts.each do |post|
        csv << [post.path, post.title, post.content, post.author, post.read?]
      end
    end
  end
end
