class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :update_access_token!

  attr_accessor :is_anonymous

  def set_anonymous!
    is_anonymous = true
  end

  def set_authenticated!
    is_anonymous = false
  end

  def update_access_token!
    self.access_token = "#{self.id}:#{Devise.friendly_token}"
    self.save!
  end

  def is_admin?
    return is_admin
  end

end
