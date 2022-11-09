class Fotouser < ApplicationRecord
    has_one_attached :fotoDNI
    has_one_attached :fotoCarnet

    validates :fotoDNI, :fotoCarnet, presence:true
    
end
