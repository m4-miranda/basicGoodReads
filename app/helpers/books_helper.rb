require 'open-uri'

module BooksHelper

  def list_from_api(params)
    list = []
    url = "https://www.googleapis.com/books/v1/volumes?q="+params[:books][:q]
    data = JSON.parse(open(url).read)

    # puts data["items"][4][""]

    data["items"].each do |book|
      # puts book["volumeInfo"]["imageLinks"]["smallThumbnail"]
      list << Book.new(api_id: book["id"], image_link: book["volumeInfo"]["imageLinks"]["smallThumbnail"])
    end
    return list
  end

end
