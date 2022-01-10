require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    let (:category) { Category.create(name: 'testCategory') }
    subject { Product.new(name: 'test', price_cents: 9000, quantity: 100, category_id: category.id) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end


  end
end
