# Waste exemptions acceptance tests

![Build Status](https://github.com/DEFRA/waste-exemptions-acceptance-tests/workflows/CI/badge.svg?branch=main)

If your business produces waste or emissions that pollute you may require an environmental permit. However you may also be able to get an exemption if your business activities are considered to be easily controlled and only create low risks of pollution.

The Waste Exemptions service is used by organisations to apply for an exemption.

This project contains the acceptance tests for the service. It is built around [Quke](https://github.com/DEFRA/quke), a Ruby gem that simplifies the process of writing and running Cucumber acceptance tests.

## Pre-requisites

This project is setup to run against version 2.7.1 of Ruby.

The rest of the pre-requisites are the same as those for [Quke](https://github.com/DEFRA/quke#pre-requisites).

## Installation

First clone the repository and then drop into your new local repo

```bash
git clone https://github.com/DEFRA/waste-exemptions-acceptance-tests.git && cd waste-exemptions-acceptance-tests
```

Next download and install the dependencies

```bash
bundle install
```

## Configuration

You can figure how the project runs using [Quke config files](https://github.com/DEFRA/quke#configuration).

Quke relies on yaml files to configure how the tests are run, the default being .config.yml
You'll need to set the environment variable `WEX_DEFAULT_PASSWORD` to the appropriate password to enable authentication into the back office.

If left as that by default when Quke is executed it will run against your selected environment using Chrome.

## Execution

Simply call

```bash
bundle exec quke
```

You can create [multiple config files](https://github.com/DEFRA/quke#multiple-configs), for example you may wish to have one setup for running against **Chrome**, and another to run against a different environment. You can tell **Quke** which config file to use by adding an environment variable argument to the command.

```bash
QUKE_CONFIG='chrome.config.yml' bundle exec quke
```

### Rake tasks

Within this project a series of [Rake](https://github.com/ruby/rake) tasks have been added. Each rake task is configured to run one of the configuration files already setup. To see the list of available commands run

```bash
bundle exec rake -T
```

You can then run your chosen configuration e.g. `bundle exec rake chrome70_osx`

## Use of tags

[Cucumber](https://cucumber.io/) has an inbuilt feature called [tags](https://github.com/cucumber/cucumber/wiki/Tags).

These can be added to a [feature](https://github.com/cucumber/cucumber/wiki/Feature-Introduction) or individual **scenarios**.

```gherkin
@functional
Feature: Validations within the digital service
```

```gherkin
@frontoffice @happypath
Scenario: Registration by an individual
```

When applied you then have the ability to filter which tests will be used during any given run

```bash
bundle exec quke --tags @frontoffice # Run only things tagged with this
bundle exec quke --tags @frontoffice,@happypath # Run all things with these tags
bundle exec quke --tags "not @functional" # Don't run anything with this tag (run everything else)
```

### In this project

To have consistency across the project the following tags are defined and should be used in the following ways

|Tag|Description|
|---|---|
|@frontoffice|Any feature or scenario expected to be run against the front office application|
|@backoffice|Any feature or scenario expected to be run against the back office application|
|@ci|A feature that is intended to be run only on our continuous integration service (you should never need to use this tag).|
|@email|Regression tests some scenarios that interact with an email client|
|@data|Steps that rely on pre-existing data being generated|
|@smoke|Core tests to check that registrations and renewals on the front and back office are working|

Each test also has its own unique tag in case it needs to be run in isolation.

It's also common practice to use a custom tag whilst working on a new feature or scenario e.g. `@focus` or `@wip`. That is perfectly acceptable but please ensure they are removed before your change is merged.

## Project outline

This hopefully will help new starters to the project and Cucumber understand the lifecyle of a scenario.

### Before hooks

Before the scenario runs any [before hooks](https://docs.cucumber.io/cucumber/api/#before) defined in the project will be run. In this project we currently have 3:

- One that always runs, which is used to copy the global `$world_state` to an instance used for the current run
- One that if the scenario is tagged `@data` will generate some registrations and a user. Logic in the hook ensures this is only run once, and is used as a handy way of having known data that can be used across multiple scenarios
- One that if the scenario is tagged `@email` will setup the project ready to interact with the email client (which depends on whether the tests are running against a local instance, or one of our environments)

Specifically to explain `state` in Cucumber, unlike a typical program everything is `loaded` when the scenario executes. This means all helpers, page objects and step definitions are available to use across the project. Set `@my_var` to `"Hello"` in one step, and it will be available in all other steps, helpers and page objects.

However when the scenario finishes `@my_var` will no longer hold anything. So to persist values between scenarios we use the `$world_state` global object. You are advised to add any values you wish to persist to the `@world` instance which you will see used throughout the project, as we have logic that will ensure it is available in subsequent scenarios.

### Background

Next up if the scenario is in a feature with a `Background` defined the steps in it will be run first. Only then will the scenario itself be run.

### Accessibility

This repository includes the ability to check the currently loaded page for accessibility violations. It uses [axe-core-capybara](https://github.com/dequelabs/axe-core-gems/blob/develop/packages/axe-core-capybara/) and [axe-core-cucumber](https://github.com/dequelabs/axe-core-gems/blob/develop/packages/axe-core-cucumber).

To call it, use the following step:

```gherkin
Then the page should be axe clean

# or call this within another step using
step("the page should be axe clean")
```

This calls all of Axe's accessibility rules and is useful to find best practice. However, our minimum standard is to focus on Web Content Accessibility Guidelines v2.1 to levels A and AA, so we want the tests to pass if so. Use this step to reduce the scope:

```gherkin
Then the page should be axe clean according to: wcag21a, wcag21aa
```

Also refer to [Axe API documentation](https://github.com/dequelabs/axe-core/blob/develop/doc/API.md) for more detail.

Finally, remember that automated testing is not a substitute for manual testing.

### After hooks

Last thing to run is any [after hooks](https://docs.cucumber.io/cucumber/api/#after) hooks we have defined. In this project we have 2

- One that always runs, which is used to copy the instance of `@world` into `$world_state` so it can be used in any subsequent scenarios
- One that if the scenario is tagged `@backoffice` will run. In this case it is to reset the session. Because we first need to login for all back office scenarios, if we didn't reset the session then when the next scenario starts it would fail. This is because it will be expecting to interact with the login page but the app will have already logged them in because it can see a valid session

## Tips

In our experience one of the most complex and time consuming aspects of creating new features is identifying the right [CSS selector](http://www.w3schools.com/cssref/css_selectors.asp) to use, to pick the HTML element you need to work with.

A tool we have found useful is a Chrome addin called [SelectorGadget](http://selectorgadget.com/).

You can also test them using the Chrome developer tools. Open them up, select the elements tab and then `ctrl/cmd+f`. You should get an input field into which you can enter your selector and confirm/test its working. See <https://developers.google.com/web/updates/2015/05/search-dom-tree-by-css-selector>

## Contributing to this project

If you have an idea you'd like to contribute please log an issue.

All contributions should be submitted via a pull request.

## License

THIS INFORMATION IS LICENSED UNDER THE CONDITIONS OF THE OPEN GOVERNMENT LICENCE found at:

http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3

The following attribution statement MUST be cited in your products and applications when using this information.

> Contains public sector information licensed under the Open Government license v3

### About the license

The Open Government Licence (OGL) was developed by the Controller of Her Majesty's Stationery Office (HMSO) to enable information providers in the public sector to license the use and re-use of their information under a common open licence.

It is designed to encourage use and re-use of information freely and flexibly, with only a few conditions.
