class Shark < ActiveRecord::Base
  belongs_to :user
  validates :name, :color, presence: :true
  validates :age, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 450000000 }
  validates :user_id, presence: :true

  def increment_birthday
    update(age: age + 1)
  end
end
