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
    * Columns are renamed to fit consistency of other fields. For example, the accounts accountnumber field is renamed to account_number.


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

This package includes all source columns defined in the macros folder. To add additional columns to this package, do so using our pass-through column variables. This is extremely useful if you'd like to include custom fields to the package.

```yml
# dbt_project.yml

...
vars:
  netsuite_source:
    accounts_pass_through_columns: ['new_custom_field', 'we_can_account_for_that']
    classes_pass_through_columns: ['class_is_in_session', 'pass_through_additional_fields_here']
    departments_pass_through_columns: ['department_custom_fields']
    transactions_pass_through_columns: ['transactions_can_be_custom','pass_this_transaction_field_on']
    transaction_lines_pass_through_columns: ['transaction_lines_field']
```

## Contributions
Additional contributions to this package are very welcome! Please create issues
or open PRs against `master`. Check out 
[this post](https://discourse.getdbt.com/t/contributing-to-a-dbt-package/657) 
on the best workflow for contributing to a package.


## Database support
This package has been tested on BigQuery, Snowflake and Redshift.

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