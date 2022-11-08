class Fotouser < ApplicationRecord
    has_one_attached :fotoDNI
    has_one_attached :fotoCarnet
end
