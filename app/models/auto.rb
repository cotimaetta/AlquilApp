class Auto < ApplicationRecord
    has_one_attached :foto
    has_one_attached :fotodocumentacion
    has_many :historialusos
    

    validates :patente, :marca, :modelo, :cant_puertas, :cant_combustible,   presence:true
    
end
