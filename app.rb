require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/brand")
require("./lib/store")
require("pry")

# Home Page
get('/') do
  @brands = Brand.all
  @stores = Store.all
  erb(:home)
end

# Brands List Page
get('/brands') do
  @brands = Brand.all
  erb(:brands)
end

#Stores List Page
get('/stores') do
  @stores = Store.all
  erb(:stores)
end

#Individual Brand Page
get('/brands/:id')do
  @brand = Brand.find(params[:id])
  @stores = (Store.all) - @brand.stores
  erb(:brand)
end

#Individual Brand Page
get('/stores/:id')do
  @store = Store.find(params[:id])
  @brands = (Brand.all) - @store.brands
  erb(:store)
end


#######ADD TO LISTS############
##brand##
post('/add_brand')do
binding.pry
  if Brand.create({:name => params[:name], :price => params[:price]})
    Brand.create({:name => params[:name], :price => params[:price]})
    redirect('/')
  else
    erb(:error)
  end
end
##Store##
post('/add_store')do
  if Store.create({:name => params[:name]})
    Store.create({:name => params[:name]})
    redirect('/')
  else
    erb(:error)
  end
end

#####SHIP SHOES#####

#SHIP BRAND TO STORE##

post('/brands/:id')do
  @brand = Brand.find(params[:id])
  store_ids = params['store_ids'] || [] # 'or' statement, returns empty array if no stores checked
  store_ids.each do |store_id|
    store = Store.find(store_id)
    @brand.stores.push(store)
  end
  @link = "/brands/#{@brand.id}"
  redirect(@link)
end
##Order brand into sr
post('/stores/:id')do
  @store = Store.find(params[:id])
  brand_ids = params['brand_ids'] || [] # 'or' statement, returns empty array if no brands checked
  brand_ids.each do |brand_id|
    brand = Brand.find(brand_id)
    @store.brands.push(brand)
  end
  @link = "/stores/#{@store.id}"
  redirect(@link)
end

delete('/stores/:id')do
  @store = Store.find(params[:id])
  @store.brands.destroy(params[:delete_id])
  @link = "/stores/#{@store.id}"
  redirect(@link)
end
