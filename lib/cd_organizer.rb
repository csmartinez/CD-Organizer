class CD
  attr_reader(:album, :artist)
  @@cddirectory = []
    define_method(:initialize) do |attributes|
      @album = attributes.fetch(:album)
      @artist = attributes.fetch(:artist)
      @id = @@cddirectory.length().+(1)
    end

    define_singleton_method(:all) do
      @@cddirectory
    end

    define_method(:save) do
      @@cddirectory.push(self)
      self
    end

    define_singleton_method(:clear) do
      @@cddirectory = []
    end

    define_method(:id) do
      @id
    end

    define_singleton_method(:find) do |id|
      found_cd = nil
      @@cddirectory.each() do |cd|
        if cd.id().eql?(id.to_i())
          found_cd = cd
        end
      end
      found_cd
    end
end
