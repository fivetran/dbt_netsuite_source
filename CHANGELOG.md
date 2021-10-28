# dbt_netsuite_source v0.3.2

## Features
- Added this changelog to capture iterations of the package!
- Added the `customers_pass_through_columns` variable to be leveraged within the `stg_netsuite__customers` model. This variable will allow users to pass through fields which are not natively included to the package staging model. This variable is empty by default and may be overridden within a users root `dbt_project.yml`. ([#10](https://github.com/fivetran/dbt_netsuite_source/pull/10))

## Contributors
- [Yaruis19](https://github.com/Yaruis19) ([#10](https://github.com/fivetran/dbt_netsuite_source/pull/10))

# dbt_netsuite_source v0.1.0 -> v0.3.1
Refer to the relevant release notes on the Github repository for specific details for the previous releases. Thank you!