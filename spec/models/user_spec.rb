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

end

# It must be created with a password and password_confirmation fields
# These need to match so you should have an example for where they are not the same
# These are required when creating the model so you should also have an example for this
# Emails must be unique (not case sensitive; for example, TEST@TEST.com should not be allowed if test@test.COM is in the database)
# Email, first name, and last name should also be required