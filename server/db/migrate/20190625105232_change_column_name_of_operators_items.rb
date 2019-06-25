class ChangeColumnNameOfOperatorsItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :operators_items, :operators_id, :operator_id
    rename_column :operators_items, :items_id, :item_id
  end
end
