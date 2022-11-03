class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :foto
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nombre, :apellido, presence:true
  validates :dni, numericality: { only_integer: true }
  validate :menor
 
  def menor
    if(fecha_nac > 21.years.ago)
      errors.add(:base ,message:"no tenes edad para manejar")
    end
  end
end
