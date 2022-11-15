class Auto < ApplicationRecord
    has_one_attached :foto
    has_one_attached :fotodocumentacion
    has_many :historialusos
    
    validates :patente, presence:true, uniqueness: true
    validates :marca, :modelo, :cant_puertas, :cant_combustible, :foto, :fotodocumentacion, presence:true
    
    validate :formatopatente  

    def formatopatente 
        if patente.length != 0 
            if patente.length==7 
                c =  patente[0, 2] =~ /[a-zA-Z]/ 
                d = patente[2, 3] =~  /[0-9]/   
                e = patente[5, 2] =~ /[a-zA-Z]/ 
                if ( (c == nil) || (d == nil ) || (e == nil) ) 
                    errors.add(:base ,message:"Patente no valida")  
                end 
            else  
                if patente.length==6
                    a = patente[0, 3] =~  /[a-zA-Z]/
                    b = patente[3,3] =~ /[0-9]/  
                    if  ( (b == nil )  || (a == nil  ) ) 
                        errors.add(:base ,message:"La patente no coincide con el formato viejo ")
                    end
                else                      
                    errors.add(:base, message:"La patente no esta bien escrita" )
                end   
            end 
        else 
            errors.add(:base, message:"la patente no puede estar vacia")
        end
        
    end 


end
