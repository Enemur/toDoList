class ToDo < ApplicationRecord
  belongs_to :project, optional: true

  validates :text, presence: true,
            length: {minimum: 1}
end
