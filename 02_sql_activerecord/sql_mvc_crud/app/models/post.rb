require 'pry-byebug'

class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attr = {})
    @id = attr[:id]
    @title = attr[:title]
    @url = attr[:url]
    @votes = attr[:votes] || 0
  end

  def self.find(id)
    statement = DB.execute("SELECT * FROM posts WHERE id = ?", id).first
    Post.new(id: statement[0], url: statement[2], title: statement[1], votes: statement[3]) if statement
  end

  def self.all
    statement = DB.execute("SELECT * FROM posts")
    post_array = []
    if statement
      statement.each do |row|
        post_array << Post.new(id: row[0], url: row[2], title: row[1], votes: row[3])
      end
      post_array
    end
  end

  def destroy
    DB.execute("DELETE FROM posts WHERE id = ?", @id)
  end

  def save
    if @id.nil?
      DB.execute("INSERT INTO posts (url, votes, title) VALUES ( ?, ?, ?) ", [@url, @votes, @title])
      @id = DB.last_insert_row_id
    else
      DB.execute("UPDATE posts SET url='#{@url}',votes='#{@votes}',title='#{@title}' WHERE id='#{@id}'")
    end
  end
end
