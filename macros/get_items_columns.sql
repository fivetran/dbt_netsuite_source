{% macro get_items_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "allow_drop_ship", "datatype": dbt_utils.type_string()},
    {"name": "alt_demand_source_item_id", "datatype": dbt_utils.type_float()},
    {"name": "asset_account_id", "datatype": dbt_utils.type_float()},
    {"name": "atp_lead_time", "datatype": dbt_utils.type_float()},
    {"name": "atp_method", "datatype": dbt_utils.type_string()},
    {"name": "available_to_partners", "datatype": dbt_utils.type_string()},
    {"name": "avatax_taxcode", "datatype": dbt_utils.type_string()},
    {"name": "averagecost", "datatype": dbt_utils.type_float()},
    {"name": "backward_consumption_days", "datatype": dbt_utils.type_float()},
    {"name": "build_sub_assemblies", "datatype": dbt_utils.type_string()},
    {"name": "class_id", "datatype": dbt_utils.type_float()},
    {"name": "code_of_supply_id", "datatype": dbt_utils.type_float()},
    {"name": "commodity_code", "datatype": dbt_utils.type_string()},
    {"name": "consumption_unit_id", "datatype": dbt_utils.type_float()},
    {"name": "cost_0", "datatype": dbt_utils.type_float()},
    {"name": "cost_category", "datatype": dbt_utils.type_string()},
    {"name": "cost_estimate_type", "datatype": dbt_utils.type_string()},
    {"name": "costing_method", "datatype": dbt_utils.type_string()},
    {"name": "country_of_manufacture", "datatype": dbt_utils.type_string()},
    {"name": "create_plan_on_event_type", "datatype": dbt_utils.type_string()},
    {"name": "created", "datatype": dbt_utils.type_timestamp()},
    {"name": "current_on_order_count", "datatype": dbt_utils.type_float()},
    {"name": "custreturn_variance_account_id", "datatype": dbt_utils.type_float()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "date_last_modified", "datatype": dbt_utils.type_timestamp()},
    {"name": "date_of_last_transaction", "datatype": dbt_utils.type_timestamp()},
    {"name": "default_return_cost", "datatype": dbt_utils.type_float()},
    {"name": "deferred_expense_account_id", "datatype": dbt_utils.type_float()},
    {"name": "deferred_revenue_account_id", "datatype": dbt_utils.type_float()},
    {"name": "demand_source", "datatype": dbt_utils.type_string()},
    {"name": "demand_time_fence", "datatype": dbt_utils.type_float()},
    {"name": "department_id", "datatype": dbt_utils.type_float()},
    {"name": "deposit", "datatype": dbt_utils.type_string()},
    {"name": "displayname", "datatype": dbt_utils.type_string()},
    {"name": "distribution_category", "datatype": dbt_utils.type_string()},
    {"name": "distribution_network", "datatype": dbt_utils.type_string()},
    {"name": "dropship_expense_account_id", "datatype": dbt_utils.type_float()},
    {"name": "effective_bom_control_type", "datatype": dbt_utils.type_string()},
    {"name": "expense_account_id", "datatype": dbt_utils.type_float()},
    {"name": "featureddescription", "datatype": dbt_utils.type_string()},
    {"name": "featureditem", "datatype": dbt_utils.type_string()},
    {"name": "fixed_lot_size", "datatype": dbt_utils.type_float()},
    {"name": "forward_consumption_days", "datatype": dbt_utils.type_float()},
    {"name": "fraud_risk", "datatype": dbt_utils.type_string()},
    {"name": "full_name", "datatype": dbt_utils.type_string()},
    {"name": "fx_adjustment_account_id", "datatype": dbt_utils.type_float()},
    {"name": "gain_loss_account_id", "datatype": dbt_utils.type_float()},
    {"name": "handling_cost", "datatype": dbt_utils.type_float()},
    {"name": "hazmat", "datatype": dbt_utils.type_string()},
    {"name": "hazmat_hazard_class", "datatype": dbt_utils.type_string()},
    {"name": "hazmat_id", "datatype": dbt_utils.type_string()},
    {"name": "hazmat_item_units", "datatype": dbt_utils.type_string()},
    {"name": "hazmat_item_units_qty", "datatype": dbt_utils.type_float()},
    {"name": "hazmat_packing_group", "datatype": dbt_utils.type_string()},
    {"name": "hazmat_shipping_name", "datatype": dbt_utils.type_string()},
    {"name": "include_child_subsidiaries", "datatype": dbt_utils.type_string()},
    {"name": "income_account_id", "datatype": dbt_utils.type_float()},
    {"name": "interco_expense_account_id", "datatype": dbt_utils.type_float()},
    {"name": "interco_income_account_id", "datatype": dbt_utils.type_float()},
    {"name": "invt_count_classification", "datatype": dbt_utils.type_float()},
    {"name": "invt_count_interval", "datatype": dbt_utils.type_float()},
    {"name": "is_cont_rev_handling", "datatype": dbt_utils.type_string()},
    {"name": "is_enforce_min_qty_internally", "datatype": dbt_utils.type_string()},
    {"name": "is_hold_rev_rec", "datatype": dbt_utils.type_string()},
    {"name": "is_moss", "datatype": dbt_utils.type_string()},
    {"name": "is_phantom", "datatype": dbt_utils.type_string()},
    {"name": "is_special_order_item", "datatype": dbt_utils.type_string()},
    {"name": "isinactive", "datatype": dbt_utils.type_string()},
    {"name": "isonline", "datatype": dbt_utils.type_string()},
    {"name": "istaxable", "datatype": dbt_utils.type_string()},
    {"name": "item_defined_cost", "datatype": dbt_utils.type_float()},
    {"name": "item_extid", "datatype": dbt_utils.type_string()},
    {"name": "item_id", "datatype": dbt_utils.type_float()},
    {"name": "item_image", "datatype": dbt_utils.type_float()},
    {"name": "item_revenue_category", "datatype": dbt_utils.type_string()},
    {"name": "item_term_id", "datatype": dbt_utils.type_float()},
    {"name": "last_cogs_correction", "datatype": dbt_utils.type_timestamp()},
    {"name": "last_invt_count_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "last_purchase_price", "datatype": dbt_utils.type_float()},
    {"name": "location_id", "datatype": dbt_utils.type_float()},
    {"name": "lot_numbered_item", "datatype": dbt_utils.type_string()},
    {"name": "lot_sizing_method", "datatype": dbt_utils.type_string()},
    {"name": "manufacturer", "datatype": dbt_utils.type_string()},
    {"name": "manufacturing_charge_item", "datatype": dbt_utils.type_string()},
    {"name": "match_bill_to_receipt", "datatype": dbt_utils.type_string()},
    {"name": "matrix_type", "datatype": dbt_utils.type_string()},
    {"name": "maximum_quantity", "datatype": dbt_utils.type_float()},
    {"name": "minimum_quantity", "datatype": dbt_utils.type_float()},
    {"name": "modified", "datatype": dbt_utils.type_timestamp()},
    {"name": "mpn", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "nature_of_transaction_codes_id", "datatype": dbt_utils.type_float()},
    {"name": "next_invt_count_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "ng_asset_type_id", "datatype": dbt_utils.type_float()},
    {"name": "ns_lead_time", "datatype": dbt_utils.type_float()},
    {"name": "offersupport", "datatype": dbt_utils.type_string()},
    {"name": "onspecial", "datatype": dbt_utils.type_string()},
    {"name": "overhead_type", "datatype": dbt_utils.type_string()},
    {"name": "parent_id", "datatype": dbt_utils.type_float()},
    {"name": "payment_method_id", "datatype": dbt_utils.type_float()},
    {"name": "periodic_lot_size_days", "datatype": dbt_utils.type_float()},
    {"name": "periodic_lot_size_type", "datatype": dbt_utils.type_string()},
    {"name": "pref_purchase_tax_id", "datatype": dbt_utils.type_float()},
    {"name": "pref_sale_tax_id", "datatype": dbt_utils.type_float()},
    {"name": "pref_stock_level", "datatype": dbt_utils.type_float()},
    {"name": "prices_include_tax", "datatype": dbt_utils.type_string()},
    {"name": "pricing_group_id", "datatype": dbt_utils.type_float()},
    {"name": "print_sub_items", "datatype": dbt_utils.type_string()},
    {"name": "prod_price_var_account_id", "datatype": dbt_utils.type_float()},
    {"name": "prod_qty_var_account_id", "datatype": dbt_utils.type_float()},
    {"name": "prompt_payment_discount_item", "datatype": dbt_utils.type_string()},
    {"name": "purchase_price_var_account_id", "datatype": dbt_utils.type_float()},
    {"name": "purchase_unit_id", "datatype": dbt_utils.type_float()},
    {"name": "purchasedescription", "datatype": dbt_utils.type_string()},
    {"name": "purchaseorderamount", "datatype": dbt_utils.type_float()},
    {"name": "purchaseorderquantity", "datatype": dbt_utils.type_float()},
    {"name": "purchaseorderquantitydiff", "datatype": dbt_utils.type_float()},
    {"name": "quantityavailable", "datatype": dbt_utils.type_float()},
    {"name": "quantitybackordered", "datatype": dbt_utils.type_float()},
    {"name": "quantityonhand", "datatype": dbt_utils.type_float()},
    {"name": "receiptamount", "datatype": dbt_utils.type_float()},
    {"name": "receiptquantity", "datatype": dbt_utils.type_float()},
    {"name": "receiptquantitydiff", "datatype": dbt_utils.type_float()},
    {"name": "reorder_multiple", "datatype": dbt_utils.type_float()},
    {"name": "reorderpoint", "datatype": dbt_utils.type_float()},
    {"name": "replenishment_method", "datatype": dbt_utils.type_string()},
    {"name": "resalable", "datatype": dbt_utils.type_string()},
    {"name": "reschedule_in_days", "datatype": dbt_utils.type_float()},
    {"name": "reschedule_out_days", "datatype": dbt_utils.type_float()},
    {"name": "rev_rec_forecast_rule_id", "datatype": dbt_utils.type_float()},
    {"name": "rev_rec_rule_id", "datatype": dbt_utils.type_float()},
    {"name": "revenue_allocation_group", "datatype": dbt_utils.type_string()},
    {"name": "round_up_as_component", "datatype": dbt_utils.type_string()},
    {"name": "safety_stock_days", "datatype": dbt_utils.type_float()},
    {"name": "safety_stock_level", "datatype": dbt_utils.type_float()},
    {"name": "sale_unit_id", "datatype": dbt_utils.type_float()},
    {"name": "salesdescription", "datatype": dbt_utils.type_string()},
    {"name": "salesforce_id", "datatype": dbt_utils.type_string()},
    {"name": "salesprice", "datatype": dbt_utils.type_string()},
    {"name": "scrap_account_id", "datatype": dbt_utils.type_float()},
    {"name": "serialized_item", "datatype": dbt_utils.type_string()},
    {"name": "shippingcost", "datatype": dbt_utils.type_float()},
    {"name": "special_work_order_item", "datatype": dbt_utils.type_string()},
    {"name": "specialsdescription", "datatype": dbt_utils.type_string()},
    {"name": "stock_unit_id", "datatype": dbt_utils.type_float()},
    {"name": "storedescription", "datatype": dbt_utils.type_string()},
    {"name": "storedetaileddescription", "datatype": dbt_utils.type_string()},
    {"name": "storedisplayname", "datatype": dbt_utils.type_string()},
    {"name": "subtype", "datatype": dbt_utils.type_string()},
    {"name": "supplementary_unit__abberviat", "datatype": dbt_utils.type_string()},
    {"name": "supplementary_unit_id", "datatype": dbt_utils.type_float()},
    {"name": "supply_time_fence", "datatype": dbt_utils.type_float()},
    {"name": "supply_type", "datatype": dbt_utils.type_string()},
    {"name": "tax_item_id", "datatype": dbt_utils.type_float()},
    {"name": "totalvalue", "datatype": dbt_utils.type_float()},
    {"name": "transferprice", "datatype": dbt_utils.type_float()},
    {"name": "type_name", "datatype": dbt_utils.type_string()},
    {"name": "type_of_goods_id", "datatype": dbt_utils.type_float()},
    {"name": "udf1", "datatype": dbt_utils.type_string()},
    {"name": "udf2", "datatype": dbt_utils.type_string()},
    {"name": "un_number", "datatype": dbt_utils.type_string()},
    {"name": "unbuild_variance_account_id", "datatype": dbt_utils.type_float()},
    {"name": "units_type_id", "datatype": dbt_utils.type_float()},
    {"name": "upc_code", "datatype": dbt_utils.type_string()},
    {"name": "use_component_yield", "datatype": dbt_utils.type_string()},
    {"name": "vendor_id", "datatype": dbt_utils.type_float()},
    {"name": "vendorname", "datatype": dbt_utils.type_string()},
    {"name": "vendreturn_variance_account_id", "datatype": dbt_utils.type_float()},
    {"name": "vsoe_deferral", "datatype": dbt_utils.type_string()},
    {"name": "vsoe_delivered", "datatype": dbt_utils.type_string()},
    {"name": "vsoe_discount", "datatype": dbt_utils.type_string()},
    {"name": "vsoe_price", "datatype": dbt_utils.type_float()},
    {"name": "weight", "datatype": dbt_utils.type_float()},
    {"name": "weight_in_user_defined_unit", "datatype": dbt_utils.type_float()},
    {"name": "weight_unit_index", "datatype": dbt_utils.type_float()},
    {"name": "wip_account_id", "datatype": dbt_utils.type_float()},
    {"name": "wip_cost_variance_account_id", "datatype": dbt_utils.type_float()},
    {"name": "work_order_lead_time", "datatype": dbt_utils.type_float()}
] %}

{{ return(columns) }}

{% endmacro %}
