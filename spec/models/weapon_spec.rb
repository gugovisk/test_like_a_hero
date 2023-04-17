require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it "is valid if the level is between 1 and 99" do
    weapon = build(:weapon, level: FFaker::Random.rand(1..99))
    expect(weapon).to be_valid
  end
  it "is invalid if current_power is negative" do
    weapon = build(:weapon, power_base: FFaker::Random.rand(-9999..0))
    expect(weapon).to_not be_valid
  end
  it "it returns the correct weapon title" do
    name = FFaker::Name.first_name
    level = FFaker::Random.rand(1..99)
    weapon = build(:weapon, name: name, level: level)
    expect(weapon.title).to eq ("#{name} ##{level}")
  end
end
