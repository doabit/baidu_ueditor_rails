module BaiduUeditorRails
  module Utils
    def self.select_assets(path, relative_path)
      relative_folder = BaiduUeditorRails.root_path.join(relative_path)
      folder = relative_folder.join(path)
      extensions = '*.{js,css,png,gif,jpg,html}'
      languages = []

      # Files at root
      files = Dir[folder.join(extensions)]

      # Filter plugins
      if BaiduUeditorRails.assets_plugins.nil?
        files += Dir[folder.join('third-party', '**', extensions)]
      else
        BaiduUeditorRails.assets_plugins.each do |plugin|
          files += Dir[folder.join('third-party', plugin, '**', extensions)]
        end
      end

      # Other folders
      Dir[folder.join('*/')].each do |subfolder|
        path = Pathname.new(subfolder)
        next if ['third-party'].include?(path.basename.to_s)
        files += Dir[path.join('**', extensions)]
      end

      files.inject([]) do |items, name|
        file = Pathname.new(name)
        base = file.basename('.*').to_s

        if !name.include?('/i18n/') || languages.include?(base) || languages.empty?
          items << file.relative_path_from(relative_folder).to_s
        end

        items
      end
    end
  end
end