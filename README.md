## Talkwatch&trade;

Talkwatch is an automated moderator for [ReplTalk](https://replit.com/talk) that listens to recent posts and comments and filters out sketchy content. "Sketchy" content inlcudes but is not limited to:

+ Spam & Low Effort
+ Advertisements
+ NSFW & Profanities
+ etc.

Since sketchy content detection can be innacurate in a multitude of ways, Talkwatch will never take any action more drastic than a warn. All actions that Talkwatch takes will be made public on the [main site](https://talkwatch.frissyn.repl.co/) and can be viewed in the logs.

## Developement Info

This project is still a work in progress, and there's a lot of stuff that could break or go wrong. Talkwatch will only make reports until it's got a proven track record of making accurate detections of sketchy content. Until then, it's better to play it safe.

Talkwatch is powered by making requests to Replit's GraphQL API, and the code to perform these actions will remain hidden for the obvious purpose of security and safety. Wouldn't want just anybody to start automating their ReplTalk accounts!

**Developement Stack:**

|Category|Name|
|:-------|:--:|
|Language|Crystal|
|Server|Kemal|
|Database|Local YAML|
|Requests|GraphQL|

**Building and Running:**

1. `git clone https://github.com/frissyn/talkwatch.git`
2. `cd talkwatch`
3. Create a `.env` file and put in your Replit sid: `connect.sid=...`
4. Build source and run with `make`

*Note:* As stated before, the GraphQL queries will not be included, so you need to implement your own in order for the moderator to actually work. (You also need a sid with moderator permissions lol).