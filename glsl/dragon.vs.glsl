varying vec3 interpolatedNormal;

varying float dist;
uniform vec3 remotePosition;
uniform int rcState;
uniform float times;

// from http://www.neilmendoza.com/glsl-rotation-about-an-arbitrary-axis/
mat4 rotationMatrix(vec3 axis, float angle)
{
    axis = normalize(axis);
    float s = sin(angle);
    float c = cos(angle);
    float oc = 1.0 - c;
    
    return mat4(oc * axis.x * axis.x + c,           oc * axis.x * axis.y - axis.z * s,  oc * axis.z * axis.x + axis.y * s,  0.0,
                oc * axis.x * axis.y + axis.z * s,  oc * axis.y * axis.y + c,           oc * axis.y * axis.z - axis.x * s,  0.0,
                oc * axis.z * axis.x - axis.y * s,  oc * axis.y * axis.z + axis.x * s,  oc * axis.z * axis.z + c,           0.0,
                0.0,                                0.0,                                0.0,                                1.0);
}

void main() {

    interpolatedNormal = normal;
    vec3 truePosition = position * vec3(6.0) + vec3(0.0, 0.8, 0.0);
    vec3 trueRemotePosition = remotePosition * vec3(0.36) + vec3(0, -1.1, 0);

    dist = distance(modelMatrix * vec4(truePosition,1.0), modelMatrix * vec4(trueRemotePosition,1.0));

	mat4 rotation = rotationMatrix(trueRemotePosition, times);
    vec3 deformedPosition = dist>=3.0? truePosition: truePosition - vec3(0.16)*vec3(fract(dist+times));

    gl_Position = rcState!=4? projectionMatrix * modelViewMatrix * vec4(truePosition, 1.0): projectionMatrix * modelViewMatrix * rotation * vec4(deformedPosition, 1.0);
}

