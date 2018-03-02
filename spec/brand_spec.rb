require 'spec_helper'

describe('Brand') do
  it("Adds a brand to the database") do
    brand = Brand.create({:name => "Nike"})
    expect(Brand.all).to(eq([brand]))
  end
  it("Adds updates a price on a brand") do
    brand = Brand.create({:name => "Nike"})
    brand.update(price: 100)
    expect(brand.price).to(eq(100))
  end
  it("ensures the brand name is not blank") do
    brand = Brand.new({:name => ""})
    expect(brand.save()).to(eq(false))
  end
  it("ensures the brand name is unique") do
    brand1 = Brand.new({:name => "Big Dogs"})
    brand2 = Brand.new({:name => "Big Dogs"})
    brand1.save()    
    expect(brand2.save()).to(eq(false))
  end
end
