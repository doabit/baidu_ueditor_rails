module Ueditor
  class Asset < ApplicationRecord
    self.table_name = "ueditor_assets"
    has_one_attached :file
  end
end