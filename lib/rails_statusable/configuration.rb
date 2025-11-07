module RailsStatusable
  class Configuration
    attr_accessor :default_statuses

    def initialize
      @default_statuses = %w[draft published archived]
    end
  end
end