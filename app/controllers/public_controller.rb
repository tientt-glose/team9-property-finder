class PublicController < ApplicationController
  def main
    @properties = Property.lastest
  end
end
