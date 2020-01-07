class AddRecordsToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :name, :string
    add_column :events, :date, :datetime
    add_column :events, :location, :string
    add_column :events, :description, :text
    add_column :events, :tag, :string
  end
end
