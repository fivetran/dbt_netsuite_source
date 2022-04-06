# dbt_netsuite_source v0.4.2

## Features
- Added this changelog to capture iterations of the package!
- Removed the `_fivetran_synced` column definition from the `get_customers_columns` macro, as this is consistent with other macros in the project. Previously, this introduced a bug that caused an ambiguous column name error when passing the `_fivetran_synced` column to the `customers_pass_through_columns` variable since the column is not actually listed in the `stg_netsuite__customers` model field list. Now, when passing the `_fivetran_synced` column to the pass through variable, the ambiguous column error no longer happens. ([#16](https://github.com/fivetran/dbt_netsuite_source/pull/16))

## Contributors
- [phillem15](https://github.com/phillem15) ([#16](https://github.com/fivetran/dbt_netsuite_source/pull/16))

# dbt_netsuite_source v0.4.1

## Features
- Added this changelog to capture iterations of the package!
- Added the `subsidiaries_pass_through_columns` variable to be leveraged within the `stg_netsuite__subsidiaries` model. This variable will allow users to pass through fields which are not natively included to the package staging model. This variable is empty by default and may be overridden within a users root `dbt_project.yml`. ([#13](https://github.com/fivetran/dbt_netsuite_source/pull/13))
- Added the `consolidated_exchange_rates_pass_through_columns` variable to be leveraged within the `stg_netsuite__consolidated_exchange_rates` model. This variable will allow users to pass through fields which are not natively included to the package staging model. This variable is empty by default and may be overridden within a users root `dbt_project.yml`. ([#13](https://github.com/fivetran/dbt_netsuite_source/pull/13))

## Contributors
- [phillem15](https://github.com/phillem15) ([#13](https://github.com/fivetran/dbt_netsuite_source/pull/13))

# dbt_netsuite_source v0.4.0
🎉 dbt v1.0.0 Compatibility 🎉
## 🚨 Breaking Changes 🚨
- Adjusts the `require-dbt-version` to now be within the range [">=1.0.0", "<2.0.0"]. Additionally, the package has been updated for dbt v1.0.0 compatibility. If you are using a dbt version <1.0.0, you will need to upgrade in order to leverage the latest version of the package.
  - For help upgrading your package, I recommend reviewing this GitHub repo's Release Notes on what changes have been implemented since your last upgrade.
  - For help upgrading your dbt project to dbt v1.0.0, I recommend reviewing dbt-labs [upgrading to 1.0.0 docs](https://docs.getdbt.com/docs/guides/migration-guide/upgrading-to-1-0-0) for more details on what changes must be made.
- Upgrades the package dependency to refer to the latest `dbt_fivetran_utils`. The latest `dbt_fivetran_utils` package also has a dependency on `dbt_utils` [">=0.8.0", "<0.9.0"].
  - Please note, if you are installing a version of `dbt_utils` in your `packages.yml` that is not in the range above then you will encounter a package dependency error.

# dbt_netsuite_source v0.3.2

## Features
- Added this changelog to capture iterations of the package!
- Added the `customers_pass_through_columns` variable to be leveraged within the `stg_netsuite__customers` model. This variable will allow users to pass through fields which are not natively included to the package staging model. This variable is empty by default and may be overridden within a users root `dbt_project.yml`. ([#10](https://github.com/fivetran/dbt_netsuite_source/pull/10))
- Added the `locations_pass_through_columns` variable to be leveraged within the `stg_netsuite__locations` model. This variable will allow users to pass through fields which are not natively included to the package staging model. This variable is empty by default and may be overridden within a users root `dbt_project.yml`. ([#10](https://github.com/fivetran/dbt_netsuite_source/pull/11))

## Contributors
- [Yaruis19](https://github.com/Yaruis19) ([#10](https://github.com/fivetran/dbt_netsuite_source/pull/10))

# dbt_netsuite_source v0.1.0 -> v0.3.1
Refer to the relevant release notes on the Github repository for specific details for the previous releases. Thank you!
