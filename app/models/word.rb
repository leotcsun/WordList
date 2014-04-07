class Word < ActiveRecord::Base
  belongs_to :list

  paginates_per 10
end

