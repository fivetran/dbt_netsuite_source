# Netsuite

This package models Netsuite data from [Fivetran's connector](https://fivetran.com/docs/applications/netsuite). It uses data in the format described by [this ERD](https://fivetran.com/docs/applications/netsuite-suiteanalytics#schemainformation).

This package enriches your Fivetran data by doing the following:
* Adds descriptions to tables and columns that are synced using Fivetran
* Adds freshness tests to source data
* Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
* Models staging tables, which will be used in our transform package

## Models

This package contains staging models, designed to work simultaneously with our [netsuite modeling package](https://github.com/fivetran/dbt_netsuite).  The staging models:
* Remove any rows that are soft-deleted
* Name columns consistently across all packages:
    * Boolean fields are prefixed with `is_` or `has_`
    * Timestamps are appended with `_at`
    * ID primary keys are prefixed with the name of the table.  For example, the user table's ID column is renamed customer_id.


## Installation Instructions
Check [dbt Hub](https://hub.getdbt.com/) for the latest installation instructions, or [read the dbt docs](https://docs.getdbt.com/docs/package-management) for more information on installing packages.

## Configuration
By default, this package will run using your target database and the `netsuite` schema. If this is not where your netsuite data is (perhaps your netsuite schema is `netsuite_fivetran`), add the following configuration to your `dbt_project.yml` file:

```yml
# dbt_project.yml

...
vars:
  netsuite_source:
    netsuite_database: your_database_name
    netsuite_schema: your_schema_name
```

This package includes all source columns defined in the `generate_columns.sql` macro. To add additional columns to this package, do so using our pass-through column variables. This is extremely useful if you'd like to include custom fields to the package.


```yml
# dbt_project.yml

...
vars:
  netsuite_source:
    accounting_books_pass_through_columns: [accounting_book_custom_field]
    accounting_periods_pass_through_columns: [accounting_periods_have_fields, accounting_period_custom]
    accounts_pass_through_columns: [accounts_pass_custom_fields]
    classes_pass_through_columns: [class_custom_1, class_custom_2, class_custom_3]
    consolidated_exchange_rates_pass_through_columns: [consolidated_custom_field]
    currencies_pass_through_columns: [current_currency, past_currency]
    customers_pass_through_columns: [customer_wants_a_custom_field]
    departments_pass_through_columns: [im_a_custom_field_woohoo]
    expense_accounts_pass_through_columns: [poof_new_custom_field, cachow_newer_custom_field]
    income_accounts_pass_through_columns: [income_field, income_field_custom]
    items_pass_through_columns: [who_knew_i_could_use_these_custom_fields]
    locations_pass_through_columns: [location_3, location_1, location_2]
    subsidiaries_pass_through_columns: [super_important_subsidiary_field]
    transaction_lines_pass_through_columns: [just_passing_through, nothing_to_see_here]
    transactions_pass_through_columns: [hello_i_am_a, custom_field]
    vendor_type_pass_through_columns: [custom_field, costume_field]
    vendors_pass_through_columns: [last_custom_field_to_makeup]
```

## Contributions

Additional contributions to this package are very welcome! Please create issues
or open PRs against `master`. Check out 
[this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) 
on the best workflow for contributing to a package.


## Database support
This package has been tested on BigQuery, Snowflake and Redshift.

Coming soon -- compatibility with Spark

## Resources:
- Provide [feedback](https://www.surveymonkey.com/r/DQ7K7WW) on our existing dbt packages or what you'd like to see next
- Have questions, feedback, or need help? Book a time during our office hours [here](https://calendly.com/fivetran-solutions-team/fivetran-solutions-team-office-hours) or email us at solutions@fivetran.com
- Find all of Fivetran's pre-built dbt packages in our [dbt hub](https://hub.getdbt.com/fivetran/)
- Learn how to orchestrate dbt transformations with Fivetran [here](https://fivetran.com/docs/transformations/dbt)
- Learn more about Fivetran overall [in our docs](https://fivetran.com/docs)
- Check out [Fivetran's blog](https://fivetran.com/blog)
- Learn more about dbt [in the dbt docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the dbt blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices