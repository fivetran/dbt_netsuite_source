# Netsuite ([docs](https://dbt-netsuite-source.netlify.app/)) 

This package models Netsuite data from [Fivetran's connector](https://fivetran.com/docs/applications/netsuite). It uses data in the format described by [this ERD](https://docs.google.com/presentation/d/1sgWiu5PMdFdBZgWtQ-aWqrym3dNcZvOtBNKT0q084pI/edit#slide=id.g3cb9b617cd_0_1).

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
    * ID primary keys are prefixed with the name of the table.  For example, the user table's ID column is renamed user_id.


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
    account_pass_through_columns: [account_custom_field_1, account_custom_field_2]
    opportunity_pass_through_columns: [my_opp_custom_field]
    user_pass_through_columns: [users_have_custom_fields_too, lets_add_them_all]
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