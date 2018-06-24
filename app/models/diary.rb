# coding: utf-8
class Diary < ApplicationRecord

  belongs_to :user 

  validates :statement, presence: true
  validates :display_date, presence: true, format: {with: /[0-9]{4}\.[0-1][0-9]\.[0-3][0-9]\([月火水木金土]\)/}

  def self.search_by_display_date(date)
    if date
      self.where(['display_date LIKE ?' , "%#{date}%"])
    else
      self.all
    end
  end
  
end
