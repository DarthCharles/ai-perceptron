class Perceptron {
  float[] weights;
  float lc;

  Perceptron(int n, float _lc) {
    weights = new float[n];
    for (int i =0; i < weights.length; i++) {
      weights[i] = random(-1, 1);
    }
    lc =_lc;
  }

  int activate(float sum) {
    return (sum > 0) ? 1 : -1;
  }

  int guess(float[] inputs) {
    float sum = 0;
    for (int i=0; i < weights.length; i++) {
      sum += weights[i] * inputs[i];
    }
    return activate(sum);
  }

  void train(float[] inputs, int desired) {
    int guess = guess(inputs);
    int error = desired - guess;
    // Tune all the weights
    for (int i=0; i < weights.length; i++) {
      weights[i] += error * inputs[i] * lc;
    }
  }

  void printWeights() {
    println("W1: " + weights[0] + " W2: "+ weights[1] + " W3: "+ weights[2]);
  }
}