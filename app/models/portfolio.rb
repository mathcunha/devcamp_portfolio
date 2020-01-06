class Portfolio < ApplicationRecord

    validates_presence_of :title, :subtitle, :body

    def self.angular
        where.(subtitle: 'angular')
    end

    scope :dathomirian, -> {where(subtitle:'Dathomirian')}
end
