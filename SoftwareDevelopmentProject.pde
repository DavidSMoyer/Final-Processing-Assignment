float playerX = 400; // The X location of the player.

float bossX = 500; // The X location of the boss.
float bossY = 200; // The Y location of the boss.
float bossXSpeed = random(-3,3); // The X speed of the boss.
float bossYSpeed = random(-3,3); // The Y speed of the boss.
float bossMoveDelay = 0; // The delay between the boss moving.
boolean bossMove = true; // Detects if the boss is moving or not.

float ballX = 400; // The X position of the ball.
float ballY = 500; // The Y position of the ball.
float ballXSpeed = 7; // The X speed of the ball.
float ballYSpeed = 7; // The Y position of the ball.

boolean started = false; // Detects if the game has started or not.
boolean gameOver = false; // Detects if the game over screen should be displayed.
boolean fade = false; // Detects if the title is fading.
boolean hitBoss = false; // Detects if the ball has hit the boss. Prevents multiple hits and a certain bug.
int fadeAmount = 255; // The amount of fade from the title screen.

int lives = 5; // The player's lives.
int bossHP = 20; // The boss's health.

PImage boss; // The image for the boss.
PImage evilBall; // The image for the evil balls.

float evilBall1X = 600; // The X location of the first evil ball.
float evilBall1Y = 200; // The Y location of the first evil ball.
float evilBall2X = 400; // The X location of the second evil ball.
float evilBall2Y = 200; // The Y location of the second evil ball.
float evilBall1XSpeed = 5; // The X speed of the first evil ball.
float evilBall1YSpeed = 5; // The Y speed of the first evil ball.
float evilBall2XSpeed = -5; // The X speed of the second evil ball.
float evilBall2YSpeed = -5; // The Y speed of the second evil ball.



void setup() { // When the game starts...
  size(1000,1000); // Sets the size of the window to 1000 by 1000 pixels.
  boss = loadImage("boss.png"); // Loads the image for the boss.
  evilBall = loadImage("evilBall.png"); // Loads the image for the evil balls.
}

void draw() {
  if (started == true & gameOver == false & bossHP > 0) { // If the game has started and the game over screen is not displayed...
    background(0); // Sets the background to black.
    ellipseMode(CENTER); // Sets the ellipse mode to CENTER.
    ellipse(random(1000),random(1000),10,10); // Creates two stars at random positions.
    ellipse(random(1000),random(1000),10,10);
    
    imageMode(CENTER); // Sets the image mode to CENTER.
    image(boss,bossX,bossY,500,500); // Creates the boss.
    
    fill(255,0,0); // Sets the fill to red.
    rectMode(CORNERS); // Sets the rect mode to CORNERS.
    rect(150,950,150+bossHP*40,975); // Creates the boss's health bar.
    println(bossHP);
    
    rectMode(CENTER); // Sets rect mode to CENTER.
    fill(255); // Fills with white.
    rect(playerX,900,300,25); // Creates the player's bar.
    
    ellipseMode(CENTER); // Sets ellipse mode to CENTER.
    ellipse(ballX,ballY,25,25); // Creates the ball.
    
    imageMode(CENTER); // Sets the image mode to CENTER.
    image(evilBall,evilBall1X,evilBall1Y,100,100); // Creates the first evil ball.
    image(evilBall,evilBall2X,evilBall2Y,100,100); // Creates the second evil ball.
    
    evilBall1X = evilBall1X + evilBall1XSpeed; // Moves the evil balls.
    evilBall1Y = evilBall1Y + evilBall1YSpeed;
    evilBall2X = evilBall2X + evilBall2XSpeed;
    evilBall2Y = evilBall2Y + evilBall2YSpeed;
    playerX = mouseX; // Sets the player's X to the mouse position.
    
    if (evilBall1X > 1000) { // Makes the first evil ball bounce off the walls.
      evilBall1XSpeed = evilBall1XSpeed * -1;
    }
    if (evilBall1Y > 1000) {
      evilBall1YSpeed = evilBall1YSpeed * -1;
    }
    if (evilBall1X < 0) {
      evilBall1XSpeed = evilBall1XSpeed * -1;
    }
    if (evilBall1Y < 0) {
      evilBall1YSpeed = evilBall1YSpeed * -1;
    }
    
    if (evilBall2X > 1000) { // Makes the second evil ball bounce off the walls.
      evilBall2XSpeed = evilBall2XSpeed * -1;
    }
    if (evilBall2Y > 1000) {
      evilBall2YSpeed = evilBall2YSpeed * -1;
    }
    if (evilBall2X < 0) {
      evilBall2XSpeed = evilBall2XSpeed * -1;
    }
    if (evilBall2Y < 0) {
      evilBall2YSpeed = evilBall2YSpeed * -1;
    }
    
    if (lives == 0) { // If the player has no lives...
      gameOver = true; // Display the game over screen.
    } else { // Else...
      fill(255);
      rectMode(CORNERS); // Sets the rect mode to CORNERS.
      rect(25,950,25+lives*20,975); // Creates the player's health bar.
      rectMode(CENTER); // Sets the rect mode to CENTER.
    }
    
    
    if (evilBall1X + 25 > playerX - 150 & evilBall1X + 25 < playerX + 150 & evilBall1Y + 25 > 881.5 & evilBall1Y - 25 < 912.5) { // Detects if the evil balls hit the player.
      evilBall1YSpeed = evilBall1YSpeed * -1; // Makes the evil balls bounce off.
      lives--; // Removes a life.
      fill(255,0,0); // Makes the player flash red.
      rect(playerX,900,300,25);
    }
    if (evilBall2X + 25 > playerX - 150 & evilBall2X + 25 < playerX + 150 & evilBall2Y + 25 > 881.5 & evilBall2Y - 25 < 912.5) {
      evilBall2YSpeed = evilBall2YSpeed * -1;
      lives--;
      fill(255,0,0);
      rect(playerX,900,300,25);
    }
    
    ballX = ballX + ballXSpeed; // Moves the ball.
    ballY = ballY + ballYSpeed;
    
    if (ballX > 1000) { // Makes the ball bounce off the walls.
      ballXSpeed = ballXSpeed * -1;
    }
    if (ballX < 0) {
      ballXSpeed = ballXSpeed * -1;
    }
    if (ballY > 1000) { // If the ball touches the bottom of the screen..
      ballY = 500; // Reset it.
      ballX = 400;
      lives--; // Remove a life.
      hitBoss = false; // Makes it so the ball has not hit the boss.
    }
    if (ballY < 0) {
      ballYSpeed = ballYSpeed * -1;
    }
    
    if (ballX + 12.5 > playerX - 150 & ballX - 12.5 < playerX + 150 & ballY + 12.5 > 881.5 & ballY - 12.5 < 912.5) { // Makes the ball bounce off the player.
      ballYSpeed = ballYSpeed * -1;
      hitBoss = false; // Makes it so the ball has not hit the boss.
    }
    if (ballX + 12.5 > bossX - 200 & ballX - 12.5 < bossX + 200 & ballY + 12.5 > bossY - 200 & ballY - 12.5 < bossY + 200 & hitBoss == false) { // Makes the ball bounce off the boss.
      if (ballY + 12.5 > bossY + 150 || ballY - 12.5 < bossY - 150) {
        ballYSpeed = ballYSpeed * -1;
      }
      if (ballX + 12.5 > bossX + 150 || ballX - 12.5 < bossX - 150) {
        ballXSpeed = ballXSpeed * -1;
      }
      bossHP--; // Removes one of the boss's health.
      hitBoss = true; // Makes it so the ball has hit the boss.
    }
    
    if (bossMove == true) { // If the boss is moving..
      bossX = bossX + bossXSpeed; // Move the boss.
      bossY = bossY + bossYSpeed;
      if (bossX + 100 > 1000) { // Stop the boss from moving too far.
        bossX = bossX - bossXSpeed;
      }
      if (bossY + 100 > 300) {
        bossY = bossY - bossYSpeed;
      }
      if (bossY - 100 < 0) {
        bossY = bossY - bossYSpeed;
      }
      if (bossX - 100 < 0) {
        bossX = bossX - bossXSpeed;
      }
    }
    bossMoveDelay++; // Change the move delay by one.
    if (bossMoveDelay == 50) { // If the move delay is 50...
      bossMove = !bossMove; // Flip the boss movement boolean.
      bossMoveDelay = 0; // Reset the counter.
      bossXSpeed = random(-3,3); // Make the boss move in a random direction.
      bossXSpeed = random(-3,3);
    }
  } else if (started == false) { // Else if the game has not started...
    background(0); // Set the background to black.
    rectMode(CENTER); // Set rect mode to CENTER.
    fill(255,fadeAmount); // Set fill to white with the transparency value.
    textAlign(CENTER); // Set the text align to CENTER.
    textSize(100); // Set the text size to 100.
    text("Pong Invasion",500,200); // Display "Pong Invasion" on the title screen.
    stroke(255,fadeAmount); // Set the stroke to white with the transparency value.
    fill(0); // Set fill to black.
    rect(500,500,200,75); // Create the start button box.
    textSize(30); // Set the text size to 30.
    fill(255,fadeAmount); // Set fill to white with the transparency value.
    text("S T A R T",500,510); // Create the text "S T A R T" on the start button.
    stroke(0); // Set the stroke to black.
    if (fade == true) { // If fade is true...
      if (fadeAmount > 0) { // If the fade amount is greater than 0...
        fadeAmount = fadeAmount - 5; // Change the transparency by -5.
      } else { // Else...
        started = true; // Start the game.
      }
    }
  } else if (gameOver == true) { // Else if the game over screen is displayed...
    background(0); // Set the background to black.
    fill(255); // Set the fill to white.
    textSize(100); // Set the text size to 100.
    text("Game Over.",500,500); // Display the text "Game Over."
    textSize(50); // Set the text size to 50.
    text("Press SPACE to try again.",500,600); // Display text "Press SPACE to try again."
  } else if (bossHP == 0) { // Else if the boss's hp is 0...
    background(255,255,0); // Sets the background to yellow.
    fill(0); // Sets the fill to black.
    textSize(100); // Sets the text size to 100.
    text("Congratulations!",500,500); // Displays the text "Congratulations!"
    textSize(50); // Sets the text size to 50.
    text("You win!",500,600); // Displays the text "You win!"
    textSize(30); // Sets the text size to 30.
    text("Press SPACE to play again.",500,750); // Displays the text "Press SPACE to play again."
  }
}

void mouseClicked() { // If the mouse is clicked...
  if (mouseX < 600 & mouseX > 400 & mouseY < 537.5 & mouseY > 462.5 & started == false) { // If the game has not started and somebody clicks on the START button...
    fade = true; // Make the title fade out.
  }
}

void keyPressed() {
  if (key == ' ' & gameOver == true || key == ' ' & bossHP == 0) { // If the game over screen is displayed OR the boss's hp is 0 AND the key SPACE is pressed...
     evilBall1X = 600; // Reset all of the variables to their default state.
     evilBall1Y = 200;
     evilBall2X = 400;
     evilBall2Y = 200;
     evilBall1XSpeed = 5;
     evilBall1YSpeed = 5;
     evilBall2XSpeed = -5;
     evilBall2YSpeed = -5;
     playerX = 400;
     bossX = 500;
     bossY = 200;
     bossXSpeed = random(-3,3);
     bossYSpeed = random(-3,3);
     bossMoveDelay = 0;
     bossMove = true;
     ballX = 400;
     ballY = 500;
     ballXSpeed = 7;
     ballYSpeed = 7;
     hitBoss = false;
     gameOver = false;
     lives = 5;
     bossHP = 20;
  }
}
