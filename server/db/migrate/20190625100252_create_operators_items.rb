class CreateOperatorsItems < ActiveRecord::Migration[5.2]
  def change
    create_table :operators_items do |t|
      t.references :operators, foreign_key: true
      t.references :items, foreign_key: true
      t.boolean :done, default: false
      t.timestamps
    end
  end
end
