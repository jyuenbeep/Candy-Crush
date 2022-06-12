# Candy-Crush

## Group Name: 
JAVA CAT

## Group Members: 
Jasmine Yuen & Bernadette Baroi 

## Project Description: 
Our project will be a replica of the ever-so popular Candy Crush game. Though that game is built for mobile devices, our project will run through Processing. Our plan is to make a visualized candy crush game on processing with creative visuals and maybe music in the background. Our game will include various levels, moves (which counts how many moves we have left), goal (it’ll display the task of that level), a hint (will give a clue may or may not be helpful), some extra power ups that you get in the beginning and can earn through out the game. Each level will increase the difficulty level and include more unique candies.   

## [Design Document][1]
[1]: https://docs.google.com/document/d/1zMXT3fx49sa6R71bYxJQ2Ro-TPaQibq2zvGR7gCgdPc/edit?usp=sharing

## Development Logs: 

### Jasmine Yuen:

5/18:
Started the prototype and listed out the needed sections to fulfill. Also trying to do all the READme stuff that is required.

5/19:
Continued working on the prototype and discussed what our game would look like. 

5/21: 
Classes/methods finalized and prototype basically done except for the UML diagram, which we will do based on the prototype. Also changed up the project description a little. 

5/23:
Worked on level{} class and added accessor/mutator methods.

5/24:
The board and setup is basically done but I am still trying to figure out movement. 

5/25: 
Moving the candies still not working so I'm working on that. Also managed to merge my changes onto main branch. 

5/26: 
Tried moving around the methods/variables and breaking down the code into smaller sections for testing and debugging. However, the error persists. I realized the error was with how I was switching the elements of the candyList but I don't know how to fix it. 

5/27: 
The candies move now! The issue was that I was switching the candies of the candyList, but not switching the positions of the actual candies. I changed it by changing the x and y positions of the two candies instead. Also changed the positions of some booleans after that.

5/29: 
My partner worked on trying to do the clear methods. I looked over the code and I might move the clear methods into candyType instead. I added in an extra instance variable to candyList and am thinking of changing up candyList to make it easier to check for edge-cases.

5/30: 
Worked on trying to clear a whole row instead of only swapping. Once that was up and running, I added in a instance variable for points for the candyList and displayed it in the draw. Also, I made it so that it would add 100 points everytime three candies were cleared. Also made it so that user can only swap adjacent candies. 

5/31:
Decided to change the candyList from a 1d array to a 2d array of candies. Had to edit the constructor + all methods, accesors, and mutators associated. 

6/1:
Code is broken right now after the change to 2d array. The setup and swapping does not work. Neither does the dropping down candies after combo matching. 

6/2:
Fixed the swapping. Added images and changed the candies to look like the in-game sprites but it's making the program run very slow.

6/3: 
With the images added, there's one extra row and one less col on the board. Plus, they are placed in the wrong place. That issue was fixed.

6/4: 
Tried to load the PImages in the main first to see if it would make the code run faster. It did get slightly faster but is still very slow. I can tell since the cursor we made was lagging behind the actual computer cursor. 

6/5: 
The code was crashing my laptop so I tried working on speed still to make it faster. Found out the issue was the display() since removing the background or other parts of the code made no difference.

6/6: 
Now it is noticeably faster, though the frames are still slow in comparison to a normal game. Made a keyPressed() method for when you press 'r,' you can clear the board and candies and get a new level.

6/7: 
Trying to make the clearing row/col methods also clear for combos of 3, 4, 5. Also trying to make the code more flexible.

6/8: 
Clearing combos of 3, 4, 5 candies works for columns now.

6/9: 
Trying to do clearing 3, 4, 5 combos for rows as well. 

6/10: 
Trying to fix setGoal() so that everytime a combo of a specific candy is made, it decrements the goal number of that candy to be cleared by the combo made with that candy.

6/11: 
setGoal() works half the time, but not always. Also fixed the distance so that swapping works in between all the levels and not just a specific one.

### Bernadette Baroi:

5/19: Began working on the prototype and updating our documents. 

5/20: Beautified the prototype. 

5/22: Finished the prototype. Worked on the methods and on UML diagrams. Brainstormed ideas.

5/23: began conding of a class. not sure if my branch commited.

5/25: been trying to get movements to work and tried getting a different setup but its not going as planned. 

5/27: helped fix the move function. Even tho we had the code, we just needed to switch the reference. 

5/28-29: worked on the clearing method. It clears somewhat but then it doesn't add new candies after clearing or move down the candies. Fixed up the board to make it a 8 * 10. 

5/30: I finished and did the row clearing and column clearing for 3 matches. Now im working to make matches such as L and T.

5/31-6/1: fixed all the methods to correspond with the 2d array. We got stuck at some silly part but we figured it out. 

6/2: Finished the top L/T shape clearing method. All the clearing methods work. Now i'm working on the upside down L/T clearing method. I also implemented a new class called level. Just wrote down some basic level methods such get, set, constructors. 

6/3 & 6/6: worked on level class. Now it generates goals and the amount of moves. It also increase the level. 

6/7-6/9: I finished the level class. Now theres a key to skip between each levels. My partner is working to condense my clearing codes.

6/10-6/12: Fixing glitches, beautifying candy crush, adding smooth transitions.  
