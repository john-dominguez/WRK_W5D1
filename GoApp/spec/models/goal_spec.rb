require 'rails_helper'

RSpec.describe Goal, type: :model do

  FactoryGirl.build(:goal,
    title: "Graduate appAcademy",
    body: "derp"
  )

  it { should validate_presence_of(:title)}
  it { should validate_presence_of(:body)}

end
