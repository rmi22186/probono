RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.excluded_models = %w[ApartmentUser BuildingUser]

  config.model User do
    object_label_method do
      :user_label_method
    end
    list do
      field :first_name
      field :last_name
      field :email
      field :apartment_validation
      field :approved
      items_per_page 100
    end

    show do
      field :first_name
      field :last_name
      field :email
      field :apartment_validation
      field :emergency_contact_name
      field :emergency_contact_phone
      field :emergency_contact_relationship
      field :approved
      field :active
      field :role
    end

    edit do
      field :approved
      field :role
      field :active
    end
  end
    
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
