view: customers {
  sql_table_name: `ecommerce_dataset.customers`
    ;;
  drill_fields: [customer_id]

  dimension: customer_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_city {
    type: string
    sql: ${TABLE}.customer_city ;;
  }

  dimension: customer_state {
    type: string
    sql: ${TABLE}.customer_state ;;
  }

  dimension: customer_unique_id {
    type: string
    sql: ${TABLE}.customer_unique_id ;;
  }

  dimension: customer_zip_code_prefix {
    type: number
    sql: ${TABLE}.customer_zip_code_prefix ;;
  }

  measure: count {
    type: count
    drill_fields: [customer_id, orders.count]
  }
}
