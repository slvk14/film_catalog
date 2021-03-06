# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: %i[customer admin]

  has_many :reviews
  has_many :watch_later_movies
  has_many :movies, through: :watch_later_movies

  validates :first_name, :last_name, :email, presence: true

  has_one_attached :avatar

  def active_for_authentication?
    super && active
  end
end
