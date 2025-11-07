class AddStatusTo<%= table_name.camelize %> < ActiveRecord::Migration[<%= ActiveRecord::Migration.current_version %>]
  def change
    add_column :<%= table_name %>, :status, :string
    add_index :<%= table_name %>, :status
  end
end