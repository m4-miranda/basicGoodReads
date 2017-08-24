require 'open-uri'

module BooksHelper

  def list_from_api(params)
    list = []
    url = "https://www.googleapis.com/books/v1/volumes?q="+params[:books][:q]
    data = JSON.parse(open(url).read)

    # puts data["items"][4][""]

    data["items"].each do |book|
      # puts book["volumeInfo"]["imageLinks"]["smallThumbnail"]

      single_book = Book.new(api_id: book["id"],
                       image_link: book["volumeInfo"]["imageLinks"]["smallThumbnail"],
                       title: book["volumeInfo"]["title"],
                       publishedDate: book["volumeInfo"]["publishedDate"],
                       description: book["volumeInfo"]["description"])
      if book["volumeInfo"]["authors"] != nil
        single_book.author = book["volumeInfo"]["authors"].join(', ')
      end

      if book["volumeInfo"]["industryIdentifiers"] != nil
        if book["volumeInfo"]["industryIdentifiers"][1] != nil
          single_book.ISBN = book["volumeInfo"]["industryIdentifiers"][1]["identifier"]
        else
          single_book.ISBN = book["volumeInfo"]["industryIdentifiers"][0]["identifier"]
        end
      end


      list << single_book
    end
    return list
  end

  def volume_from_api(api_id)
    url = "https://www.googleapis.com/books/v1/volumes/"+api_id
    book = JSON.parse(open(url).read)

    single_book = Book.new(api_id: book["id"],
                     image_link: book["volumeInfo"]["imageLinks"]["smallThumbnail"],
                     title: book["volumeInfo"]["title"],
                     publishedDate: book["volumeInfo"]["publishedDate"],
                     description: book["volumeInfo"]["description"])

    if book["volumeInfo"]["authors"] != nil
      single_book.author = book["volumeInfo"]["authors"].join(', ')
    end

    if book["volumeInfo"]["industryIdentifiers"] != nil
      if book["volumeInfo"]["industryIdentifiers"][1] != nil
        single_book.ISBN = book["volumeInfo"]["industryIdentifiers"][1]["identifier"]
      else
        single_book.ISBN = book["volumeInfo"]["industryIdentifiers"][0]["identifier"]
      end
    end
    single_book
  end

end
