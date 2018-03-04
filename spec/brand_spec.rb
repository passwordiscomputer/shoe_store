require 'spec_helper'

describe('Brand') do
  it("Adds a brand to the database") do
    brand = Brand.create({:name => "Nike"})
    expect(Brand.all).to(eq([brand]))
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
  it("saves the brand name with a capital letter") do
    brand = Brand.create({:name => "nike"})
    expect(brand.name).to(eq("Nike"))
  end
  it("saves the brand price in currency form") do
    brand = Brand.create({:name => "nike", :price => 50})
    expect(brand.price).to(eq("$50.00"))
  end
  it "ensures brand name doesn't have more than one hundred characters" do
    brand = Brand.new({:name => ("a" * 101)})
    expect(brand.save).to(eq(false))
  end
end
