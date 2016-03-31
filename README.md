# Intro
This project came from my experience as a volunteer for the Weekend Women's Paddle tournament here in Chicago in 2015.

The idea is to do bookeeping for a tournament. Here is an example of a [draw](public/buenos_aires_draw.pdf).

The tournament happened when I had just acted on the idea of changing my career to software development.

I knew the problem could be solved, but I did not have the skills to solve this problem yet.

After a year, I attempted to solve this on my spare time at home. I ended up learning a lot about how draws
actually work. All my life playing tournaments and I never had any idea of how things were structured.

This was a good minimum viable product that actually helped some friends follow Kelsey (my fiancee at the time of this writing) while she played. She lost in the final. I think she will win it next year!!

Live app is here: http://paddletournament.herokuapp.com/

# Tech
This is a Rails app with a Postgres database. There is some jQuery and JavaScript in there as well.

My good friend [Nicole Carpenter](https://github.com/NicoleCarpenter) helped me make this pretty and ready for production.

# Reflections/Takeaways
The first release (v1) was acceptable. Nicole worked her magic and made the display a lot cleaner than I had originally thought.

I was happy that the backend (data) was sound and that records were updated correctly. We achieved the basic functionality of moving a player through the draw and making it simple to do so.

Small optimizations matter. The simplest optimization that I enforced during the tournament prep meeting was to ask players to report scores via text instead of phone calls. This wasn't ever a programmatic solution, but it made life a lot easier.

It is great to have a test run and run systems in parallel.

This was a great learning experience for me and it was also an indication that I made a career switch to the better. I enjoy solving real business problems and this is a perfect example of one. Thank you Nicole for working with me!

## Things I would have liked to do if we had more time, maybe for v2:

- write more tests. this was a pain, because I had to do manual testing instead. Horrible.
- write a function that automatically places players on their subsequent draws and call the function each time until draws are all populated correctly. This was also a pain, as I had to use heroku console live to place people. Once they were on the draw, I could move them, which was fine, but placing them was annoying.
- write the draw html instead of using what I pieced together online. This was great to do rapid development, but yielded an annoying, inflexible interface use.
- secure the app. Give basic authorization to edit the draws.
- player profile with "Next Match" feature. This is probably the most valuable feature, as it would solve most, if not all inquiries about location/time.
- upload draw with a csv feature. Instead of manually generating seed/data for each tournament
