module BaiduUeditorRails
  class Engine < ::Rails::Engine
    isolate_namespace BaiduUeditorRails
    initializer 'ckeditor.assets_precompile', group: :all do |app|
      app.config.assets.precompile += BaiduUeditorRails.assets
    end

    rake_tasks do
      load BaiduUeditorRails.root_path.join('lib/tasks/baidu_ueditor_rails_tasks.rake')

      if Rake::Task.task_defined?('assets:precompile')
        Rake::Task['assets:precompile'].enhance do
          Rake::Task['ueditor:nondigest'].invoke
        end
      end
    end
  end
end
