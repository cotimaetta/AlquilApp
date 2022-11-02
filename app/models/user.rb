class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_one_attached :cover_picture
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nombre, :apellido, :email, presence:true
  validates :dni, numericality: { only_integer: true } , uniqueness: true
  validate :menor
  validate :vencimiento
 
  def menor
    if(fecha_nac > 21.years.ago)
      errors.add(:base ,message:"no tenes edad para manejar")
    end
  end

  def vencimiento
    if(Date.today > fecha_ven)
      errors.add(:base ,message:"Tenes tu licencia de conducir vencida")
    end
  end

end
