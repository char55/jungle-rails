require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validates' do

    before (:each) do
      @subject  = User.new({
        name: 'person',
        email: 'something@email.com',
        password: 'something',
        password_confirmation: 'something'
      })
    end


    it 'is valid with valid attributes' do
      expect(@subject).to be_valid
    end

   it 'is not valid without name' do
      @subject.name = nil
      expect(@subject).to_not be_valid
    end

   it 'is not valid without email' do
      @subject.email = nil
      expect(@subject).to_not be_valid
    end

    it 'is not valid with non-valid attributes' do
      non_subject = User.new({
        name: 'person',
        email: 'something@email.com',
        password: 'something',
        password_confirmation: 'otherthing'
      })
      expect(non_subject).to_not be_valid
    end
    
    it 'is must have unique emails (case insensitive)' do
      @subject.save()
      test_subject = User.new({
        name: 'person2',
        email: 'SOMETHING@email.com',
        password: 'something',
        password_confirmation: 'something'
      })
      expect(test_subject).to_not be_valid
    end

    it 'password must have minimum length' do
      test_subject = User.new({
        name: 'person2',
        email: 'SOMETHING@email.com',
        password: 'a',
        password_confirmation: 'a'
      })
      expect(test_subject).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    before (:each) do
      @subject  = User.create({
        name: 'person',
        email: 'someTHING@email.com',
        password: 'something',
        password_confirmation: 'something'
      })
      # @subject.save
    end

    it 'should be valid if authentication sucessful' do
      user = User.authenticate_with_credentials('something@email.com', 'something')
      expect(user).to eql(@subject)
    end

    it 'should be valid if authentication sucessful - case insensitive' do
      user = User.authenticate_with_credentials('SOMETHING@email.com', 'something')
      expect(user).to eql(@subject)
    end

    it 'should be valid if authentication sucessful - with whitespaces' do
      user = User.authenticate_with_credentials('   something@email.com', 'something')
      expect(user).to eql(@subject)
    end

    it 'should returns nil if authentication fail - wrong password' do
      user = User.authenticate_with_credentials('something@email.com', 'otherthing')
      expect(user).to eql(nil)
    end

    it 'should returns nil if authentication fail - wrong email' do
      user = User.authenticate_with_credentials('poop@email.com', 'something')
      expect(user).to eql(nil)
    end

  end

end
