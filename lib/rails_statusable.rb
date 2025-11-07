require "rails_statusable/engine"

module RailsStatusable
  extend ActiveSupport::Concern

  class << self
    def configure(&block)
      yield(configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def config
      configuration
    end
  end

  included do
    extend ClassMethods
  end

  module ClassMethods
    def statusable(options = {})
      class_attribute :status_config
      self.status_config = {
        field: options[:field] || :status,
        statuses: options[:statuses] || RailsStatusable.config.default_statuses,
        default: options[:default] || RailsStatusable.config.default_statuses.first
      }

      # Add validation for the status field
      validates status_config[:field], inclusion: { 
        in: status_config[:statuses],
        message: "%{value} is not a valid status" 
      }

      # Set default value
      after_initialize :set_default_status

      # Generate dynamic methods for each status
      status_config[:statuses].each do |status|
        define_status_method(status)
      end

      # Add scope methods for querying
      status_config[:statuses].each do |status|
        scope "by_#{status}", -> { where(status_config[:field] => status) }
      end
    end

    private

    def define_status_method(status_name)
      method_name = "#{status_name}?"
      
      define_method(method_name) do
        send(self.class.status_config[:field]).to_s.downcase == status_name.to_s.downcase
      end

      # Define setter method
      setter_method_name = "#{status_name}!"
      define_method(setter_method_name) do
        send("#{self.class.status_config[:field]}=", status_name)
      end
    end
  end

  private

  def set_default_status
    if send(self.class.status_config[:field]).blank?
      send("#{self.class.status_config[:field]}=", self.class.status_config[:default])
    end
  end
end