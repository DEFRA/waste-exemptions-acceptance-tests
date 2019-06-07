# frozen_string_literal: true

class World

  attr_reader :journey, :bo, :email
  attr_accessor :known_bo_user_email, :known_reg, :known_reg_no, :current_reg, :known_trans_applicant
  attr_accessor :reg_to_complete, :completed_reg
  attr_accessor :last_email, :last_reference, :last_window

  def initialize
    @journey = JourneyApp.new
    @bo = BackOfficeApp.new
    @email = EmailApp.new
  end

  def data_agent_user
    Quke::Quke.config.custom["accounts"]["DataAgent"]["username"]
  end

  def admin_agent_user
    Quke::Quke.config.custom["accounts"]["AdminAgent"]["username"]
  end

  def super_agent_user
    Quke::Quke.config.custom["accounts"]["SuperAgent"]["username"]
  end

  def system_user
    Quke::Quke.config.custom["accounts"]["SystemUser"]["username"]
  end

  def default_password
    ENV["WEX_DEFAULT_PASSWORD"]
  end

  def front_office_url
    Quke::Quke.config.custom["urls"]["front_office"]
  end

  def back_office_url
    Quke::Quke.config.custom["urls"]["back_office"]
  end

  def mail_client_url
    Quke::Quke.config.custom["urls"]["mail_client"]
  end

end
