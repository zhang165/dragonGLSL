varying vec3 interpolatedNormal;

varying float dist;
uniform vec3 remotePosition;

void main() {
    interpolatedNormal = normal;
    vec3 truePosition = position * vec3(6.0) + vec3(0.0, 0.8, 0.0);
    vec3 trueRemotePosition = remotePosition * vec3(0.36) + vec3(0, -1.1, 0);

    dist = distance(modelMatrix * vec4(truePosition,1.0), modelMatrix * vec4(trueRemotePosition,1.0));
    
    gl_Position = projectionMatrix * modelViewMatrix * vec4(truePosition, 1.0);
    
}
