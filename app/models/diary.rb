# coding: utf-8
class Diary < ApplicationRecord

  belongs_to :user 

  validates :statement, presence: true
  validates :display_date, presence: true, format: {with: /[0-9]{4}\.[0-1][0-9]\.[0-3][0-9]\([月火水木金土]\)/}

end
