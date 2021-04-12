require 'rails_helper'

RSpec.describe User, type: :model do
  context ' check name validations' do
    it 'return false if the name field is not filled in' do
      u = User.new(name: '')
      u.save
      expect(u).to_not be_valid
    end

    it 'return true if the name field is filled in' do
      u = User.new(name: 'donat')
      u.save
      expect(u).to be_valid
    end
  end
end
