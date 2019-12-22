class PublicController < ApplicationController
  def main
    if account_signed_in?
      redirect_to dashboard_path, flash: { success: "Successfully signed in. Welcome to BDS-Online"} and return
    end

    @properties = Property.lastest
  end
end
