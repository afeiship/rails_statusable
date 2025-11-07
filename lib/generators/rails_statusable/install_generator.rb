require 'rails/generators'
require 'rails/generators/active_record/migration'

module RailsStatusable
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      
      source_root File.expand_path('../templates', __FILE__)
      desc "Generates a migration to add status column to specified table"

      def create_migration_file
        migration_template "migration.rb", "db/migrate/add_status_to_#{table_name}.rb"
      end

      private

      def table_name
        @table_name ||= ask("Enter the table name to add status field to (e.g., posts):")
      end

      # Implement the required method for Rails::Generators::Migration
      def self.next_migration_number(dirname)
        next_migration_number = current_migration_number(dirname) + 1
        ActiveRecord::Migration.next_migration_number(next_migration_number)
      end
    end
  end
end