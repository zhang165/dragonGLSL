// Create shared variable for the vertex and fragment shaders
varying vec3 interpolatedNormal;
/* HINT: YOU WILL NEED A DIFFERENT SHARED VARIABLE TO COLOR ACCORDING TO POSITION */
varying float dist;
uniform vec3 remotePosition;

void main() {
    // Set shared variable to vertex normal
    interpolatedNormal = normal;

    // Multiply each vertex by the model-view matrix and the projection matrix to get final vertex position
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 0.15) + vec4(0,1.6,0,0);
    dist = distance(modelMatrix * vec4(position, 1.0) + vec4(0,1.6,0,0), modelMatrix * vec4(remotePosition, 1.0));
}
