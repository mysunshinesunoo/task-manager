class Task < ApplicationRecord
      belongs_to :category
      belongs_to :user
      scope :due_today, -> { where(due_date: Date.today) }
end
