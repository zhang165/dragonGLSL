varying vec3 interpolatedNormal;

varying float dist;
uniform vec3 remotePosition;
uniform int rcState;
uniform float times;

float random( vec3 scale, float seed ){
    return fract( sin( seed ) * 43758.5453 + seed ) ;
}

void main() {
	float r = random( vec3( 12.9898, 78.233, 151.7182 ), 0.0 );

    interpolatedNormal = normal;
    vec3 truePosition = position * vec3(6.0) + vec3(0.0, 0.8, 0.0);
    vec3 trueRemotePosition = remotePosition * vec3(0.36) + vec3(0, -1.1, 0);

    dist = distance(modelMatrix * vec4(truePosition,1.0), modelMatrix * vec4(trueRemotePosition,1.0));

    vec3 deformedPosition = dist>=3.0? truePosition: truePosition + vec3(0.16)*vec3(fract(dist+times));

    gl_Position = rcState!=4? projectionMatrix * modelViewMatrix * vec4(truePosition, 1.0): projectionMatrix * modelViewMatrix * vec4(deformedPosition, 1.0);
}

