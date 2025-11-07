require 'rails/generators'

module RailsStatusable
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def create_migration_file
        migration_template "migration.rb", "db/migrate/add_status_to_#{table_name}.rb"
      end

      private

      def table_name
        @table_name ||= ask("Enter the table name to add status field to (e.g., posts):")
      end
    end
  end
end