require('rspec')
require('cd_organizer')

describe('CD') do
  before() do
    CD.clear()
  end
  describe(".all") do
    it("starts out empty") do
      expect(CD.all()).to(eq([]))
    end
  end
  describe("#save") do
    it("saves album name and artist into a hash of all cds") do
      new_cd = CD.new({:album =>"Nevermind", :artist => "Nirvana"})
      new_cd.save()
      expect(CD.all()).to(eq([new_cd]))
    end
  end
  describe(".clear") do
    it("clears out all cds in the array") do
      new_cd = CD.new({:album =>"Nevermind", :artist => "Nirvana"}).save()
      CD.clear()
      expect(CD.all()).to(eq([]))
    end
  end
  describe("#id") do
    it("assigns an id each cd") do
      new_cd = CD.new({:album =>"Nevermind", :artist => "Nirvana"}).save()
      expect(new_cd.id()).to(eq(1))
    end
  end
  describe(".find") do
    it("returns a cd by it's id number") do
      new_cd1= CD.new({:album =>"Nevermind", :artist => "Nirvana"})
      new_cd1.save()
      new_cd2 = CD.new({:album =>"Nevermind", :artist => "Nirvana"})
      new_cd2.save()
      expect(CD.find(new_cd1.id())).to(eq(new_cd1))
    end
  end
end
