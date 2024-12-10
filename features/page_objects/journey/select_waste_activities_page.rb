# frozen_string_literal: true

class SelectWasteActivitiesPage < BasePage

  # Using waste
  element(:building, "#waste_activities_form_checkbox-1 + label")
  element(:burn_fuel, "#waste_activities_form_checkbox-2 + label")
  element(:spread_waste, "#waste_activities_form_checkbox-3 + label")
  element(:manufacture, "#waste_activities_form_checkbox-4 + label")
  element(:sludge, "#waste_activities_form_checkbox-5 + label")
  # Disposing of waste
  element(:burn_plant, "#waste_activities_form_checkbox-6 + label")
  element(:deposit_spoil, "#waste_activities_form_checkbox-7 + label")
  element(:deposit_testing, "#waste_activities_form_checkbox-8 + label")
  # Treating waste
  element(:wash, "#waste_activities_form_checkbox-9 + label")
  element(:crush, "#waste_activities_form_checkbox-10 + label")
  element(:sort, "#waste_activities_form_checkbox-11 + label")
  element(:worms, "#waste_activities_form_checkbox-12 + label")
  # Storing wate
  element(:store, "#waste_activities_form_checkbox-13 + label")

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize
  def submit(args = {})
    building.click if args.key?(:building)
    burn_fuel.click if args.key?(:burn_fuel)
    spread_waste.click if args.key?(:spread)
    manufacture.click if args.key?(:manufacture)
    sludge.click if args.key?(:sludge)
    burn_plant.click if args.key?(:burn_plant)
    deposit_spoil.click if args.key?(:spoil)
    deposit_testing.click if args.key?(:deposit_testing)
    wash.click if args.key?(:wash)
    crush.click if args.key?(:crush)
    sort.click if args.key?(:sort)
    worms.click if args.key?(:worms)
    store.click if args.key?(:store)
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize
end
