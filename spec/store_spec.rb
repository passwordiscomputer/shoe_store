require 'spec_helper'

describe('Store') do
  it("ensures the store name is not blank") do
    store = Store.new({:name => ""})
    expect(store.save()).to(eq(false))
  end
  it("ensures the store name is unique") do
    store1 = Store.create({:name => "HollyWOOD"})
    store2 = Store.new({:name => "hollyWOOD"})

    expect(store2.save()).to(eq(false))
  end
  it("saves the store name with a capital letter") do
    store = Store.create({:name => "hollywood"})
    expect(store.name).to(eq("Hollywood"))
  end
end
