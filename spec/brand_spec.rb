require 'spec_helper'

describe('Brand') do
  it("Adds a brand to the database") do
    brand = Brand.create({:name => "Nike"})
    expect(Brand.all).to(eq([brand]))

  end
end
