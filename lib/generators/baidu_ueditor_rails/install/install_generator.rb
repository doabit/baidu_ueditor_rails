require 'rails/generators'

module BaiduUeditorRails
  module Generators
    class InstallGenerator < ::Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs baidu ueditor custom config"

      def add_custom_config
        if File.exist?("app/assets/javascripts/ueditor_custom_config.js")
          js = File.read("app/assets/javascripts/ueditor_custom_config.js")
          insert_into_file "app/assets/javascripts/ueditor_custom_config.js", js, :after => "ueditor custom config\n"
        else
          copy_file "ueditor_custom_config.js", "app/assets/javascripts/ueditor_custom_config.js"
        end
      end

      def add_init_config
        copy_file "ueditor.rb", "config/initializers/ueditor.rb"
      end

      def add_migrate_file
        migration_template 'migration.rb', 'db/migrate/create_ueditor_assets.rb', migration_version: migration_version
      end

      def self.next_migration_number(dirname) #:nodoc:
        Time.now.utc.strftime('%Y%m%d%H%M%S')
      end

      def rails5?
        Rails.version.start_with? '5'
      end

      def migration_version
        "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]" if rails5?
      end
    end
  end
end