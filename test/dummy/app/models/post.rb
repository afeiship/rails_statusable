class Post < ApplicationRecord
    include RailsStatusable
    statusable statuses: %w[draft published archived], default: 'draft'
end
