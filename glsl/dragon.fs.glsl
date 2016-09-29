// Create shared variable. The value is given as the interpolation between normals computed in the vertex shader
varying vec3 interpolatedNormal;

/* HINT: YOU WILL NEED A DIFFERENT SHARED VARIABLE TO COLOR ACCORDING TO POSITION */
varying float dist;

void main() {
  // Set final rendered color according to the surface normal
  gl_FragColor = dist >= 10.0? vec4(normalize(interpolatedNormal), 1.0): vec4(1,0,1,1); // REPLACE ME
}
