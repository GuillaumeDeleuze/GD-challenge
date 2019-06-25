class AddActionToOperatorsItems < ActiveRecord::Migration[5.2]
  def change
    add_column :operators_items, :action, :integer, default: 0
  end
end
