view: al_publisher {
  derived_table: {
    sql: select
      cip_publisher,    sum( clickout_rev) as co_rev
      from
        `trivago-sems.playground.au_revenue`
      group by
        cip_publisher;
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: cip_publisher {
    type: string
    sql: ${TABLE}.cip_publisher ;;
  }

  dimension: co_rev {
    type: number
    sql: ${TABLE}.co_rev ;;
  }

  set: detail {
    fields: [cip_publisher, co_rev]
  }
}
