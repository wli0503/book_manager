class ReportsController < ApplicationController
  def index
    @genre_to_volume = find_total_volume_by_genre
    @sales_history = generate_sales_history
  end
  
  def find_total_volume_by_genre
    _genre_to_volume = Hash.new(0)
    Genre.find_each do |elem|
      _genre_to_volume[elem.name] = elem.count_books_in_genre
    end
    _genre_to_volume
  end

  def generate_sales_history
    byebug
    sales_history = Hash.new(Hash.new(0))
    Book.all.each do |book|
      book.order_details.each do |od|
        sales_history[book.name][:total_volume_sold] += od.quantity
        sales_history[book.name][:total_revenue] += od.quantity * od.unit_price
      end
    end
    sales_history
  end

end
