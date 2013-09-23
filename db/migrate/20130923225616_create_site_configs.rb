class CreateSiteConfigs < ActiveRecord::Migration
  def change
    create_table :site_configs do |t|
      t.string :name
      t.text :css
      t.text :resources

      t.timestamps
    end

    SiteConfig.create name: 'Membership Site', css: '', resources: 'Foo'
  end
end
