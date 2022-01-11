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

    it 'is not valid with a password less than the minimum length' do
      subject.password = 'tay'
      expect(subject).to_not be_valid
      print ".errors.full_messages === "
      print subject.errors.full_messages
    end

    it 'is not valid without a email' do
      subject.email = nil
      expect(subject).to_not be_valid
      print ".errors.full_messages === "
      print subject.errors.full_messages
    end

    context 'should not have 2 users with same email' do
      let! (:user2) { User.create(name: 'user2', email: 'test@TEST.com', password: '12345', password_confirmation: '12345') }

      it { is_expected.to_not be_valid }
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
      print ".errors.full_messages === "
      print subject.errors.full_messages
    end
  end
 

end


