class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.string :website
      t.string :employee_email


      t.timestamps
    end
  end
end
