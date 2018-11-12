require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validates' do
    subject {described_class.new(
      name: 'person',
      email: 'something@email.com',
      password: 'something',
      password_confirmation: 'something'
    )}

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

   it 'is not valid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

   it 'is not valid without email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with non-valid attributes' do
      non_subject = User.new(
        name: 'person',
        email: 'something@email.com',
        password: 'something',
        password_confirmation: 'otherthing'
      )
      expect(non_subject).to_not be_valid
    end

    it 'is not permitted to have non-unique emails (case insensitive)' do
      testUser = described_class.find_by_email('SOMETHING@email.com')
      expect(testUser).to eql(nil)
    end


  end

end

# It must be created with a password and password_confirmation fields
# These need to match so you should have an example for where they are not the same
# These are required when creating the model so you should also have an example for this
# Emails must be unique (not case sensitive; for example, TEST@TEST.com should not be allowed if test@test.COM is in the database)
# Email, first name, and last name should also be required