class Ships
 	attr_reader :name, :size
 	attr_accessor :quanity, :sunken, :position
 
 	def initialize(args={})
 		@name = args.fetch(:name, 'Carrier')
 		@quanity = args.fetch(:quanity, 1)
 		@sunken = args.fetch(:sunken, false)
 		@size= args.fetch(:size, 2)
 		@position = args.fetch(:position, [])
 	end
end 