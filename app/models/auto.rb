class Auto < ApplicationRecord
    has_one_attached :foto
    has_one_attached :fotodocumentacion
    has_many :historialusos
    
    validates :patente, presence:true, uniqueness: true
    validates :marca, :modelo, :cant_puertas, :cant_combustible, :foto, :fotodocumentacion, presence:true
    
    validate :formatopatente  

    def fueraDelCasco?
        polygon = Geokit::Polygon.new([ 
          Geokit::LatLng.new(-34.920140999662024, -57.91551169140792), 
          Geokit::LatLng.new(-34.953443552547334, -57.95262186845976), 
          Geokit::LatLng.new(-34.92275203306298, -57.99405925723118), 
          Geokit::LatLng.new(-34.88915210274202, -57.956846729265635)
        ])    
        point = Geokit::LatLng.new(Float(location_point_x),Float(location_point_y))
        polygon.contains?(point)
    end


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
        end
        
    end 


end
