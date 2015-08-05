RSpec.describe Book , type: :model do
  let(:book){ FactoryGirl.build :book }
  let(:saved_book) { FactoryGirl.create :book }
  let(:expensive_book) { FactoryGirl.create :book, price: 1000000 }

  describe '#record_old_price' do
    it "does not create a new record in price_histories when a book is not present" do
      book.send(:record_old_price)
      expect(PriceHistory.exists?(:book_id => book.id)).to eq false
    end

    it "does not create a new record in price_histories when the price is not changed" do
      saved_book.send(:record_old_price)
      expect(PriceHistory.exists?(:book_id => saved_book.id)).to eq false
    end

    it "does create a new record in price_histories when the record persisted and the price is changed" do
      saved_book.price = 100.00
      saved_book.send(:record_old_price)
      saved_book.save
      history = saved_book.price_histories.last
      expect(history.old_price).to eq 30
      expect(history.new_price).to eq 100
    end

  end

end