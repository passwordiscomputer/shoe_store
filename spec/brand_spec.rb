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
end
