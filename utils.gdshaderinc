float remap(float value, float inputMin, float inputMax, float outputMin, float outputMax) {
	return outputMin + (outputMax - outputMin) * (value - inputMin) / (inputMax - inputMin);
}

float inversemix(float a, float b, float v){
	return (v-a)/(b-a); 
}
