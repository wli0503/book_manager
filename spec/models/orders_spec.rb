RSpec.describe Order , type: :model do
  let(:order){ FactoryGirl.create :order }

  describe '#calculate_total' do
    it 'calculates the total when no order details are present' do
      order.calculate_total
      expect(order.total_price).to eq 0
    end

    it 'calculates the total when a single order detail is present' do
      order.order_details << FactoryGirl.create(:order_detail)
      order.calculate_total
      expect(order.total_price).to eq 30
    end

    it 'calculates the total when multiple order details are present' do
      order.order_details << FactoryGirl.create(:order_detail)
      order.order_details << FactoryGirl.create(:order_detail, unit_price: 50.00)
      order.calculate_total
      expect(order.total_price).to eq 80
    end

    it 'calculates the total when an order detail has a quantity greater than one' do
      order.order_details << FactoryGirl.create(:order_detail, quantity: 3)
      order.calculate_total
      expect(order.total_price).to eq 90
    end
  end
end