class Project < ApplicationRecord
  has_many :to_dos, dependent: :destroy, inverse_of: :project
  validates :title, presence: true,
                    length: {minimum: 1}
  accepts_nested_attributes_for :to_dos, reject_if: proc { |attributes|
    attributes[:title].blank? }, allow_destroy: true
end
