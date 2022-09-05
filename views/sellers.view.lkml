view: sellers {
  sql_table_name: `ecommerce_dataset.sellers`
    ;;
  drill_fields: [seller_id]

  dimension: seller_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.seller_id ;;
  }

  dimension: seller_city {
    type: string
    sql: ${TABLE}.seller_city ;;
  }

  dimension: seller_state {
    type: string
    sql: ${TABLE}.seller_state ;;
  }

  dimension: seller_zip_code_prefix {
    type: number
    sql: ${TABLE}.seller_zip_code_prefix ;;
  }

  measure: count {
    type: count
    drill_fields: [seller_id, order_items.count]
  }
}
