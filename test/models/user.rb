require 'active_model'

class User
  include ActiveModel::Model

  attr_accessor :id,
    :first_name, :second_name, :third_name, :title, :nickname, :uid

  # presence validations
  validates :uid, presence: true
  validates :title, presence: true, allow_nil: false
  validates :first_name, presence: true, allow_blank: false
  validates :second_name, presence: true, if: :title
  validates :third_name, presence: true, allow_nil: true
  validates :nickname, presence: true, allow_blank: true
end
