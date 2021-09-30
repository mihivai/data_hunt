class AddUserEmployeeEmailToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :user_employee_email, :string
  end
end
