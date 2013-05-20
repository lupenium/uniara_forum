require 'spec_helper'

describe User do
  context "validations" do
    it "requires a name" do
      user = User.create(name: nil)
      expect(user.errors[:name]).not_to be_empty
    end

    it "requires a email" do
      user = User.create(email: nil)
      expect(user.errors[:email]).not_to be_empty
    end
  end
end
