class Owner < ActiveRecord::Base

	 validates_presence_of :name

	 has_many :cats, dependent: :destroy


	 accepts_nested_attributes_for :cats,
           reject_if: lambda { |cat_attrs| cat_attrs['name'].blank? }
 # It won't save it if the cat has no name
	 
end
