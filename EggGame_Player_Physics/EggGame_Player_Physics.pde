boolean newletter;
boolean direction;
boolean jump;
float velocity;
float velocityconst;
Player player;

class Player {
    color c;
    float xpos;
    float ypos;
    float xspeed;

    Player(color clr, float xPos, float yPos, float xSpeed) {
        c = clr;
        xpos = xPos;
        ypos = yPos;
        xspeed = xSpeed;
    }

    void display() {
        rectMode(CENTER);
        noStroke();
        fill(c);
        rect(xpos,ypos,20,20);
    }

    void drive(boolean dir) {
        if ((xpos + xspeed) > width && (dir)) {
            float remainder = float(width) - xpos;
            xpos = 0 + (xspeed - remainder);
        } else if ((xpos - xspeed) < 0 && !(dir)) {
            float remainder = xpos - 0;
            xpos = width - (xspeed - remainder);
        } else {
            if (dir) xpos += xspeed;
            else xpos -= xspeed;
        }
    }

    void jump() {
        velocity = velocity + 0.5;
        if(ypos + velocity > (height/2)) {
            ypos = height/2;
            jump = false;
            velocity = velocityconst;
        } else {
            ypos += velocity;
        }
    }
}

void setup() {
    size(1000,1000);
    player = new Player(color(255,0,0),0,height/2,5);
    velocityconst = -8.0;
    velocity = velocityconst;
}

void draw() {
    background(255);

    println(newletter, " ", jump);
    if(newletter == true) {
      player.drive(direction);
    }
    if(jump == true) {
        player.jump();
    }

    player.display();
}

void keyPressed()
{
    if(key == 'A' || key == 'a') {
        direction = false;
        newletter = true; 
    } else if (key == 'D' || key == 'd') {
        direction = true;
        newletter = true;
    }

    if (key == ' ' || key == ' ') {
        jump = true;
    } 
}

void keyReleased()
{
    if (key == 'A' || key == 'a' || key == 'D' || key == 'd') {
        newletter = false;
    }
}
