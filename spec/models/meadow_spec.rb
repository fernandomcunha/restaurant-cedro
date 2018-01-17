require 'rails_helper'

RSpec.describe Meadow, type: :model do
  it { should validate_presence_of(:restaurant) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
end
