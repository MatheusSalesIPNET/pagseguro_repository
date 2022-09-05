view: geolocation {
  sql_table_name: `ecommerce_dataset.geolocation`
    ;;

  dimension: geolocation_city {
    type: string
    sql: ${TABLE}.geolocation_city ;;
  }

  dimension: geolocation_lat {
    type: number
    sql: ${TABLE}.geolocation_lat ;;
  }

  dimension: geolocation_lng {
    type: number
    sql: ${TABLE}.geolocation_lng ;;
  }

  dimension: geolocation_state {
    type: string
    sql: ${TABLE}.geolocation_state ;;
  }

  dimension: geolocation_zip_code_prefix {
    type: number
    sql: ${TABLE}.geolocation_zip_code_prefix ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
