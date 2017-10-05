// Data for training Perceptron.
Trainer[] trainingPoints = new Trainer[2500];
// Data for validating perceptron.
PVector[] testData = new PVector[1000];
// Perceptron object.
Perceptron perceptron;
int count = 0;

// The function to describe a line: y= mx+b
float f(float x) {
  return 1*x;
}

// Test data that will be used to verify perceptrons accuracy.
void populateTestData() {
  for (int i = 0; i < testData.length; i++) {
    float x = random(width);
    float y = random(height);
    testData[i] = new PVector(x, y);
  }
}

// Training data with known output.
void populateTrainingData() {
  for (int i = 0; i < trainingPoints.length; i++) {
    float x = random(width);
    float y = random(height);

    int answer = (y > f(x)) ? 1 : -1;
    trainingPoints[i] = new Trainer(x, y, answer);
  }
}

void trainPerceptron() {
  for (Trainer tp : trainingPoints) {
    perceptron.train(tp.inputs, tp.answer);
  }
  perceptron.printWeights();
}

void drawRect() {
  // Draw line y= mx + b
  stroke(255);
  strokeWeight(4);
  line(0, f(0), width, f(width));
  noStroke();
}

void drawTraining() {
  perceptron.train(trainingPoints[count].inputs, trainingPoints[count].answer);
  count = (count + 1) % testData.length;

  for (int i=0; i < count; i++) {
    if (perceptron.guess(trainingPoints[i].inputs) == 1) {
      fill(0, 255, 0);
    } else { 
      fill(255, 0, 0);
    }
    ellipse(trainingPoints[i].getX(), trainingPoints[i].getY(), 4, 4);
  }
}
void drawTestData() {
  // Draw testData points to see if they are correctly guessed
  for (PVector v : testData) {
    float inputs[] = {v.x, v.y, 1};
    if (perceptron.guess(inputs) == 1) {
      fill(0, 255, 0);
    } else { 
      fill(255, 0, 0);
    }
    ellipse(v.x, v.y, 4, 4);
  }
}

void setup() {
  size(840, 840);
  // Set background color (black)
  background(0);
  perceptron = new Perceptron(3, 0.00001);
  populateTrainingData();
  populateTestData();
  trainPerceptron();
}

void draw() {
  drawRect();
  //drawTraining();
  drawTestData();
}