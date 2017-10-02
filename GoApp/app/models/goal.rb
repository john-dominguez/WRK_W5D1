class Goal < ApplicationRecord

  validates :title, :body, :user, :public, :completed, presence: true

  belongs_to :user
end
