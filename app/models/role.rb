class Role < ApplicationRecord
<<<<<<< HEAD

	has_and_belongs_to_many :users, :join_table => :users_roles
	validates :name, presence: true
	before_destroy :check_before_destroy

	belongs_to :resource,
           	   :polymorphic => true,
               :optional => true

	validates :resource_type,
              :inclusion => { :in => Rolify.resource_types },
              :allow_nil => true

	scopify
=======
has_and_belongs_to_many :users, :join_table => :users_roles
validates :name, presence: true
before_destroy :check_before_destroy


belongs_to :resource,
           :polymorphic => true,
           :optional => true


validates :resource_type,
          :inclusion => { :in => Rolify.resource_types },
          :allow_nil => true

scopify

>>>>>>> reaction-functionality

end
