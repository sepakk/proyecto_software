class Step < ApplicationRecord
  belongs_to :cycle, inverse_of: :steps, optional: true
end
