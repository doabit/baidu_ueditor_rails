# encoding: UTF-8
module BaiduUeditorRails
  class AssetsController < BaiduUeditorRails::BaseController
    protect_from_forgery except: [:upload]

    def index
      json = {
        "imageActionName": 'upload',
        "imageFieldName": 'upfile',
        "imageMaxSize": 2_048_000,
        "imageAllowFiles": ['.png', '.jpg', '.jpeg', '.gif', '.bmp'],
        "imageCompressEnable": true,
        "imageCompressBorder": 1600,
        "imageInsertAlign": 'none',
        "imageUrlPrefix": '',
        'catchRemoteImageEnable': false,
        "imageManagerListSize": 10,
        "imageManagerUrlPrefix": ''
      }
      case params[:uaction]
      when 'config'
        render plain: json.to_json
      when 'upload'
        upload
      when 'list'
        list
      else
        list
      end
    end

    def upload
      file_name = params[:upfile].original_filename
      @asset = Ueditor::Image.new(file: params[:upfile], name: file_name)
      if @asset.save
        render plain: { 'url' => @asset.file.service_url, 'title' => '1', 'state' => 'SUCCESS' }.to_json
      else
        render plain: { 'url' => @asset.file.service_url, 'title' => '1', 'state' => 'error' }.to_json
      end
    end

    def list
      per_page = 15
      start = params[:start]

      @assets = Ueditor::Image.order('id desc').offset(start).limit(per_page)
      str = []
      @assets.each do |asset|
        str.push("url": asset.file.service_url.to_s, "mtime": asset.created_at)
      end

      s = { 'state' => 'SUCCESS', 'list' => str, 'start' => start, 'total' => Ueditor::Image.count }
      render json: s
    end

    # def file_upload
    #   # file_types = { 'application/zip' => '.zip', 'application/octet-stream' => '.rar',
    #   #  'text/plain' => '.txt', 'application/msword' => '.doc' }
    #   original = params[:Filedata].original_filename
    #   @file = Ueditor::AttachmentFile.new(file: params[:Filedata], name: original)
    #   filename = ''
    #   state = '失败'
    #   file_type = ''
    #   # binding.pry
    #   if @file.save
    #     state = 'SUCCESS'
    #     file_url = @file.service_url
    #     file_type = ".#{@file.asset_url.split('.').last}"
    #     # echo '{"state":"' . $state . '","url":"' . $fileName . '","fileType":"'
    #     # . $current_type . '","original":"'.$clientFile["name"] .'"}';
    #   else
    #     state = '上传失败'
    #   end
    #   render json: { state: state, url: file_url, fileType: file_type, original: original }
    # end
  end
end