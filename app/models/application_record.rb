# build inheritance for all other activerecord models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
