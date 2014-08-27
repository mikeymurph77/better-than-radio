#Better Than Radio

![alt text](https://raw.githubusercontent.com/mikeymurph77/better-than-radio/master/better_than_radio/app/assets/images/logo.png)

Remember that awesome concert everyone still talks about? You know the one you didn't even know about until after the fact. How about that other time when you *JUST* missed purchasing the tickets before the show sold out? Well, those situations still may happen, but with Better Than Radio you can join in on the conversation.  

Better Than Radio is a social concert tracking application, which allows users the ability to see upcoming concerts in their area. Furthermore, a user can join the discussion with other concert attendees leading up to the show and post-show. 

This application also allows users to record and come back to memories of concerts they've attended in the past. 

Let's move on from this car sales man's pitch....

##Technologies used:

This application is built on the Ruby on Rails framework.

**Other tools used:**
Monban, CarrierWave, Kaminari, LetsRate, Bourbon, Neat and Bitters.

##Challenges
In the process of developing this app, I came across my fair share of speed bumps. To name a few:

When creating an account, the user must select a user type (i.e. Fan, Artist, or Venue) which will forever be associated with their account. Conceptualizing how this structure should be formed at the very beginning of the app development was a challenge because the user authentication gem; Monban, does not support multiple account types. To accomplish my task I made the User's model polymorphic and created individual account-type models to be associated with the User model. This made it easy to refer to specific account types later within the controllers and views.

Another challenge that I came across when building this app trails off from my first challenge. Having three different account types quickly clogged up my MVC structure. Throughout the building process, I found myself using similar methods between models and views to the point where they could be refactored down to save space and become DRY. I also found myself using code smells like 'if statements' inside another 'if statement'. Being that some views were used by multiple models, some of these code smells were necessary, however there is always room to improve and refactor. (**Status**: Work In Progress)

Lastly, this app was built in three weeks. Learning early on the importance of time management was the key to having a functional app by the end of the three weeks. In some cases it was mentally tough to put aside ideas and functions for this passion project that simply took too much time, or were plagued by issues during development. With that said, this app is and will always be a work in progress application. You will find updated commits, and I will do my best to keep this README current to code. 

##Connect
My name is Michael Murphy and I'm a Ruby on Rails developer. I was trained by [thoughtbot](http://thoughtbot.com/) developers at their bootcamp; [Metis](http://www.thisismetis.com/). I love music and live performances which is what inspired me to build this application.

[Twitter](https://twitter.com/mikeymurph77) | [Blog](http://mikeymurph.me/) | [LinkedIn](https://www.linkedin.com/in/michaelmmurphy)

###Cheers!
