class Event
	include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::Serialization
  extend ActiveModel::Naming

  attr_accessor :deviceId, :houseCode, :eventType, :zone_id, :speed, :brightness, :command, :color
  #serialize :color, Array

  def self.attr_accessor(*vars)
    @attributes ||= []
    @attributes.concat( vars )
    super
  end

	def self.attributes
		@attributes
	end

	def initialize(attributes={})
		attributes && attributes.each do |name, value|
			send("#{name}=", value) if respond_to? name.to_sym 
		end
	end

	def persisted?
		false
	end

	def self.inspect
	  "#<#{ self.to_s} #{ self.attributes.collect{ |e| ":#{ e }" }.join(', ') }>"
	end

	def to_hash
		@attributes
	end

end