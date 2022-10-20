# frozen_string_literal: true

require "pry"

class World

  attr_reader :journey, :bo, :email

  attr_accessor :known_bo_user_email, :known_reg, :known_reg_no, :known_submitted_applicant,
                :reg_to_complete, :completed_reg,
                :last_email, :last_reg, :last_reg_no, :last_window

  def initialize
    @journey = JourneyApp.new
    @bo = BackOfficeApp.new
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

  def developer_user
    Quke::Quke.config.custom["accounts"]["DeveloperUser"]["username"]
  end

  def default_password
    ENV.fetch("WEX_DEFAULT_PASSWORD", nil)
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
