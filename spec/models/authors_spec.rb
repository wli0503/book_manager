RSpec.describe Author, :type => :model do

  let(:author){ FactoryGirl.create :author }

  describe "#name" do
    it "should combine first_name and last_name" do
      author.first_name = "Wen"
      author.last_name = "Li"
      expect(author.name).to eq "Wen Li"
    end
  end

  describe "#name=" do
    it "should return first_name and last_name splited" do
      author.name = "Wen Li"
      expect(author.first_name).to eq "Wen"
      expect(author.last_name).to eq "Li"
    end

    it "properly handles a single name" do
      author.name = "Madonna"
      expect(author.first_name).to eq "Madonna"
      expect(author.last_name).to be_nil
    end

    it "handles a nil name properly" do
      expect { author.name = nil }.to raise_error /undefined method/i
    end
  end

end