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
