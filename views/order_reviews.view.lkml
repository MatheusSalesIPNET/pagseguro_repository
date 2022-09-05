view: order_reviews {
  sql_table_name: `ecommerce_dataset.order_reviews`
    ;;

  dimension: order_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: review_answer_timestamp {
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
    sql: ${TABLE}.review_answer_timestamp ;;
  }

  dimension: review_comment_message {
    type: string
    sql: ${TABLE}.review_comment_message ;;
  }

  dimension: review_comment_title {
    type: string
    sql: ${TABLE}.review_comment_title ;;
  }

  dimension_group: review_creation {
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
    sql: ${TABLE}.review_creation_date ;;
  }

  dimension: review_id {
    type: string
    sql: ${TABLE}.review_id ;;
  }

  dimension: review_score {
    type: number
    sql: ${TABLE}.review_score ;;
  }

  measure: count {
    type: count
    drill_fields: [orders.order_id]
  }
}
