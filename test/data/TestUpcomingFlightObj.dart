class TestUpcomingFlightObj {
  static String flightJson = '''[
        {
        "flight_number": 110,
        "mission_name": "ANASIS-II",
        "mission_id": [],
        "launch_year": "2020",
        "launch_date_unix": 1577836800,
        "launch_date_utc": "2020-01-01T00:00:00.000Z",
        "launch_date_local": "2019-12-31T19:00:00-05:00",
        "is_tentative": true,
        "tentative_max_precision": "year",
        "tbd": false,
        "launch_window": null,
        "rocket": {
            "rocket_id": "falcon9",
            "rocket_name": "Falcon 9",
            "rocket_type": "FT",
            "first_stage": {
                "cores": [
                    {
                        "core_serial": null,
                        "flight": null,
                        "block": 5,
                        "gridfins": null,
                        "legs": null,
                        "reused": null,
                        "land_success": null,
                        "landing_intent": null,
                        "landing_type": null,
                        "landing_vehicle": null
                    }
                ]
            },
            "second_stage": {
                "block": 5,
                "payloads": [
                    {
                        "payload_id": "ANASIS-II",
                        "norad_id": [],
                        "reused": false,
                        "customers": [
                            "South Korea"
                        ],
                        "nationality": "South Korea",
                        "manufacturer": "South Korea",
                        "payload_type": "Satellite",
                        "payload_mass_kg": null,
                        "payload_mass_lbs": null,
                        "orbit": "GEO",
                        "orbit_params": {
                            "reference_system": "geocentric",
                            "regime": "geosynchronous",
                            "longitude": null,
                            "semi_major_axis_km": null,
                            "eccentricity": null,
                            "periapsis_km": null,
                            "apoapsis_km": null,
                            "inclination_deg": null,
                            "period_min": null,
                            "lifespan_years": 15,
                            "epoch": null,
                            "mean_motion": null,
                            "raan": null,
                            "arg_of_pericenter": null,
                            "mean_anomaly": null
                        }
                    }
                ]
            },
            "fairings": {
                "reused": null,
                "recovery_attempt": null,
                "recovered": null,
                "ship": null
            }
        },
        "ships": [],
        "telemetry": {
            "flight_club": null
        },
        "launch_site": {
            "site_id": "ccafs_slc_40",
            "site_name": "CCAFS SLC 40",
            "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
        },
        "launch_success": null,
        "links": {
            "mission_patch": null,
            "mission_patch_small": null,
            "reddit_campaign": null,
            "reddit_launch": null,
            "reddit_recovery": null,
            "reddit_media": null,
            "presskit": null,
            "article_link": null,
            "wikipedia": null,
            "video_link": null,
            "youtube_id": null,
            "flickr_images": []
        },
        "details": null,
        "upcoming": true,
        "static_fire_date_utc": null,
        "static_fire_date_unix": null,
        "timeline": null,
        "crew": null,
        "last_date_update": "2020-03-27T22:58:59.000Z",
        "last_ll_launch_date": "2020-04-30T00:00:00.000Z",
        "last_ll_update": "2020-02-29T11:11:36.000Z",
        "last_wiki_launch_date": "2020-04-01T00:00:00.000Z",
        "last_wiki_revision": "8ac8f6a9-707e-11ea-920f-0e9859fe7995",
        "last_wiki_update": "2020-03-27T22:58:59.000Z",
        "launch_date_source": "wiki"
    }]''';
}
