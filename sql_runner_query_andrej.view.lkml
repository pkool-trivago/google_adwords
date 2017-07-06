view: sql_runner_query_andrej {
  derived_table: {
    sql: select
        acs.CampaignId ,
        max(CampaignName) Name ,
        sum( Clicks) Clicks,
        sum( Cost) Cost
      from
      `trivago-sems.playground.all_campaignbasicstats` acs, `trivago-sems.playground.all_campaigns` ac
      where
        acs.CampaignId = ac.CampaignId
      group by
      CampaignId
      order by Clicks desc limit 100
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.Clicks ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.Cost ;;
  }

  set: detail {
    fields: [campaign_id, name, clicks, cost]
  }
}
