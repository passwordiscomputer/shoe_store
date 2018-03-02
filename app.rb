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
end

#Individual Brand Page
get('/stores/:id')do
  @store = Store.find(params[:id])
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
  if Store.create(params)
    redirect('/')
  else
    erb(:error)
  end
end
