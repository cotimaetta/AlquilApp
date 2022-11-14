class Auto < ApplicationRecord
    has_one_attached :foto
    has_one_attached :fotodocumentacion
    has_many :historialusos
    
    validates :patente, presence:true, uniqueness: true
    validates :marca, :modelo, :cant_puertas, :cant_combustible, :foto, :fotodocumentacion, presence:true
    
end
