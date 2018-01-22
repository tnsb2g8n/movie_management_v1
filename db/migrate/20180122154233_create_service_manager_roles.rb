class CreateServiceManagerRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :service_manager_roles, comment: 'サービス運営者_権限マスタ' do |t|
      t.string :role_code
      t.string :name

      t.timestamps
    end
  end
end
