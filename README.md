<p align="center">
    <a alt="License"
        href="https://github.com/fivetran/dbt_netsuite_source/blob/main/LICENSE">
        <img src="https://img.shields.io/badge/License-Apache%202.0-blue.svg" /></a>
    <a alt="dbt-core">
        <img src="https://img.shields.io/badge/dbt_Core™_version->=1.3.0_<2.0.0-orange.svg" /></a>
    <a alt="Maintained?">
        <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" /></a>
    <a alt="PRs">
        <img src="https://img.shields.io/badge/Contributions-welcome-blueviolet" /></a>
    <a alt="Fivetran Quickstart Compatible"
        href="https://fivetran.com/docs/transformations/dbt/quickstart">
        <img src="https://img.shields.io/badge/Fivetran_Quickstart_Compatible%3F-yes-green.svg" /></a>
</p>

# Netsuite Source dbt Package ([Docs](https://fivetran.github.io/dbt_netsuite_source/))
# 📣 What does this dbt package do?
<!--section="netsuite_source_model"-->
- Materializes [Netsuite staging tables](https://fivetran.github.io/dbt_netsuite_source/#!/overview/netsuite_source/models/?g_v=1&g_e=seeds) which leverage data in the format described by [this ERD](https://fivetran.com/docs/applications/netsuite#schemainformation). These staging tables clean, test, and prepare your Netsuite data from [Fivetran's connector](https://fivetran.com/docs/applications/netsuite) for analysis by doing the following:
  - Name columns for consistency across all packages and for easier analysis
  - Adds freshness tests to source data
  - Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
- Generates a comprehensive data dictionary of your netsuite data through the [dbt docs site](https://fivetran.github.io/dbt_netsuite_source/).
- These tables are designed to work simultaneously with our [Netsuite transformation package](https://github.com/fivetran/dbt_netsuite).
<!--section-end-->

# 🎯 How do I use the dbt package?
## Step 1: Prerequisites
To use this dbt package, you must have At least either one Fivetran **Netsuite** (netsuite.com) or **Netsuite2** (netsuite2) connector syncing the respective tables to your destination:
### Netsuite.com
- accounts
- accounting_periods
- accounting_books
- consolidated_exchange_rates
- currencies
- customers
- classes
- departments
- expense_accounts
- income_accounts
- items
- locations
- partners
- transaction_lines
- transactions
- subsidiaries
- vendors
- vendor_types

### Netsuite2
- account
- accounttype
- accountingbooksubsidiary
- accountingperiodfiscalcalendar
- accountingperiod
- accountingbook
- consolidatedexchangerate
- currency
- customer
- classification
- department
- entity
- entityaddress
- item
- job
- location
- locationmainaddress
- transactionaccountingline
- transactionline
- transaction
- subsidiary
- vendor
- vendorcategory

### Database Compatibility
This package is compatible with either a **BigQuery**, **Snowflake**, **Redshift**, **PostgreSQL**, or **Databricks** destination.

### Databricks dispatch configuration
If you are using a Databricks destination with this package, you must add the following (or a variation of the following) dispatch configuration within your `dbt_project.yml`. This is required in order for the package to accurately search for macros within the `dbt-labs/spark_utils` then the `dbt-labs/dbt_utils` packages respectively.
```yml
dispatch:
  - macro_namespace: dbt_utils
    search_order: ['spark_utils', 'dbt_utils']
```

## Step 2: Install the package (skip if also using the `Netsuite` transformation package)
If you  are **not** using the [Netsuite transformation package](https://github.com/fivetran/dbt_netsuite), include the following package version in your `packages.yml` file. If you are installing the transform package, the source package is automatically installed as a dependency.
> TIP: Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.
```yaml
packages:
  - package: fivetran/netsuite_source
    version: [">=0.10.0", "<0.11.0"]
```

## Step 3: Define Netsuite.com or Netsuite2 Source
As of April 2022 Fivetran made available a new Netsuite connector which leverages the Netsuite2 endpoint opposed to the original Netsuite.com endpoint. This package is designed to run for either or, not both. By default the `netsuite_data_model` variable for this package is set to the original `netsuite` value which runs the netsuite.com version of the package. If you would like to run the package on Netsuite2 data, you may adjust the `netsuite_data_model` variable to run the `netsuite2` version of the package.
```yml
vars:
    netsuite_data_model: netsuite2 #netsuite by default
```

## Step 4: Define database and schema variables
### Option 1: Single connector 💃
By default, this package runs using your destination and the `netsuite` schema. If this is not where your Netsuite data is (for example, if your netsuite schema is named `netsuite_fivetran`), add the following configuration to your root `dbt_project.yml` file:

```yml
vars:
    netsuite_database: your_destination_name
    netsuite_schema: your_schema_name 
```
> **Note**: If you are running the package on one source connector, each model will have a `source_relation` column that is just an empty string.

### Option 2: Union multiple connectors (Netsuite2 only) 👯
If you have multiple Netsuite2 connectors in Fivetran and would like to use this package on all of them simultaneously, we have provided functionality to do so. The package will union all of the data together and pass the unioned table into the transformations. You will be able to see which source it came from in the `source_relation` column of each model. To use this functionality, you will need to set either the `netsuite2_union_schemas` OR `netsuite2_union_databases` variables (cannot do both, though a more flexible approach is in the works...) in your root `dbt_project.yml` file:

```yml
# dbt_project.yml

vars:
    netsuite2_union_schemas: ['netsuite2_usa','netsuite2_canada'] # use this if the data is in different schemas/datasets of the same database/project
    netsuite2_union_databases: ['netsuite2_usa','netsuite2_canada'] # use this if the data is in different databases/projects but uses the same schema name
```

#### Recommended: Incorporate unioned sources into DAG
By default, this package defines one single-connector source, called `netsuite2`, which will be disabled if you are unioning multiple connectors. This means that your DAG will not include your Netsuite2 sources, though the package will run successfully.

To properly incorporate all of your Netsuite2 connectors into your project's DAG:
1. Define each of your sources in a `.yml` file in your project. Utilize the following template for the `source`-level configurations, and, **most importantly**, copy and paste the table and column-level definitions from the package's `src_netsuite2.yml` [file](https://github.com/fivetran/dbt_netsuite_source/blob/main/models/netsuite2/src_netsuite2.yml#L15-L607).

```yml
# a .yml file in your root project
sources:
  - name: <name> # ex: netsuite2_usa
    schema: <schema_name> # one of var('netsuite2_union_schemas') if unioning schemas, otherwise just 'netsuite2'
    database: <database_name> # one of var('netsuite2_union_databases') if unioning databases, otherwise whatever DB your netsuite2 schemas all live in
    loader: fivetran
    loaded_at_field: _fivetran_synced

    freshness: # feel free to adjust to your liking
      warn_after: {count: 72, period: hour}
      error_after: {count: 168, period: hour}

    tables: # copy and paste from models/netsuite2/src_netsuite2.yml 
```

> **Note**: If there are source tables you do not have (see [Step 4](https://github.com/fivetran/dbt_netsuite_source?tab=readme-ov-file#step-5-disable-models-for-non-existent-sources-netsuite2-only)), you may still include them, as long as you have set the right [variables](https://github.com/fivetran/dbt_netsuite_source?tab=readme-ov-file#step-5-disable-models-for-non-existent-sources-netsuite2-only) to `False`. Otherwise, you may remove them from your source definitions.

2. Set the `has_defined_sources` variable (scoped to the `netsuite_source` package) to `True`, like such:
```yml
# dbt_project.yml
vars:
  netsuite_source:
    has_defined_sources: true
```

## Step 5: Disable models for non-existent sources (Netsuite2 only)
> _This step is unnecessary (but still available for use) if you are unioning multiple connectors together in the previous step. That is, the `union_data` macro we use will create completely empty staging models for sources that are not found in any of your Netsuite2 schemas/databases. However, you can still leverage the below variables if you would like to avoid this behavior._

It's possible that your Netsuite connector does not sync every table that this package expects. If your syncs exclude certain tables, it is because you either don't use that feature in Netsuite or actively excluded some tables from your syncs. To disable the corresponding functionality in the package, you must add the relevant variables. By default, all variables are assumed to be true. Add variables for only the tables you would like to disable:
```yml
vars:
    netsuite2__multibook_accounting_enabled: false # True by default. Disable `accountingbooksubsidiary` and `accountingbook` if you are not using the Multi-Book Accounting feature
    netsuite2__using_exchange_rate: false #True by default. Disable `exchange_rate` if you don't utilize exchange rates. If you set this variable to false and are using the `netsuite` transformation package, ensure it is scoped globally so that the `netsuite` package can access it as well.  
    netsuite2__using_vendor_categories: false # True by default. Disable `vendorcategory` if you don't categorize your vendors
    netsuite2__using_jobs: false # True by default. Disable `job` if you don't use jobs

```
> **Note**: The Netsuite dbt package currently only supports disabling transforms of [Multi-Book Accounting](https://docs.oracle.com/en/cloud/saas/netsuite/ns-online-help/book_3831565332.html) related tables (`accountingbooksubsidiary` and `accountingbook`), the `vendorcategory` source table, and the `job` source table. Please create an issue to request additional tables and/or [features](https://docs.oracle.com/en/cloud/saas/netsuite/ns-online-help/bridgehead_N233872.html) to exclude. 
> 
> To determine if a table or field is activated by a feature, access the [Records Catalog](https://docs.oracle.com/en/cloud/saas/netsuite/ns-online-help/article_159367781370.html).

## (Optional) Step 6: Additional configurations
<details open><summary>Expand/collapse configurations</summary>

### Passing Through Additional Fields
This package includes all source columns defined in the macros folder. You can add more columns using our pass-through column variables. These variables allow for the pass-through fields to be aliased (`alias`) and casted (`transform_sql`) if desired, but not required. Datatype casting is configured via a sql snippet within the `transform_sql` key. You may add the desired sql while omitting the `as field_name` at the end and your custom pass-though fields will be casted accordingly. Use the below format for declaring the respective pass-through variables:

```yml
vars:
    accounts_pass_through_columns: 
        - name: "new_custom_field"
          alias: "custom_field"
    classes_pass_through_columns: 
        - name: "this_field"
    departments_pass_through_columns: 
        - name: "unique_string_field"
          alias: "field_id"
          transform_sql: "cast(field_id as string)"
    transactions_pass_through_columns: 
        - name: "that_field"
    transaction_lines_pass_through_columns: 
        - name: "other_id"
          alias: "another_id"
          transform_sql: "cast(another_id as int64)"
    customers_pass_through_columns: 
        - name: "customer_custom_field"
          alias: "customer_field"
    locations_pass_through_columns: 
        - name: "location_custom_field"
    subsidiaries_pass_through_columns: 
        - name: "sub_field"
          alias: "subsidiary_field"
    consolidated_exchange_rates_pass_through_columns: 
        - name: "consolidate_this_field"
    vendors_pass_through_columns: 
        - name: "vendors_custom_field"
          alias: "vendors_field"
    items_pass_through_columns: 
        - name: "items_custom_field"
          alias: "items_field"
```
### Change the build schema
By default, this package builds the Netsuite staging models within a schema titled (`<target_schema>` + `_netsuite_source`) in your destination. If this is not where you would like your netsuite staging data to be written to, add the following configuration to your root `dbt_project.yml` file:

```yml
models:
    netsuite_source:
      +schema: my_new_schema_name # leave blank for just the target_schema
```
### Change the source table references (only if using a single connector)
If an individual source table has a different name than the package expects, add the table name as it appears in your destination to the respective variable (and set `use_table_name_identifer_override` if using Netsuite2):
> IMPORTANT: See this project's [`dbt_project.yml`](https://github.com/fivetran/dbt_netsuite_source/blob/main/dbt_project.yml) variable declarations to see the expected names.
    
```yml
vars:
    use_table_name_identifer_override: true # Netsuite2 users must set this to TRUE. default = false

    # For all Netsuite source tables
    netsuite_<default_source_table_name>_identifier: your_table_name 

    # For all Netsuite2 source tables
    netsuite2_<default_source_table_name>_identifier: your_table_name 
```
### Override the data models variable
This package is designed to run **either** the Netsuite.com or Netsuite2 data models. However, for documentation purposes, an additional variable `netsuite_data_model_override` was created to allow for both data model types to be run at the same time by setting the variable value to `netsuite`. This is only to ensure the [dbt docs](https://fivetran.github.io/dbt_netsuite_source/) (which is hosted on this repository) is generated for both model types. While this variable is provided, we recommend you do not adjust the variable and instead change the `netsuite_data_model` variable to fit your configuration needs.

</details>

## (Optional) Step 7: Orchestrate your models with Fivetran Transformations for dbt Core™
<details><summary>Expand for details</summary>
<br>

Fivetran offers the ability for you to orchestrate your dbt project through [Fivetran Transformations for dbt Core™](https://fivetran.com/docs/transformations/dbt). Learn how to set up your project for orchestration through Fivetran in our [Transformations for dbt Core™ setup guides](https://fivetran.com/docs/transformations/dbt#setupguide).

</details>

# 🔍 Does this package have dependencies?
This dbt package is dependent on the following dbt packages. Please be aware that these dependencies are installed by default within this package. For more information on the following packages, refer to the [dbt hub](https://hub.getdbt.com/) site.
> IMPORTANT: If you have any of these dependent packages in your own `packages.yml` file, we highly recommend that you remove them from your root `packages.yml` to avoid package version conflicts.
```yml
packages:
    - package: fivetran/fivetran_utils
      version: [">=0.4.0", "<0.5.0"]

    - package: dbt-labs/dbt_utils
      version: [">=1.0.0", "<2.0.0"]

    - package: dbt-labs/spark_utils
      version: [">=0.3.0", "<0.4.0"]
```
          
# 🙌 How is this package maintained and can I contribute?
## Package Maintenance
The Fivetran team maintaining this package _only_ maintains the latest version of the package. We highly recommend that you stay consistent with the [latest version](https://hub.getdbt.com/fivetran/netsuite_source/latest/) of the package and refer to the [CHANGELOG](https://github.com/fivetran/dbt_netsuite_source/blob/main/CHANGELOG.md) and release notes for more information on changes across versions.

## Contributions
A small team of analytics engineers at Fivetran develops these dbt packages. However, the packages are made better by community contributions! 

We highly encourage and welcome contributions to this package. Check out [this dbt Discourse article](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) to learn how to contribute to a dbt package!

# 🏪 Are there any resources available?
- If you have questions or want to reach out for help, please refer to the [GitHub Issue](https://github.com/fivetran/dbt_netsuite_source/issues/new/choose) section to find the right avenue of support for you.
- If you would like to provide feedback to the dbt package team at Fivetran or would like to request a new dbt package, fill out our [Feedback Form](https://www.surveymonkey.com/r/DQ7K7WW).
- Have questions or want to be part of the community discourse? Create a post in the [Fivetran community](https://community.fivetran.com/t5/user-group-for-dbt/gh-p/dbt-user-group) and our team along with the community can join in on the discussion!