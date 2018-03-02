require 'spec_helper'

describe('Store') do
  it("ensures the store name is not blank") do
    store = Store.new({:name => ""})
    expect(store.save()).to(eq(false))
  end
  it("ensures the store name is unique") do
    store1 = Brand.new({:name => "HollyWOOD"})
    store2 = Brand.new({:name => "HollyWOOD"})
    store1.save()
    expect(store2.save()).to(eq(false))
  end
end
