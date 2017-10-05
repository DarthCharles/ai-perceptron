// Class used to describe a point.
// It has x and Y coordinate and a known output.
// Eg. y=1/2x
class Trainer {
  float[] inputs;
  int answer;

  Trainer(float x, float y, int a) {
    inputs = new float[32];
    inputs[0] = x;
    inputs[1] = y;
    inputs[2] = 1;

    answer = a;
  }

  float getX() {
    return inputs[0];
  }

  float getY() {
    return inputs[1];
  }
}