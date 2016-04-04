class User < ActiveRecord::Base
  validates_presence_of :password, :email
  validates :password, length: { minimum: 8 }
  validates :email, format: {
              with: /.+@.+\..+/,  message: "Must have an @ symbol and a period."
            }
end
