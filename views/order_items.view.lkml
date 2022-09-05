view: order_items {
  sql_table_name: `ecommerce_dataset.order_items`
    ;;
  drill_fields: [order_item_id]

  dimension: order_item_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.order_item_id ;;
  }

  dimension: freight_value {
    type: number
    sql: ${TABLE}.freight_value ;;
  }

  dimension: order_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: product_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: seller_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.seller_id ;;
  }

  dimension_group: shipping_limit {
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
    sql: ${TABLE}.shipping_limit_date ;;
  }

  measure: count {
    type: count
    drill_fields: [order_item_id, products.product_category_name, products.product_id, orders.order_id, sellers.seller_id]
  }
}
