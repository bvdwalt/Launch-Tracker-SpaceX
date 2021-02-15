class TestLaunchesObj {
  static String launchesJson = '''[
         {
    "fairings": {
      "reused": null,
      "recovery_attempt": null,
      "recovered": null,
      "ships": []
    },
    "links": {
      "patch": {
        "small": "https://imgur.com/BrW201S.png",
        "large": "https://imgur.com/573IfGk.png"
      },
      "reddit": {
        "campaign": "https://www.reddit.com/r/spacex/comments/jhu37i/starlink_general_discussion_and_deployment_thread/",
        "launch": null,
        "media": null,
        "recovery": "https://www.reddit.com/r/spacex/comments/k2ts1q/rspacex_fleet_updates_discussion_thread/"
      },
      "flickr": {
        "small": [],
        "original": []
      },
      "presskit": null,
      "webcast": null,
      "youtube_id": null,
      "article": null,
      "wikipedia": "https://en.wikipedia.org/wiki/Starlink"
    },
    "static_fire_date_utc": "2021-02-01T02:16:00.000Z",
    "static_fire_date_unix": null,
    "tbd": false,
    "net": false,
    "window": null,
    "rocket": "5e9d0d95eda69973a809d1ec",
    "success": null,
    "details": "This mission launches the sixteenth batch of operational Starlink satellites, which are version 1.0, from LC-39A. It is the eighteenth Starlink launch overall. The satellites will be delivered to low Earth orbit and will spend a few weeks maneuvering to their operational altitude. The booster is expected to land on an ASDS.",
    "crew": [],
    "ships": [
      "5ea6ed2f080df4000697c910",
      "5ee68c683c228f36bd5809b5"
    ],
    "capsules": [],
    "payloads": [
      "5fbfedc654ceb10a5664c814"
    ],
    "launchpad": "5e9e4502f509094188566f88",
    "auto_update": true,
    "launch_library_id": "dfd4f0e0-0ab4-494d-bd88-1b93b934b269",
    "failures": [],
    "flight_number": 116,
    "name": "Starlink-17 (v1.0)",
    "date_utc": "2021-02-03T10:57:00.000Z",
    "date_unix": 1612349820,
    "date_local": "2021-02-03T05:57:00-05:00",
    "date_precision": "hour",
    "upcoming": true,
    "cores": [
      {
        "core": "5e9e28a5f3591833b13b2659",
        "flight": 8,
        "gridfins": true,
        "legs": true,
        "reused": true,
        "landing_attempt": true,
        "landing_success": null,
        "landing_type": "ASDS",
        "landpad": "5e9e3033383ecbb9e534e7cc"
      }
    ],
    "id": "5fbfecfe54ceb10a5664c80b"
  },
  {
    "fairings": {
      "reused": false,
      "recovery_attempt": false,
      "recovered": false,
      "ships": []
    },
    "links": {
      "patch": {
        "small": "https://images2.imgbox.com/3c/0e/T8iJcSN3_o.png",
        "large": "https://images2.imgbox.com/40/e3/GypSkayF_o.png"
      },
      "reddit": {
        "campaign": null,
        "launch": null,
        "media": null,
        "recovery": null
      },
      "flickr": {
        "small": [],
        "original": []
      },
      "presskit": null,
      "webcast": "https://www.youtube.com/watch?v=0a_00nJ_Y88",
      "youtube_id": "0a_00nJ_Y88",
      "article": "https://www.space.com/2196-spacex-inaugural-falcon-1-rocket-lost-launch.html",
      "wikipedia": "https://en.wikipedia.org/wiki/DemoSat"
    },
    "static_fire_date_utc": "2006-03-17T00:00:00.000Z",
    "static_fire_date_unix": 1142553600,
    "tbd": false,
    "net": false,
    "window": 0,
    "rocket": "5e9d0d95eda69955f709d1eb",
    "success": false,
    "details": "Engine failure at 33 seconds and loss of vehicle",
    "crew": [],
    "ships": [],
    "capsules": [],
    "payloads": [
      "5eb0e4b5b6c3bb0006eeb1e1"
    ],
    "launchpad": "5e9e4502f5090995de566f86",
    "auto_update": true,
    "launch_library_id": null,
    "failures": [
      {
        "time": 33,
        "altitude": null,
        "reason": "merlin engine failure"
      }
    ],
    "flight_number": 1,
    "name": "FalconSat",
    "date_utc": "2006-03-24T22:30:00.000Z",
    "date_unix": 1143239400,
    "date_local": "2006-03-25T10:30:00+12:00",
    "date_precision": "hour",
    "upcoming": false,
    "cores": [
      {
        "core": "5e9e289df35918033d3b2623",
        "flight": 1,
        "gridfins": false,
        "legs": false,
        "reused": false,
        "landing_attempt": false,
        "landing_success": null,
        "landing_type": null,
        "landpad": null
      }
    ],
    "id": "5eb87cd9ffd86e000604b32a"
  }
    ]''';
}
