// Create shared variable. The value is given as the interpolation between normals computed in the vertex shader
varying vec3 interpolatedNormal;
uniform int rcState;
uniform float times;

/* HINT: YOU WILL NEED A DIFFERENT SHARED VARIABLE TO COLOR ACCORDING TO POSITION */
varying float dist;

void main() {
  vec4 color;
  float auraDist = 4.0;
  float offset = mod(times, 1.0);

  if(rcState==1){ // set the remote aura color
		color = vec4(0.7, 0.2, 0.2, 1);
	}else if(rcState==2){
		color = vec4(0.2, 0.7, 0.2, 1);
	}else{
		color = vec4(0.2, 0.2, 0.7, 1);
	}

	if(rcState==4){
		gl_FragColor = dist >= auraDist?vec4(normalize(interpolatedNormal), 1.0): vec4(normalize(interpolatedNormal), 1.0) + vec4(offset, offset, offset, 0.0);
	}else{
  		gl_FragColor = dist >= auraDist? vec4(normalize(interpolatedNormal), 1.0): color; 
  }
}
