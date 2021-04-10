
# ASSIGNMENT 6: AGGRESSIVENESS ASSOCIATION

For this assignment, we were told to implement a function that makes grey vehicles avoid the red vehicles, in the fear that they may be aggressive.

## PROCESS

Because Professor did not upload the code onto the Lecture Notes when I first tested it out, i thought that we either had to create a static code or a simple code depicting this avoidance of the red vehicles. i started off with a white ball moving according to the mouse coordinates, and a red ball going from left to right, changing aggressiveness depending on the random number of 0 or 1.

If the red ball was aggressive, if the white ball got too close to the red ball, the whole program would stop looping, as seen in the gif below.

![](images/simplecode.gif)

## PROBLEMS

### 1. JITTERY MOVEMENTS

One problem that I encountered was that I thought I broke the code. The vehicles were moving in a very jittery fashion, which made me think I copied the code wrong from the file by accident. However, even after copying the flowfield from the association and evolution files, it seemed like it was just the flowfield itself.

![](images/jittery.gif)

I tried to fix this by changing to the Perlin Noise flow field from past projects. I even tried making the shapes bigger. However, after noticing they all move in the same direction, I was worried that no vehicles would collide with one another, which was the whole point of the project. I decided to go back to the random flowfield.

![](images/randomflow.gif)
![](images/perlinflow.gif)

### 2. NOT KNOWING WHAT TO DO

To be honest, I had no idea what we had to do after the code was given to us. I thought that Professor already implemented the code for us, because the avoidAggressive() seemed like it was fulfilling what he wanted us to do. However, after closely examining the code, I noticed an empty function called "avoidRedVehicles()", and I realized *that* was what he wanted us to fill up. 

I did this by taking inspiration from the separate() function from past projects, and adding an if function for if the vehicle is red. The code for this function is below (highly simplified):

    void avoidRedVehicles(ArrayList<Vehicle> vehicles) {
          // Is other vehicle red?
          boolean otherIsRed = other.getIsRed();

          if (otherIsRed) {
            PVector diff = PVector.sub(location, other.location);
            diff.normalize();
            sum.add(diff);
            count++;
          }
        }

### 3. RECOGNIZING COLLISION ONCE

After completing this task, I wanted to try if it worked. Seeing the main file, I noticed that the only time grey vehicles will avoid red vehicles is only if the number of red, aggressive vehicles is higher than the threshold of 7. I wanted to try implement this by going into the Vehicle's "avoidAggressive()" function.

    if (otherIsRed) {
              redVehiclesThatAreAlsoAggressive++;
            }

However, as I expected, the code didn't recognize vehicles that already got in contact with the grey vehicle, and also did not count a collision as one. Instead, it counted the seconds they were collided, making the number go up higher super quickly. I printed it below:

![](images/printagg&red.gif)

I think Professor will show us this in class, so I left it for now because it's a start.
