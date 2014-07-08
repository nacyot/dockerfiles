define(['settings'],
       function (Settings) {
           "use strict";
           
           return new Settings({
               elasticsearch: "ES_API_HOST:ES_API_PORT",
               datasources: {
                 graphite: {
                   type: 'graphite',
                   url: 'GRAPHITE_API_HOST:GRAPHITE_API_PORT',
                   default: true,
                   render_method: 'POST'
                 }
               },
               default_route: '/dashboard/file/default.json',
               timezoneOffset: null,
               grafana_index: "grafana-dash",
               panel_names: [
                   'text',
                   'graphite'
               ]
           });
       });
