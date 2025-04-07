# dbt_netsuite_source v0.12.0-a1

## Breaking Schema Changes
- Added optional `fiscalcalendar` source table to support accurate fiscal year start dates (currently defaulted to calendar year). This table and related models (`stg_netsuite2__fiscal_calendar_tmp` and `stg_netsuite2__fiscal_calendar`) are disabled by default. To enable this feature:
  - Quickstart users: enable the fiscalcalendar table in the connection schema tab.
  - dbt Core users: enable the fiscalcalendar table in the connection schema tab and also set the `netsuite2__fiscal_calendar_enabled` variable to true (default is false).

## Documentation
- Corrected references to connectors and connections in the README. ([#60](https://github.com/fivetran/dbt_netsuite_source/pull/60))

# dbt_netsuite_source v0.11.1
[PR #59](https://github.com/fivetran/dbt_netsuite_source/pull/59) includes the following updates:

## Macro Updates
- Introduced a local version of the `fill_pass_through_columns` macro that directly calls the variables within our staging models. This removes the existing string-to-variable conversion and leads to cleaner parsing.
  - This new macro has no functional changes from the previous macro and will not require customers to make any changes on their end.
- This new macro is applied to all staging models with passthrough column functionality, and replaces the existing `fill_pass_through_columns` macro.
  - `stg_netsuite` and `stg_netsuite2` models impacted include: `accounts`, `classes`, `consolidated_exchange_rates`, `customers`, `departments`, `items`, `locations`, `subsidiaries`, `transaction_lines`, `transactions`, and `vendors`.
- Similar changes are being made on a simultaneous release to the `persist_pass_through_columns` macro in the `dbt_netsuite` package. [See the release notes](https://github.com/fivetran/dbt_netsuite/releases/tag/v0.17.1) for more details.
- The process for adding passthrough columns remains unchanged. [Consult the README](https://github.com/fivetran/dbt_netsuite?tab=readme-ov-file#passing-through-additional-fields) for more details.

## Documentation Update
- Moved badges at top of the README below the H1 header to be consistent with popular README formats.

# dbt_netsuite_source v0.11.0
[PR #57](https://github.com/fivetran/dbt_netsuite_source/pull/57) includes the following update: 

## Breaking Changes 
- Casted specific timestamp fields across all staging models as dates where the Netsuite UI does not perform timezone conversion. Keeping these fields as type timestamp causes issues in reporting tools that perform automatic timezone conversion. 
  - As this will change the datatype of the underlying fields, this will require a  `--full-refresh` for downstream incremental models.
- Existing fields that were converted from timestamp to date in the following `stg_netsuite2__*` models:

| **Table**   | **Source Field Name** | **Field Alias** | 
| -------- | ------- | ------- | 
| accounting_periods | startdate | starting_at | 
| accounting_periods | enddate | ending_at |
| customers | firstorderdate | date_first_order_at |
| transactions | closedate | closed_at |
| transactions | duedate | due_date_at |
| transactions | trandate | transaction_date |
  
- Adds additional commonly used fields within the `stg_netsuite2__*` models.

| **Table**  | **Source Field Name** | **Field Alias** | 
| -------- | ------- | ------- | 
| accounts | accountsearchdisplaynamecopy | display_name | 
| customers | altname | alt_name |
| subsidiaries | iselimination | is_elimination |
| transaction_accounting_lines | exchangerate | exchange_rate |
| transaction_lines | eliminate | is_eliminate |
| transaction_lines | netamount | netamount |
| transactions | reversal | reversal_transaction_id |
| transactions | reversaldate | reversal_date |
| transactions | reversaldefer | is_reversal_defer | 

> **IMPORTANT**: Nearly all of the affected models have pass-through functionality. If you have already been using passthrough column variables to include the above newly added fields (without aliases), you **MUST** remove the fields from your passthrough variable configuration in order to avoid duplicate column errors.

## Feature Updates
- Introduced the `stg_netsuite2__employees` model to bring in data from the `employee` source table. 
  - Since this model is only used by a subset of customers, we've introduced the variable `netsuite2__using_employees` to allow users who don't utilize the `employee` table in Netsuite2 the ability to disable that functionality within your `dbt_project.yml`. This value is set to true by default. [Instructions are available in the README for how to disable this variable](https://github.com/fivetran/dbt_netsuite_source/?tab=readme-ov-file#step-5-disable-models-for-non-existent-sources-netsuite2-only). 

## Under the Hood
- Created new seed data in `integration_tests` to support the new `stg_netsuite2__employees` model, as well as the new fields introduced into the new Netsuite2 staging models.

## Contributors
- [@jmongerlyra](https://github.com/jmongerlyra) ([PR #54](https://github.com/fivetran/dbt_netsuite_source/pull/54))

# dbt_netsuite_source v0.10.1
[PR #51](https://github.com/fivetran/dbt_netsuite_source/pull/51) includes the following update: 

## Feature Update
- Added the `entities_pass_through_columns` variable to be leveraged within the `stg_netsuite2__entities` model. This variable will allow users to pass through fields which are not natively included to the package staging model.
  - Removed fields from the `get_entity_columns` macro that are not brought into the `stg_netsuite2__entities` model to ensure that the passthrough feature works properly.
 
## Contributors:
- [@FrankTub](https://github.com/FrankTub) ([PR #51](https://github.com/fivetran/dbt_netsuite_source/pull/51))

# dbt_netsuite_source v0.10.0
[PR #47](https://github.com/fivetran/dbt_netsuite_source/pull/47) includes the following update:
## 🚨 Breaking Changes 🚨
- Added column `_fivetran_synced_date` to model `stg_netsuite2__transactions` for use in downstream models.
- To reduce storage, updated default materialization of staging models to views. 
>  ⚠️ Running a `--full-refresh` will be required if you have previously run these staging models as tables and get the following error: 
> ```
> Trying to create view <model path> but it currently exists as a table. Either drop <model path> manually, or run dbt with `--full-refresh` and dbt will drop it for you.
> ```

## Under the Hood:
- Added integration testing pipeline for Databricks SQL Warehouse.
- Included auto-releaser GitHub Actions workflow to automate future releases.

# dbt_netsuite_source v0.9.0
[PR #42](https://github.com/fivetran/dbt_netsuite_source/pull/42) includes the following update:
## 🚨 Breaking Changes 🚨:
- Addition of the `currency` field as `currency_id` within the `stg_netsuite2__subsidiaries` model.
  - This addition likely won't be breaking for a large number of users. However, if you are leveraging the `subsidiaries_pass_through_columns` variable and have included `currency` as a pass through column, you will experience a duplicate column error. We advise you remove the `currency` field as a pass through column to avoid runtime errors following this upgrade.

## Contributors:
- [@jmongerlyra](https://github.com/jmongerlyra) ([PR #41](https://github.com/fivetran/dbt_netsuite_source/pull/41))

# dbt_netsuite_source v0.8.0
## 🚨 Breaking Changes 🚨:
- Addition of the `is_eliminate` and `special_account_type_id` fields within the `stg_netsuite2__accounts` model. ([PR #39](https://github.com/fivetran/dbt_netsuite_source/pull/39) and [PR #40](https://github.com/fivetran/dbt_netsuite_source/pull/40))
  - This addition likely won't be breaking for a large number of users. However, if you are leveraging the `accounts_pass_through_columns` variable and have included either `eliminate` or `sspecacct` as a pass through columns then you will experience a duplicate column error. We advise you remove the `eliminate` and `sspecacct` fields as a pass through columns to avoid runtime errors following this upgrade.

## Contributors:
- [@jmongerlyra](https://github.com/jmongerlyra) ([PR #40](https://github.com/fivetran/dbt_netsuite_source/pull/40))

# dbt_netsuite_source v0.7.0
## 🚨 Breaking Changes 🚨:

- Brought in `accounting_book_id` (accountingbook) to the `stg_netsuite2__consolidated_exchange_rates` model. ([PR #36](https://github.com/fivetran/dbt_netsuite_source/pull/36)) 
   - Due to logic within the dbt_netsuite v0.8.1 package version, this update will result in an ambiguous columns error. Therefore, this update is treated as a breaking change.

# dbt_netsuite_source v0.6.3

[PR #35](https://github.com/fivetran/dbt_netsuite_source/pull/35) applies the following changes:

## 🎉 Feature Updates 🎉
- Introduces variable `netsuite2__using_exchange_rate` to allow users who don't utilize exchange rates in Netsuite2 the ability to disable that functionality within your `dbt_project.yml`, since these models aren't being used.
- **Note**: If you are using the `dbt_netsuite` package, be sure to set it globally by inserting this code into your `dbt_project.yml`:
```yml
vars:
  netsuite2__using_exchange_rate: false
```

## Under the Hood:
- Incorporated the new `fivetran_utils.drop_schemas_automation` macro into the end of each Buildkite integration test job.
- Updated the pull request [templates](/.github).

# dbt_netsuite_source v0.6.2

## 🎉 Feature Updates 🎉
- Introduces the `netsuite2__using_jobs` variable in order to disable the `stg_netsuite2__jobs` model. Set `netsuite2__using_jobs` to `False` if you do not have the `job` table in your Netsuite2 schema ([PR #30](https://github.com/fivetran/dbt_netsuite_source/pull/30)).

## Contributors 
- [ropalloni](https://github.com/ropalloni) ([#29](https://github.com/fivetran/dbt_netsuite_source/issues/29))

# dbt_netsuite_source v0.6.1

## Bug Fixes
- In [v0.6.0](https://github.com/fivetran/dbt_netsuite_source/blob/main/CHANGELOG.md#dbt_netsuite_source-v060), we introduced pass through columns for the `vendors` and `items` tables. However, this update was only applied to the original `Netsuite` version of this package, and not `Netsuite2` as well. These pass through columns are accessible in Netsuite2 data models ([PR #27](https://github.com/fivetran/dbt_netsuite_source/pull/27/)).

## 🎉 Feature Updates 🎉
- Now introducing...Databricks compatibility 🧱 ([PR #26](https://github.com/fivetran/dbt_netsuite_source/pull/26))

# dbt_netsuite_source v0.6.0

## 🚨 Breaking Changes 🚨:
[PR #24](https://github.com/fivetran/dbt_netsuite_source/pull/24) includes the following breaking changes:
- Dispatch update for dbt-utils to dbt-core cross-db macros migration. Specifically `{{ dbt_utils.<macro> }}` have been updated to `{{ dbt.<macro> }}` for the below macros:
    - `any_value`
    - `bool_or`
    - `cast_bool_to_text`
    - `concat`
    - `date_trunc`
    - `dateadd`
    - `datediff`
    - `escape_single_quotes`
    - `except`
    - `hash`
    - `intersect`
    - `last_day`
    - `length`
    - `listagg`
    - `position`
    - `replace`
    - `right`
    - `safe_cast`
    - `split_part`
    - `string_literal`
    - `type_bigint`
    - `type_float`
    - `type_int`
    - `type_numeric`
    - `type_string`
    - `type_timestamp`
    - `array_append`
    - `array_concat`
    - `array_construct`
- For `current_timestamp` and `current_timestamp_in_utc` macros, the dispatch AND the macro names have been updated to the below, respectively:
    - `dbt.current_timestamp_backcompat`
    - `dbt.current_timestamp_in_utc_backcompat`
- `dbt_utils.surrogate_key` has also been updated to `dbt_utils.generate_surrogate_key`. Since the method for creating surrogate keys differ, we suggest all users do a `full-refresh` for the most accurate data. For more information, please refer to dbt-utils [release notes](https://github.com/dbt-labs/dbt-utils/releases) for this update.
- `packages.yml` has been updated to reflect new default `fivetran/fivetran_utils` version, previously `[">=0.3.0", "<0.4.0"]` now `[">=0.4.0", "<0.5.0"]`.

## Features
- Added the `vendors_pass_through_columns` variable to be leveraged within the `stg_netsuite__vendors` model. This variable will allow users to pass through fields which are not natively included to the package staging model. This variable is empty by default and may be overridden within a users root `dbt_project.yml`. ([#23](https://github.com/fivetran/dbt_netsuite_source/pull/23))
- Added the `items_pass_through_columns` variable to be leveraged within the `stg_netsuite__items` model. This variable will allow users to pass through fields which are not natively included to the package staging model. This variable is empty by default and may be overridden within a users root `dbt_project.yml`.  ([#23](https://github.com/fivetran/dbt_netsuite_source/pull/23))

## Contributors
- [rpalloni](https://github.com/rpalloni) ([#23](https://github.com/fivetran/dbt_netsuite_source/pull/23))

# dbt_netsuite_source v0.5.1

## Features 🎉 (affects Netsuite2 users only)
- Introduces the `netsuite2__multibook_accounting_enabled` and `netsuite2__using_vendor_categories` variables to disable their related source tables and downstream models ([#21](https://github.com/fivetran/dbt_netsuite_source/pull/21)).
  - `netsuite2__multibook_accounting_enabled` is `True` by default. Set it to `False` if you do not use the [Multi-Book Accounting](https://docs.oracle.com/en/cloud/saas/netsuite/ns-online-help/book_3831565332.html) feature in Netsuite and/or do not have the `accountingbook` and `accountingbooksubsidiaries` source tables.
  - `netsuite2__using_vendor_categories` is `True` by default. Set it to `False` if you do not categorize vendors in Netsuite and/or do not have the `vendorcategory` source table.

# dbt_netsuite_source v0.5.0
🎉 [Netsuite2](https://docs.oracle.com/en/cloud/saas/netsuite/ns-online-help/article_163465025391.html) Compatibility 🎉
PRs [#15](https://github.com/fivetran/dbt_netsuite_source/pull/15) and [#17](https://github.com/fivetran/dbt_netsuite_source/pull/17) include the following update to the dbt_netsuite_source package:
## 🚨 Breaking Changes 🚨
- The declaration of passthrough variables within your root `dbt_project.yml` has changed. To allow for more flexibility and better tracking of passthrough columns, you will now want to define passthrough columns in the following format:
> This applies to all passthrough columns within the `dbt_netsuite_source` package and not just the `customers_pass_through_columns` example.
```yml
vars:
  customers_pass_through_columns:
    - name: "my_field_to_include" # Required: Name of the field within the source.
      alias: "field_alias" # Optional: If you wish to alias the field within the staging model.
      transform_sql: "cast(field_alias as string)" # Optional: If you wish to define the datatype or apply a light transformation.
```
## Features 🎉
- Addition of the `netsuite_data_model` variable. This variable may either be `netsuite` (the original Netsuite.com connector endpoint) or `netsuite2` (the new Netsuite2 connector endpoint).
  - The variable is set to `netsuite` by default. If you wish to run the data models for the Netsuite2 connector, you may simply change the variable within your root dbt_project.yml to `netsuite2`.
- Postgres compatibility!
- Added identifier variables to each Netsuite.com and Netsuite2 source to enable dynamic source table-name adjustments.
- Applied schema level tests to each source table to ensure data validation.
- README updates for easier navigation and package use.

## Contributors
- [@jamesrayoub](https://github.com/jamesrayoub) [#15](https://github.com/fivetran/dbt_netsuite_source/pull/15)
# dbt_netsuite_source v0.4.2
## Features
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
