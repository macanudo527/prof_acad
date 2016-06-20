require "spec_helper"
require "zombie"

describe Zombie do
  it "is named Ash" do
    zombie = Zombie.new
    expect(zombie.brains).to be < 1 
    expect(zombie.name).to eq("Ash")
  end
end
