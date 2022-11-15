class Auto < ApplicationRecord
    has_one_attached :foto
    has_one_attached :fotodocumentacion
    has_many :historialusos
    
    validates :patente, presence:true, uniqueness: true
    validates :marca, :modelo, :cant_puertas, :cant_combustible, :foto, :fotodocumentacion, presence:true
    
    validate :formatopatente  

    def formatopatente 
        
            if ((patente != nil) && (patente.length == 6) ) 
                a = patente[0, 3]
                b = patente[3,3]
                if  ( !(b =~ /[0-9]/  )  && !(a =~ /[a-zA-Z]/ ) ) 
                    errors.add(:base ,message:"La patente no coincide con el formato")
                end
            else  
                if ((patente != nil) && (patente.length == 7)) 
                    c = patente [0, 1]
                    d = patente [1, 4]
                    e = patente [5, 6]
                    if ( !(c=~  /[a-zA-Z]/ ) && !(d =~ /[0-9]/ ) && !(e =~ /[a-zA-Z]/ ))
                        errors.add(:base ,message:"La patente no coincide con el formato")
                    end 
                else 
                    if ((patente.length != 6) || (patente.length != 7))
                        errors.add(:base, message:"La patente no coincide con el formato")
                    end 
                end 
            end 
        
    end  
end
