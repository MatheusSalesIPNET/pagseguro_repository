view: order_payment {
  sql_table_name: `ecommerce_dataset.order_payment`
    ;;

  dimension: order_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: payment_installments {
    type: number
    sql: ${TABLE}.payment_installments ;;
  }

  dimension: payment_sequential {
    type: number
    sql: ${TABLE}.payment_sequential ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: payment_value {
    type: number
    sql: ${TABLE}.payment_value ;;
  }

  measure: count {
    type: count
    drill_fields: [orders.order_id]
  }
}
