class AddAuthorToModuleEvaluation < ActiveRecord::Migration[5.0]
  def change
    add_column :module_evaluations, :author, :string
  end
end
