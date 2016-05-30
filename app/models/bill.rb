class Bill < ActiveRecord::Base
	belongs_to :order
	belongs_to :delivery
end
