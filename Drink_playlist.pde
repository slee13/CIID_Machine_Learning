import ddf.minim.*;
import oscP5.*;
import netP5.*;
OscP5 oscP5;

Minim minim;

AudioSample[] sounds;
AudioPlayer[] coffeePlayer;
AudioPlayer[] beerPlayer;
AudioPlayer[] winePlayer;

int lastClass = 0;
int currentClass = 0;
int playlistSize = 5;
int lastSong, lastCoffeeSong, lastBeerSong, lastWineSong = 0;
int currentSong, currentCoffeeSong, currentBeerSong, currentWineSong = 0;

void setup()
{
  size(600, 400);
  minim = new Minim(this);
  oscP5 = new OscP5(this, 8000);
  
  coffeePlayer = new AudioPlayer[playlistSize];
  coffeePlayer[0] = minim.loadFile("1.mp3");
  coffeePlayer[1] = minim.loadFile("2.mp3");
  coffeePlayer[2] = minim.loadFile("3.mp3");
  coffeePlayer[3] = minim.loadFile("4.mp3");
  coffeePlayer[4] = minim.loadFile("5.mp3");
  
  beerPlayer = new AudioPlayer[playlistSize];
  beerPlayer[0] = minim.loadFile("6.mp3");
  beerPlayer[1] = minim.loadFile("7.mp3");
  beerPlayer[2] = minim.loadFile("8.mp3");
  beerPlayer[3] = minim.loadFile("9.mp3");
  beerPlayer[4] = minim.loadFile("10.mp3");
  
  winePlayer = new AudioPlayer[playlistSize];
  winePlayer[0] = minim.loadFile("11.mp3");
  winePlayer[1] = minim.loadFile("12.mp3");
  winePlayer[2] = minim.loadFile("13.mp3");
  winePlayer[3] = minim.loadFile("14.mp3");
  winePlayer[4] = minim.loadFile("15.mp3");
}

void draw()
{
  background(0);
  textSize(64);
  text(currentClass, width/2, height/2);
  //Only trig if current class is different from last class  
  nextSong();
    if (currentClass != lastClass) {
      playDrinkPlaylist(currentClass);
    }
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/classification") == true) {
      currentClass = (int) theOscMessage.get(0).intValue();
  }
}

void playDrinkPlaylist(int playlist) {
  if (playlist == 1) { 
    println(currentCoffeeSong);
          mutePlayers();
          //if(!coffeePlayer[lastCoffeeSong%playlistSize].isPlaying()) {
          //  println(currentCoffeeSong%playlistSize);
          //  coffeePlayer[currentCoffeeSong%playlistSize].play();
          //  lastCoffeeSong = currentCoffeeSong;
          //  currentCoffeeSong++;
          //}
          if(!coffeePlayer[lastSong%playlistSize].isPlaying()) {
            println(currentSong%5);
            coffeePlayer[currentSong%playlistSize].play();
            lastSong = currentSong;
            currentSong++;
          }
        }
        if (currentClass == 2) {
          mutePlayers();
          //if(!beerPlayer[lastBeerSong%playlistSize].isPlaying()) {
          //  println(currentBeerSong%playlistSize);
          //  beerPlayer[currentBeerSong%playlistSize].play();
          //  lastBeerSong = currentBeerSong;
          //  currentBeerSong++;
          //}
          if(!beerPlayer[lastSong%playlistSize].isPlaying()) {
            println(currentSong%playlistSize);
            beerPlayer[currentSong%playlistSize].play();
            lastSong = currentSong;
            currentSong++;
          }
        }
        if (currentClass == 3) {
          mutePlayers();
          //if(!winePlayer[lastWineSong%playlistSize].isPlaying()) {
          //  println(currentWineSong%playlistSize);
          //  winePlayer[currentWineSong%playlistSize].play();
          //  lastWineSong = currentCoffeeSong;
          //  currentWineSong++;
          //}
          if(!winePlayer[lastSong%playlistSize].isPlaying()) {
            println(currentSong%playlistSize);
            winePlayer[currentSong%playlistSize].play();
            lastSong = currentSong;
            currentSong++;
          }
          
        }
      lastClass = currentClass;
}

void mutePlayers() {
  for (int i = 0; i<playlistSize; i++) {
    coffeePlayer[i].pause();
    beerPlayer[i].pause();
    winePlayer[i].pause();
    //coffeePlayer[i].rewind();
    //beerPlayer[i].rewind();
    //winePlayer[i].rewind();
  }
}

void nextSong() {
  if (currentClass == 4) {
    currentClass = lastClass;
    playDrinkPlaylist(lastClass);
  }
}