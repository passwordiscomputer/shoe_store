class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  before_validation(:capitalize_name)
  validates(:name, presence: true, uniqueness: true, length:  { maximum: 100 })

  before_save(:currency_convert)



   private

   def capitalize_name
     self.name=(name().capitalize())
   end

   def currency_convert
     self.price = "$#{price.to_s}.00"
   end
end
