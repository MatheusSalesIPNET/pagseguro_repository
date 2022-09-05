view: orders {
  sql_table_name: `ecommerce_dataset.orders`
    ;;
  drill_fields: [order_id]

  dimension: order_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: customer_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension_group: order_approved {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_approved_at ;;
  }

  dimension_group: order_delivered_carrier {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_delivered_carrier_date ;;
  }

  dimension_group: order_delivered_customer {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_delivered_customer_date ;;
  }

  dimension_group: order_estimated_delivery {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_estimated_delivery_date ;;
  }

  dimension_group: order_purchase_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_purchase_timestamp ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}.order_status ;;
  }

  measure: count {
    type: count
    drill_fields: [order_id, customers.customer_id, order_payment.count, order_items.count, order_reviews.count]
  }
}
