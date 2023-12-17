resource "newrelic_one_dashboard" "Laptop_dashboard" {
  name = "NR_TF_Laptop_Dashboard"
  permissions = var.permissions

  page {
    name = "Page 1"

    widget_billboard {
      title = "Api Call"
      row = 1
      column = 1
      width = 4
      height = 3

      nrql_query {
        query = "SELECT count(*) FROM Public_APICall"
      }
    }

    widget_bar {
      title  = "Overall CPU % Statistics"
      row    = 1
      column = 5
      width  = 4
      height = 3

      nrql_query {
        query = "SELECT average(cpuSystemPercent), average(cpuUserPercent), average(cpuIdlePercent), average(cpuIOWaitPercent) FROM SystemSample SINCE 1 hour ago TIMESERIES"
      }
    }

    widget_bar {
      title = "Memory Usage"
      row = 1
      column = 9
      width = 4
      height = 3

      nrql_query {
        query = "SELECT average(host.memoryUsedPercent) AS 'Memory used %' FROM Metric WHERE `entityGuid` = 'NDI2NzI2MHxJTkZSQXxOQXw3MjkwNTcwMDg4MjYzMDEyMTI4' TIMESERIES auto"
      }
    }


  }

  page {
    name = "Page 2"

    widget_bar {
      title  = "Overall CPU % Statistics"
      row    = 1
      column = 1
      width  = 4
      height = 3

      nrql_query {
        query = "SELECT average(cpuSystemPercent), average(cpuUserPercent), average(cpuIdlePercent), average(cpuIOWaitPercent) FROM SystemSample SINCE 1 hour ago TIMESERIES"
      }
    }
  }
}