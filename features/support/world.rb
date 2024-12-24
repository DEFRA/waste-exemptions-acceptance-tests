# frozen_string_literal: true

require "pry"

class World

  attr_reader :journey, :bo, :email

  attr_accessor :known_bo_user_email, :known_reg, :known_reg_no, :known_submitted_applicant,
                :reg_to_complete, :completed_reg,
                :last_email, :last_reg, :last_reg_no, :last_reg_edit_token, :last_window

  def initialize
    @journey = JourneyApp.new
    @bo = BackOfficeApp.new
  end

  def data_viewer_user
    Quke::Quke.config.custom["accounts"]["DataViewer"]["username"]
  end

  def admin_team_user
    Quke::Quke.config.custom["accounts"]["AdminTeamUser"]["username"]
  end

  def admin_team_leader
    Quke::Quke.config.custom["accounts"]["AdminTeamLeader"]["username"]
  end

  def developer_user
    Quke::Quke.config.custom["accounts"]["DeveloperUser"]["username"]
  end

  def service_manager
    Quke::Quke.config.custom["accounts"]["ServiceManager"]["username"]
  end

  def finance_user
    Quke::Quke.config.custom["accounts"]["FinanceUser"]["username"]
  end

  def policy_adviser_user
    Quke::Quke.config.custom["accounts"]["PolicyAdviserUser"]["username"]
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
