class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.text_field :title
      t.boolean :status

      t.timestamps
    end
  end
end
