module BaiduUeditorRails
  class BaseController < ActionController::Base
    before_action :authorize

    def authorize
      instance_exec(&BaiduUeditorRails.current_user_method)
    end
  end
end