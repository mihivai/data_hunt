class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    data_hacker_path
  end
end
