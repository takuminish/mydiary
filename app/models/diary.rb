class Diary < ApplicationRecord

  belongs_to :user 

  validates :statement, presence: true
  validates :display_date, presence: true

end
