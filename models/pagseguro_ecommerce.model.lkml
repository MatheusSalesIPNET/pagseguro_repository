connection: "ecommerce-dataset"

# include all the views
include: "/views/**/*.view"

datagroup: pagseguro_ecommerce_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: pagseguro_ecommerce_default_datagroup

explore: orders {
  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}

explore: order_payment {
  join: orders {
    type: left_outer
    sql_on: ${order_payment.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: products {
    type: left_outer
    sql_on: ${order_items.product_id} = ${products.product_id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: sellers {
    type: left_outer
    sql_on: ${order_items.seller_id} = ${sellers.seller_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}

explore: sellers {}

explore: order_reviews {
  join: orders {
    type: left_outer
    sql_on: ${order_reviews.order_id} = ${orders.order_id} ;;
    relationship: many_to_one
  }

  join: customers {
    type: left_outer
    sql_on: ${orders.customer_id} = ${customers.customer_id} ;;
    relationship: many_to_one
  }
}

explore: customers {}

explore: geolocation {}

explore: products {}

explore: vehicles {}
