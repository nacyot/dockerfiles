// == Configuration
// config.js is where you will find the core Grafana configuration. This file contains parameter that
// must be set before Grafana is run for the first time.

define(['settings'], function(Settings) {
  "use strict";

  return new Settings({
      datasources: {
        influxdb: {
          type: 'influxdb',
          url: "http://INFLUXDB_HOST:INFLUXDB_PORT/db/INFLUXDB_DB",
          username: 'INFLUXDB_USER',
          password: 'INFLUXDB_PASSWORD',
        },
        grafana: {
          type: 'influxdb',
          url: "http://INFLUXDB_HOST:INFLUXDB_PORT/db/INFLUXDB_GRAFANA_DB",
          username: 'INFLUXDB_USER',
          password: 'INFLUXDB_PASSWORD',
          grafanaDB: true
        },
      },
      search: {
        max_results: 100
      },
      default_route: '/dashboard/file/default.json',
      unsaved_changes_warning: true,
      playlist_timespan: "1m",
      admin: {
        password: ''
      },
      window_title_prefix: 'Smartstudy Grafana - ',
      // Add your own custom panels
      plugins: {
        panels: [],
        dependencies: [],
      }
    });
});



