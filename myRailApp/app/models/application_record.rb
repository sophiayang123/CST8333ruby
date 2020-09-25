class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  print "here is application model"
end
