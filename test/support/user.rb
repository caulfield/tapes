require 'active_model'

class User
  include ActiveModel::Model

  attr_accessor :id,
    :first_name, :second_name, :third_name, :title, :nickname, :uid,
    :age, :weight, :height, :volume,
    :terms, :terms_of_service

  # presence validations
  validates :uid, presence: true
  validates :title, presence: true, allow_nil: false
  validates :first_name, presence: true, allow_blank: false
  validates :second_name, presence: true, if: :title
  validates :third_name, presence: true, allow_nil: true
  validates :nickname, presence: true, allow_blank: true

  # length validations
  validates :uid, length: { is: 8 }, allow_nil: false, allow_blank: false
  validates :title, length: { in: 2...3 }, allow_nil: true
  validates :first_name, length: { minimum: 2 }
  validates :second_name, length: { minimum: 3 }, unless: :first_name
  validates :nickname, length: { in: 3..12 }, allow_blank: true

  # numericality validations
  validates :uid, numericality: { only_integer: true }
  validates :age, numericality: { only_integer: true, less_than: 100, greater_than: 0 }
  validates :height, numericality: { only_integer: false, less_than_or_equal_to: 250, greater_than_or_equal_to: 20 }
  validates :weight, numericality: true, allow_blank: true
  validates :volume, numericality: true, if: :weight, unless: :age

  # acceptance
  validates :terms, acceptance: true
  validates :terms_of_service, acceptance: { accept: 'Yes' }

  # inclusion & exclusion
  validates :first_name, inclusion: { in: %w(john) }
  validates :nickname, exclusion: { within: %w(caulfield) }
end
