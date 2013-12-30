class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params)
    @user = resource
    @free = @user.cohort =~ /free/i

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        attach_to_infusionsoft
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      render template: 'users/new'
    end

  end

  def update
    account_update_params = params[:user]

    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to action: :edit
    else
      render "edit"
    end
  end

  def update_plan
    @user = current_user
    role = Role.find(params[:user][:role_ids]) unless params[:user][:role_ids].nil?
    if @user.update_plan(role)
      redirect_to edit_user_registration_path, :notice => 'Updated plan.'
    else
      flash.alert = 'Unable to update plan.'
      render :edit
    end
  end

  def update_card
    @user = current_user
    @user.stripe_token = params[:user][:stripe_token]
    if @user.save
      redirect_to edit_user_registration_path, :notice => 'Updated card.'
    else
      flash.alert = 'Unable to update card.'
      render :edit
    end
  end

  private
  def build_resource(*args)
    super
    resource.add_role('member')
    resource.cohort = params[:cohort]
  end

  def attach_to_infusionsoft
    return unless ENV['FG']
    return if Rails.env.development?
    first_name, last_name = resource.name.split(' ')
    data = {
      :Email => resource.email,
      :FirstName => first_name,
      :LastName => last_name
    }
    icontact_id = Infusionsoft.contact_add_with_dup_check data, 'Email'
    Infusionsoft.email_optin @user.email, "Freelancers Guild"
    Infusionsoft.contact_add_to_group icontact_id, ClassMappings::DEFAULT_IS_MAPPING
    if cohort = ClassMappings.for_cohort(resource.cohort)
      Infusionsoft.contact_add_to_group icontact_id, cohort
    end
    resource.update_attribute :infusionsoft_id, icontact_id
  end

end
