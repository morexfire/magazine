class Contribution < ActiveRecord::Base
  belongs_to :article
  belongs_to :contributor
  belongs_to :role
end
