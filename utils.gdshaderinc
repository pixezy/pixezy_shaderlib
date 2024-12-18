float remap(float value, float inputMin, float inputMax, float outputMin, float outputMax) {
    return outputMin + (outputMax - outputMin) * (value - inputMin) / (inputMax - inputMin);
}