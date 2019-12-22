class PublicController < ApplicationController
  def main
    if account_signed_in?
      path = current_account.admin? ? accounts_path : dashboard_path
      redirect_to path, flash: { success: "Successfully signed in. Welcome to BDS-Online"} and return
    end

    @properties = Property.lastest
  end
end
