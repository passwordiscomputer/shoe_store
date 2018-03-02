class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  before_validation(:capitalize_name)
  validates(:name, presence: true)
  validates( :name, uniqueness: true)


   private

   def capitalize_name
     self.name=(name().capitalize())
   end
end
