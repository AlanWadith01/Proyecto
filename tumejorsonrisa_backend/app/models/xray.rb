class XRay < ApplicationRecord
    belongs_to :patient
  
    validates :url, presence: true
  end
  