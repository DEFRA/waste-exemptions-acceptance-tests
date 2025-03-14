# frozen_string_literal: true

class SelectWasteActivitiesPage < BasePage

  # Using waste
  element(:building, "#waste_activities_form_checkbox-1", visible: false)
  element(:burn_fuel, "#waste_activities_form_checkbox-2", visible: false)
  element(:spread_waste, "#waste_activities_form_checkbox-3", visible: false)
  element(:manufacture, "#waste_activities_form_checkbox-4", visible: false)
  element(:sludge, "#waste_activities_form_checkbox-5", visible: false)
  # Disposing of waste
  element(:burn_plant, "#waste_activities_form_checkbox-6", visible: false)
  element(:deposit_spoil, "#waste_activities_form_checkbox-7", visible: false)
  element(:deposit_testing, "#waste_activities_form_checkbox-8", visible: false)
  # Treating waste
  element(:wash, "#waste_activities_form_checkbox-9", visible: false)
  element(:crush, "#waste_activities_form_checkbox-10", visible: false)
  element(:sort, "#waste_activities_form_checkbox-11", visible: false)
  element(:worms, "#waste_activities_form_checkbox-12", visible: false)
  # Storing wate
  element(:store, "#waste_activities_form_checkbox-13", visible: false)

  elements(:activities, "[name='waste_activities_form[temp_waste_activities][]'] + label")

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize
  def submit(args = {})
    building.click if !building.checked? && args.key?(:building)
    burn_fuel.click if !burn_fuel.checked? && args.key?(:burn_fuel)
    spread_waste.click if !spread_waste.checked? && args.key?(:spread)
    manufacture.click if !manufacture.checked? && args.key?(:manufacture)
    sludge.click if !sludge.checked? && args.key?(:sludge)
    burn_plant.click if !burn_plant.checked? && args.key?(:burn_plant)
    deposit_spoil.click if !deposit_spoil.checked? && args.key?(:spoil)
    deposit_testing.click if !deposit_testing.checked? && args.key?(:deposit_testing)
    wash.click if !wash.checked? && args.key?(:wash)
    crush.click if !crush.checked? && args.key?(:crush)
    sort.click if !sort.checked? && args.key?(:sort)
    worms.click if !worms.checked? && args.key?(:worms)
    store.click if !store.checked? && args.key?(:store)
  end

  def check_all_activities_and_submit
    activities.each do |act|
      act.click unless act.checked?
    end
    submit_button.click
  end

  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize
end
