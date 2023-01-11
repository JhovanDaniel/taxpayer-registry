class Company < ApplicationRecord

    has_many :taxpayers

    validates :ird_no, uniqueness: true, presence: true, length: {minimum: 6, maximum: 6}
    validates :name, presence: true, length: {minimum: 3, maximum: 25}
    validates :address, presence: true, length: {minimum: 3, maximum: 25}
    validates :entity_type, presence: true, inclusion: { in: %w[Self-Employed Government Private] }
    validates :activity_status, presence: true, inclusion: { in: %w[Active Inactive] }
    validates :paye_no, uniqueness: true, presence: true
    
    def self.active
       self.where(activity_status: 'Active') 
    end
    
    def self.inactive
       self.where(activity_status: 'Inactive') 
    end
    
    def self.government
       self.where(entity_type: 'Government') 
    end
    
    def self.private
       self.where(entity_type: 'Private') 
    end
    
    def self.selfemployed
       self.where(entity_type: 'Self-Employed') 
    end
    
end
