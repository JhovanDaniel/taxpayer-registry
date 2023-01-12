class Taxpayer < ApplicationRecord
    include ApplicationHelper
    
    belongs_to :company
    
    validates :ird_no, uniqueness: true, presence: true, length: { is: 6 }
    validates :first_name, presence: true, length: {minimum: 3, maximum: 25}
    validates :last_name, presence: true, length: {minimum: 3, maximum: 25}
    validates :address, presence: true, length: {minimum: 3, maximum: 25}
    validates :entity_type, presence: true, inclusion: { in: %w[Self-Employed Government Private] }
    validates :active_status, presence: true, inclusion: { in: %w[Active Inactive] }
    
    def self.active
       self.where(active_status: 'Active') 
    end
    
    def self.inactive
       self.where(active_status: 'Inactive') 
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
