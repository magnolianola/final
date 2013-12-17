module PlacesHelper
	def hours(something)
		something.strftime("%H:%M")
	end

  def find_bookstores(places)
    @bookstores = []
    places.each do |p|
      if p.category == "Books"
        @bookstores << p
      end
    end
    return @bookstores
  end
end


#need to change to mon opening hours... mon closing hours etc