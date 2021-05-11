class Shark < ActiveRecord::Base
  belongs_to :user

  def increment_birthday
    update(age: age + 1)
  end
end
