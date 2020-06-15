class TestPastFlightObj {
  static String flightJson = '''[
        {
        "flight_number": 1,
        "mission_name": "FalconSat",
        "mission_id": [],
        "upcoming": false,
        "launch_year": "2006",
        "launch_date_unix": 1143239400,
        "launch_date_utc": "2006-03-24T22:30:00.000Z",
        "launch_date_local": "2006-03-25T10:30:00+12:00",
        "is_tentative": false,
        "tentative_max_precision": "hour",
        "tbd": false,
        "launch_window": 0,
        "rocket": {
            "rocket_id": "falcon1",
            "rocket_name": "Falcon 1",
            "rocket_type": "Merlin A",
            "first_stage": {
                "cores": [
                    {
                        "core_serial": "Merlin1A",
                        "flight": 1,
                        "block": null,
                        "gridfins": false,
                        "legs": false,
                        "reused": false,
                        "land_success": null,
                        "landing_intent": false,
                        "landing_type": null,
                        "landing_vehicle": null
                    }
                ]
            },
            "second_stage": {
                "block": 1,
                "payloads": [
                    {
                        "payload_id": "FalconSAT-2",
                        "norad_id": [],
                        "reused": false,
                        "customers": [
                            "DARPA"
                        ],
                        "nationality": "United States",
                        "manufacturer": "SSTL",
                        "payload_type": "Satellite",
                        "payload_mass_kg": 20,
                        "payload_mass_lbs": 43,
                        "orbit": "LEO",
                        "orbit_params": {
                            "reference_system": "geocentric",
                            "regime": "low-earth",
                            "longitude": null,
                            "semi_major_axis_km": null,
                            "eccentricity": null,
                            "periapsis_km": 400,
                            "apoapsis_km": 500,
                            "inclination_deg": 39,
                            "period_min": null,
                            "lifespan_years": null,
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
                "reused": false,
                "recovery_attempt": false,
                "recovered": false,
                "ship": null
            }
        },
        "ships": [],
        "telemetry": {
            "flight_club": null
        },
        "launch_site": {
            "site_id": "kwajalein_atoll",
            "site_name": "Kwajalein Atoll",
            "site_name_long": "Kwajalein Atoll Omelek Island"
        },
        "launch_success": false,
        "launch_failure_details": {
            "time": 33,
            "altitude": null,
            "reason": "merlin engine failure"
        },
        "links": {
            "mission_patch": "https://images2.imgbox.com/40/e3/GypSkayF_o.png",
            "mission_patch_small": "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png",
            "reddit_campaign": null,
            "reddit_launch": null,
            "reddit_recovery": null,
            "reddit_media": null,
            "presskit": null,
            "article_link": "https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html",
            "wikipedia": "https://en.wikipedia.org/wiki/DemoSat",
            "video_link": "https://www.youtube.com/watch?v=0a_00nJ_Y88",
            "youtube_id": "0a_00nJ_Y88",
            "flickr_images": []
        },
        "details": "Engine failure at 33 seconds and loss of vehicle",
        "static_fire_date_utc": "2006-03-17T00:00:00.000Z",
        "static_fire_date_unix": 1142553600,
        "timeline": {
            "webcast_liftoff": 54
        },
        "crew": null
        },
        {
        "flight_number": 96,
        "mission_name": "Starlink-8 & SkySat 16-18",
        "mission_id": [],
        "launch_year": "2020",
        "launch_date_unix": 1592040060,
        "launch_date_utc": "2020-06-13T09:21:00.000Z",
        "launch_date_local": "2020-06-13T05:21:00-04:00",
        "is_tentative": false,
        "tentative_max_precision": "hour",
        "tbd": false,
        "launch_window": 0,
        "rocket": {
            "rocket_id": "falcon9",
            "rocket_name": "Falcon 9",
            "rocket_type": "FT",
            "first_stage": {
                "cores": [
                    {
                        "core_serial": "B1059",
                        "flight": 3,
                        "block": 5,
                        "gridfins": true,
                        "legs": true,
                        "reused": true,
                        "land_success": true,
                        "landing_intent": true,
                        "landing_type": "ASDS",
                        "landing_vehicle": "OCISLY"
                    }
                ]
            },
            "second_stage": {
                "block": 5,
                "payloads": [
                    {
                        "payload_id": "Starlink 8",
                        "norad_id": [],
                        "reused": false,
                        "customers": [
                            "SpaceX"
                        ],
                        "nationality": "United States",
                        "manufacturer": "SpaceX",
                        "payload_type": "Satellite",
                        "payload_mass_kg": 15400,
                        "payload_mass_lbs": 33951.2,
                        "orbit": "VLEO",
                        "orbit_params": {
                            "reference_system": "geocentric",
                            "regime": "very-low-earth",
                            "longitude": null,
                            "semi_major_axis_km": null,
                            "eccentricity": null,
                            "periapsis_km": null,
                            "apoapsis_km": null,
                            "inclination_deg": null,
                            "period_min": null,
                            "lifespan_years": null,
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
                "reused": true,
                "recovery_attempt": true,
                "recovered": null,
                "ship": "GOMSTREE"
            }
        },
        "ships": [
            "GOMSTREE",
            "GOMSCHIEF",
            "GOQUEST",
            "OCISLY"
        ],
        "telemetry": {
            "flight_club": null
        },
        "launch_site": {
            "site_id": "ccafs_slc_40",
            "site_name": "CCAFS SLC 40",
            "site_name_long": "Cape Canaveral Air Force Station Space Launch Complex 40"
        },
        "launch_success": true,
        "links": {
            "mission_patch": "https://images2.imgbox.com/d2/3b/bQaWiil0_o.png",
            "mission_patch_small": "https://images2.imgbox.com/9a/96/nLppz9HW_o.png",
            "reddit_campaign": "https://www.reddit.com/r/spacex/comments/gwbr4t/starlink8_launch_campaign_thread/",
            "reddit_launch": "https://www.reddit.com/r/spacex/comments/h7gqlc/rspacex_starlink_8_official_launch_discussion/",
            "reddit_recovery": "https://www.reddit.com/r/spacex/comments/h8sx6q/starlink8_recovery_thread/",
            "reddit_media": "https://www.reddit.com/r/spacex/comments/h842qk/rspacex_starlink8_media_thread_photographer/",
            "presskit": null,
            "article_link": null,
            "wikipedia": "https://en.wikipedia.org/wiki/Starlink",
            "video_link": "https://youtu.be/8riKQXChPGg",
            "youtube_id": "8riKQXChPGg",
            "flickr_images": []
        },
        "details": "This mission will launch the eighth batch of operational Starlink satellites, which are expected to be version 1.0, from SLC-40, Cape Canaveral AFS. It is the ninth Starlink launch overall. The satellites will be delivered to low Earth orbit and will spend a few weeks maneuvering to their operational altitude of 550 km. This mission is expected to include rideshare payloads, SkySats 16-18, on top of the Starlink stack. The booster for this mission is expected to land an ASDS.",
        "upcoming": false,
        "static_fire_date_utc": null,
        "static_fire_date_unix": null,
        "timeline": null,
        "crew": null,
        "last_date_update": "2020-06-11T04:25:39.000Z",
        "last_ll_launch_date": null,
        "last_ll_update": null,
        "last_wiki_launch_date": "2020-06-13T09:21:00.000Z",
        "last_wiki_revision": "9a320975-ab9b-11ea-8445-0e30d54c90e7",
        "last_wiki_update": "2020-06-11T04:25:39.000Z",
        "launch_date_source": "wiki"
    }
        ]''';
}
