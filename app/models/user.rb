class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :foto
  has_many :historialusos
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nombre, :apellido, :email, presence:true
  validates :email, presence:true, uniqueness: true
  #validates :fecha_nac, :fecha_ven, presence:true
  validates :dni, numericality: { only_integer: true } , uniqueness: true
  validate :menor
  validate :vencimiento


  # variables
  enum rol: [:admin, :supervisor, :usuario]
 
  def menor
    if(usuario?)
      if fecha_nac != nil
        if fecha_nac > 21.years.ago
          errors.add(:base ,message:"no tenes edad para manejar")
        end
      else
          errors.add(:base ,message:"Debes ingresar tu fecha de nacimiento")
      end
    end
  end

  def vencimiento
    if(usuario?)
      if fecha_ven != nil
        if Date.today > fecha_ven
          errors.add(:base ,message:"Tenes tu licencia de conducir vencida")
        end
      else
          errors.add(:base ,message:"Debes ingresar la fecha de vencimiento de tu licencia de conducir")
      end
    end
  end

end
