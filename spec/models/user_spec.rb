require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
      described_class.new(
        first_name: 'Tony',
        last_name: 'Stark',
        email: 'tony@gmail.com',
        password: '12345',
        password_confirmation: '12345'
      )
    }

  describe 'Validations:' do
    context 'Password and password_confirmation fields -' do
      it 'is not valid without matching fields' do
        subject.password_confirmation = 'abcde'
        expect(subject).to_not be_valid
      end

      it 'is not valid without the fields' do
        subject.password = nil
        subject.password_confirmation = nil
        subject.password_digest = '12345'
        expect(subject).to_not be_valid
      end

      it 'is valid with matching and non-empty fields' do
        expect(subject).to be_valid
      end

      it 'has to be minimum of length 5' do
        subject.password = '1234'
        subject.password_confirmation = '1234'
        expect(subject).to_not be_valid
      end
    end

    context 'Email field -' do
      it 'must be unique' do
        subject.save!
        user = User.new(
          first_name: 'Peter',
          last_name: 'Parker',
          email: 'tony@gmail.com',
          password: 'abcde',
          password_confirmation: 'abcde'
        )
        expect(user).to_not be_valid
      end

      it 'is not case sensitive' do
        subject.save!
        user = User.new(
          first_name: 'Peter',
          last_name: 'Parker',
          email: 'TONY@gmail.com',
          password: 'abcde',
          password_confirmation: 'abcde'
        )
        expect(user).to_not be_valid
      end
    end

    context 'Required fields -' do
      it 'is not valid without email' do
        subject.email = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without first name' do
        subject.first_name = nil
        expect(subject).to_not be_valid
      end

      it 'is not valid without last name' do
        subject.last_name = nil
        expect(subject).to_not be_valid
      end
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return nil if failed' do
      subject.save!
      result = User.authenticate_with_credentials('tony@gmail.com','123')
      expect(result).to be_nil
    end

    it 'should return instance of user if success' do
      subject.save!
      result = User.authenticate_with_credentials('tony@gmail.com','12345')
      expect(result).to eql(subject)
    end
  end

end














