class Poll < ApplicationRecord
  serialize :poll
  serialize :voted
end
