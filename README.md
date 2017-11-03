# Waste exemptions acceptance tests

[![Build Status](https://travis-ci.org/DEFRA/waste-exemptions-acceptance-tests.svg?branch=master)](https://travis-ci.org/DEFRA/waste-exemptions-acceptance-tests)
[![security](https://hakiri.io/github/DEFRA/waste-exemptions-acceptance-tests/master.svg)](https://hakiri.io/github/DEFRA/waste-exemptions-acceptance-tests/master)
[![Dependency Status](https://dependencyci.com/github/DEFRA/waste-exemptions-acceptance-tests/badge)](https://dependencyci.com/github/DEFRA/waste-exemptions-acceptance-tests)

If your business produces waste or emissions that pollute you may require an environmental permit. However you may also be able to get an exemption if your business activities are considered to be easily controlled and only create low risks of pollution.

The waste exemptions service is used by organisations to apply for an exemption.


This project contains the acceptance tests for the service. It is built around [Quke](https://github.com/DEFRA/quke), a Ruby gem that simplifies the process of writing and running Cucumber acceptance tests.

## Pre-requisites

This project is setup to run against version 2.2.2 of Ruby.

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

You can figure how the project runs using [Quke config files](https://github.com/DEFRA/quke#configuration). Before executing this project for the first time you'll need to create an initial `.config.yml` file.

```bash
touch .config.yml
```

Into that file you'll need to add as a minimum this, replacing the example values with ones relevant to the environment under test.

```yaml
app_host: 'https://urlofenvironmenttotest.example.com'
custom:
  accounts:
    SystemUser:
      username: system.user@example.com
      password: SystemUserPassword1
```

If left as that by default when **Quke** is executed it will run against your selected environment using the headless browser **PhantomJS**.

### Custom WEX config

Recently we have needed to add special logic for running the tests in our environments (dev, QA and Pre-prod). Though fine locally tests are failing if the a submit button is 'off the page' i.e. you would need to scroll to click it. Because of this when setting up the tests to run automatically from the Jenkins slave you will need to add the following to the `.config.yml`.

```yaml
custom:
  window_size:
    width: 1000
    height: 2000
```

The project now includes logic to look for this and if present will resize the window accordingly. Ideally this situation should be periodically tested to see if this workaround is still required.

### Back office

The project contains logic to automatically determine the URL to the back office, by assuming `app_host:` is the front office URL for one of our standard environments (development, QA, pre-prod or production).

This means you can run all the tests, even though you have only given **Quke** details for the front office.

However if you're not running the project against one of these standard environments (for example you are running against a deployment in [Heroku](https://heroku.com), or something you have running locally) you can override this logic and simply tell **Quke** the back office URL via an environment variable.

```bash
WEX_BO_URL="http://localhost:3001" bundle exec quke --tags ~@ci
```

## Execution

Simply call

```bash
bundle exec quke
```

You can create [multiple config files](https://github.com/DEFRA/quke#multiple-configs), for example you may wish to have one setup for running against **Chrome**, and another to run against a different environment. You can tell **Quke** which config file to use by adding an environment variable argument to the command.

```bash
QUKE_CONFIG='chrome.config.yml' bundle exec quke
```

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
bundle exec quke --tags ~@functional # Don't run anything with this tag (run everything else)
```

### In this project

To have consistency across the project the following tags are defined and should be used in the following ways

|Tag|Description|
|---|---|
|@frontoffice|Any feature or scenario expected to be run against the front office application|
|@backoffice|Any feature or scenario expected to be run against the back office application|
|@happypath|A scenario which details a complete registration with no errors|
|@functional|Any feature or scenario which is testing just a specific function of the service e.g. validation errors|
|@fix|A feature or scenario that highlights an error or issue with the service that needs to be fixed|
|@ci|A feature that is intended to be run only on our continuous integration service (you should never need to use this tag).|

It's also common practice to use a custom tag whilst working on a new feature or scenario e.g. `@focus` or `@wip`. That is perfectly acceptable but please ensure they are removed before your change is merged.

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
