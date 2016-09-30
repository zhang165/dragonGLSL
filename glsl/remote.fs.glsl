uniform int rcState;

void main() {
	//Paint it based on rcState
	if(rcState==1){
		gl_FragColor = vec4(1, 0, 0, 1);
	}else if(rcState==2){
		gl_FragColor = vec4(0, 1, 0, 1);
	}else if(rcState==2){
		gl_FragColor = vec4(0, 0, 1, 1);
	}else{
		gl_FragColor = vec4(0, 0.8, 0.9, 1);
	}
}