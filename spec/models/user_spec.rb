require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject do
      User.new(
        id: 1,
        name: 'first',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
    end
    
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a email' do
      subject.email = nil
      expect(subject).to_not be_valid
      print ".errors.full_messages === "
      print subject.errors.full_messages
    end

   

  end
 

end


