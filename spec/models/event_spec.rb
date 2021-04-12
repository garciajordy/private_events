require 'rails_helper'

RSpec.describe Event, type: :model do
  
  context " check validations" do
  
    it "return false if the description field is not filled in" do 
      e = Event.new(date:"05/12/2021")
      e.save
      expect(e).to_not be_valid
    end
  
    it "return false if the date field is not filled in" do 
      e = Event.new(discription:"study")
      e.save
      expect(e).to_not be_valid
    end

    it "return true if the description and date fields are filled in" do 
      u = User.create(name:"donat")
      e = Event.new(date:"05/12/2021", discription:"study", creator_id:u.id)
      e.save
      expect(e).to be_valid
    end

 
  end

  
end
