class ReportsController < ApplicationController
  def index
    @volume = find_total_volume
    @sales_history = generate_sales_history
    @highest_rating = find_highest_rating
    @best_seller_by_volume = find_best_seller_by_volume
  end

  def find_total_volume
    _genre_to_volume = Hash.new(0)
    _subgenre_to_volume = Hash.new{ |h, k| h[k]=Hash.new(&h.default_proc) }
 
    genres = Genre.includes(:subgenres)

    genres.each do |genre_elem|
      _genre_to_volume[genre_elem.name] = genre_elem.count_books_in_genre
      genre_elem.subgenres.each do |subgenre_elem|
        _subgenre_to_volume[genre_elem.name]["#{subgenre_elem.name}_#{subgenre_elem.id.to_s}"] =
          subgenre_elem.count_books_in_subgenre
      end
    end
    [_genre_to_volume, _subgenre_to_volume]
  end


  def find_total_volume_test
    _genre_to_volume = Hash.new(0)
    _subgenre_to_volume = Hash.new{ |h, k| h[k]=Hash.new(&h.default_proc) }
    Genre.find_each do |genre_elem|
      _genre_to_volume[genre_elem.name] = genre_elem.count_books_in_genre
      genre_elem.subgenres.each do |subgenre_elem|
        _subgenre_to_volume[genre_elem.name]["#{subgenre_elem.name}_#{subgenre_elem.id.to_s}"] = subgenre_elem.count_books_in_subgenre
      end
    end
    [_genre_to_volume, _subgenre_to_volume]
  end

  def generate_sales_history
    sales_history_quantity = Hash.new(0)
    sales_history_revenue = Hash.new(0)

    books = Book.includes(:order_details)

    books.each do |book|
      book.order_details.each do |od|
        sales_history_quantity["#{book.name}_#{book.id}"] += od.quantity
        sales_history_revenue["#{book.name}_#{book.id}"] += od.quantity * od.unit_price
      end
    end
    [sales_history_quantity, sales_history_revenue]
  end

  def find_highest_rating
    #byebug
    highest_rating = Hash.new(0)
    Book.find_each do |book|
      avg_review = book.avg_rating
      next if avg_review.nil?
      highest_rating["#{book.name}_#{book.id}"] = avg_review
    end
    highest_rating.sort_by{|k, v| v}.reverse[0..4]
  end

  def find_best_seller_by_volume
    best_seller_by_volume = Hash.new(0)
    Book.find_each do |book|
      best_seller_by_volume["#{book.name}_#{book.id}"] += book.total_volume_sold
    end
    best_seller_by_volume.sort_by{ |k, v| v}.reverse[0..4]
  end

end
