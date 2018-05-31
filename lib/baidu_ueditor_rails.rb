module BaiduUeditorRails
  autoload :Utils, 'baidu_ueditor_rails/utils'

  DEFAULT_CURRENT_USER = lambda do
    request.env['warden'].try(:user) || respond_to?(:current_user) && current_user
  end

  # Ckeditor files destination path
  mattr_accessor :relative_path
  @@relative_path = 'ueditor'

  mattr_accessor :assets_languages
  mattr_accessor :assets_plugins
  @@assets_languages = nil
  @@assets_plugins = nil

  # Ueditor assets path
  mattr_accessor :asset_path
  @@asset_path = nil

  def self.setup
    yield self
  end

  def self.root_path
    @root_path ||= Pathname.new(File.dirname(File.expand_path('../', __FILE__)))
  end

  def self.base_path
    @base_path ||= (asset_path || File.join([Rails.application.config.assets.prefix, '/ueditor/']))
  end

  # All css and js files from ckeditor folder
  def self.assets
    ass = Utils.select_assets('ueditor', 'vendor/assets/javascripts')
    @assets ||= ass
  end

  def self.assets=(value)
    @assets = value.nil? ? nil : Array(value)
  end

  def self.current_user_method(&block)
    @current_user = block if block_given?
    @current_user || DEFAULT_CURRENT_USER
  end
end

require "baidu_ueditor_rails/engine"
