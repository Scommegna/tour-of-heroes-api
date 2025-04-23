class Hero < ApplicationRecord
  validates :name, uniqueness: { scope: :token, case_sensitive: false }, presence: true
  validates :token, presence: true, length: { minimum: 10 }

  scope :by_token, ->(token) { where(token: token) }
  scope :sorted_by_name, -> { order(name: :asc) }
  scope :search, ->(name) { where("LOWER(name) LIKE ?", "%#{name.downcase}%") if name.present? }
end
