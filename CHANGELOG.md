# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased]
### Fixed
- undefined method 'size' for nil when  running with dry-validation 0.13 (allow 0.13 to be installed)

## [1.1.0] - 2021-06-15
### Added
- Update `dry-validation` to 1.x

## [1.0.1] - 2020-06-30
### Fixed
- `#historic_rate_period`: Do not blow up if no rates

## [1.0.0] - 2020-06-30
### Changed
- Changed `url` to `host` fot the XE API host (defaults to https://xecdapi.xe.com)
- Changed `#convert_from` to accept keyword args named more like the API's param names:
  - `from` instead of the first argument aka `base_currency`
  - `to` instead of the second argument aka `counter_currencies`
  - `amount` instead of the third argument
- No longer raise exception when XE's response contains an error. Developer should use `#success?` on the response instead and inspect `#error` to see details.
### Added
- `historic_rate_period` call to get historic rates over a period

## [0.2.1] - 2016-08-11
### Fixed
- Fix issue when accessing ConvertFromResponse#to and error was raised

## [0.2.0] - 2016-06-30
### Added
- Raise XEClient::AuthenticationError when there's an auth issue
- Raise XEClient::Error for all other errors

## [0.1.0] - 2016-06-22
### Added
- Add initial working version (`#convert_from`)
