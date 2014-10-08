class Owner < ActiveRecord::Base

	 validates_presence_of :name

	 has_many :cats


	 accepts_nested_attributes_for :cats
	 
end
