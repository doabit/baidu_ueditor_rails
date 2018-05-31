# desc "Explaining what the task does"
# task :baidu_ueditor_rails do
#   # Task goes here
# end
# assets_task = Rake::Task.task_defined?('assets:precompile:primary') ? 'assets:precompile:primary' : 'assets:precompile'

# Rake::Task[assets_task].enhance do
#   require "baidu_ueditor_rails/asset_installer"

#   config   = Rails.application.config
#   target   = File.join(Rails.public_path, config.assets.prefix)
#   manifest = config.assets.manifest

#   BaiduUeditorRails::AssetInstaller.new(target, manifest).install
# end

require 'fileutils'

namespace :ueditor do
  desc 'Create nondigest versions of all ueditor digest assets'
  task nondigest: :environment do
    fingerprint = /\-[0-9a-f]{32,64}\./
    path = Rails.root.join("public#{BaiduUeditorRails.base_path}**/*")

    Dir[path].each do |file|
      next unless file =~ fingerprint
      nondigest = file.sub fingerprint, '.'

      if !File.exist?(nondigest) || File.mtime(file) > File.mtime(nondigest)
        FileUtils.cp file, nondigest, verbose: true, preserve: true
      end
    end
  end
end