class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  #       :recoverable, :rememberable, :trackable, :confirmable, 
  enum role: [:normal, :moderator, :admin]

  has_many :notes
  has_many :viewers
  has_many :readable, through: :viewers, source: :note

  after_initialize :assign_default_role, if: :new_record?

  private
    def assign_default_role
      self.role ||= :normal
    end

end
