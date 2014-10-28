class Contribution < ActiveRecord::Base
  belongs_to :article
  belongs_to :person
  belongs_to :role
end
