class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts      
  
  validate :validate_user_age

   def validate_user_age
      if self.date_of_birth.present?
          age = Date.today.year - self.date_of_birth.year
          if age < 18
              errors.add(:age, "Please provide a valid date of age is more than 18")
          end 
      end 
  end

end
