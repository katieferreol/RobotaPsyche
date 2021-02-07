# ROBOTA PSYCHE ASSIGNMENT 1: Moving Rocket Arrow Keys

My final project will make use of a Piezo buzzer, a potentiometer, and three buttons that communicate to Processing to make a Flappy Bird game with an additional Customization Page that communicates Arduino to Processing.

## PROCESS

My inspiration for this product was through the Piezo buzzer. I noticed that most of the songs produced on there eminated quite an 8-bit sound, so I wanted my game to embody that as well just to make it well rounded. I first wanted to do Pacman, which I started for the first few days, but it was a bit too difficult as you would need many constraints for the maze. 

![](images/pacmansheet.png)

Thankfully, I was able to come across an old game that I played back in 2015, Flappy Bird. Due to it being discountinued, this actually incentivized me more to bring it back to life through Processing and Arduino. I was able to find the image assets through [this Spriters Resource link.](https://www.spriters-resource.com/mobile/flappybird/sheet/59537/)

![](images/assets.png)

## SETBACKS

### Collision Detection

I had quite a hard time coding the constraints of the pipes, as I realized there is no such thing as image collision detection in Processing. Therefore, my solution was to create an area using a rectangle that fit the space in between the pipes, and measure that distance as being passable. I had to do this for the pipes as well to trigger the lose function.

![](images/passarea.png)

After I knew this was working, I removed the fill and stroke of both. Then, I used the print() function to make sure that it was doing its job, with it printing "PASS" if it passes the pipe or "FAIL" if it hits the pipe.

![alt-text](images/birdmove2.gif)

However, this wasn't working all the time, so I decided to invest a full day in starting from scratch and creating new constraints and making sure it is working every time the bird hits a pipe.

![alt-text](images/smoothpipes.gif)

### Realistic Bird Movement

After this, another problem I was able to solve was getting the bird to move more like it's jumping. In the original version of Flappy Bird, whenever the bird jumps, it mimics a person jumping. However, for me, it was only floating, making it seem easier. I was finally able to look at how to mimic this by creating velocity and gravity functions to the bird.

OLD:

![alt-text](images/birdmove1.gif)

NEW (simple version):

![alt-text](images/ballmove.gif)

### Button State-Reading

A problem I was having was making the buttons not PUSH-buttons, but STATE-buttons, meaning it would turn on when I press it once and turn off if I press it again. This was quite hard to do, as the tutorials I found made use of only one button. This meant my buttons would only change their state if the other two were off.

![alt-text](images/serial1.gif)

However, I was able to get it to work using a code that I refined to make it work for all three buttons:

    if (yellowPush % 2 == 1) {
          yellowPush = 0;
          val2 = 0;
        }
        if ((redPush % 2 == 1)) {
          redPush = 0;
          val2 = 1;
        }
        if (bluePush % 2 == 1) {
          bluePush = 0;
          val2 = 2;
        }

### Processing-Arduino Communication

Lastly, a problem I was having was regarding my Piezo buzzer: even though Processing was printing that the bird passed the pipes and the player's score would increase, it wouldn't play the 1-UP sound effect. I thought this was a problem with the buzzer itself.

However, having a talk with Professor, I realized that this was due to me serial reading an Arduino variable that _Arduino_ sends values to, even if thats not necessary because I only need to read the Processing variables.

![](images/discordconvo.png)

## FINAL

