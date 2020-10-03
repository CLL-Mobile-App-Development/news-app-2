# news-app
A mobile app to view top headlines and news. This project is intended to demonstrate different state management mechanisms in Flutter: with just widget constructor arguments, routing and screens, provider, bloc pattern. Each of those approaches are incorporated in the code base as layers, progressively, and can be pulled with respective final commits.

The stream of news input for the app is setup to be drawn programmatically from NewsAPI.org, through calls to their api end-points, to which access is granted for registered users through an api-key.
