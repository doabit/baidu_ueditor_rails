require 'rails/generators'

module BaiduUeditorRails
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

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

    end
  end
end