class User < ApplicationRecord
  
  enum role: [:admin, :registrar, :viewer]
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true 
  validates_presence_of :first_name, :last_name, :role 

  def name
    "#{first_name} #{last_name}"
  end
  
  def initials
    "#{first_name.first}#{last_name.first}".upcase 
  end
end
