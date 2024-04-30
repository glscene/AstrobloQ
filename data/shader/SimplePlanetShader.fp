// Simple Planet Shader 
// https://www.shadertoy.com/view/Mt3GWj

#define AIR_DENSITY 1.0
#define ATMOSPHERE_HEIGHT 1.0

#define ROTATION_SPEED 3.0

#define SHADOWS
	#define SHADOW_DARKNESS 0.2

#define CITY_LIGHTS

float getNoise(vec2 coord){
	
    coord /= 10.0;
    
    float noise = texture(iChannel0, coord.st).x;
    noise += texture(iChannel0, coord.st * 2.0).x / 2.0;
    noise += texture(iChannel0, coord.st * 4.0).x / 4.0;
    noise += texture(iChannel0, coord.st * 8.0).x / 8.0;
    noise *= clamp(texture(iChannel0, coord.st / 3.0).x,0.0,1.0);
    
    return noise;
}

vec3 getTexure(vec2 coord){
    float noise = getNoise(coord);
	return mix( vec3(0.3,0.3,1.0) * 0.9, vec3(0.3,1.0,0.3) * 0.9, clamp(pow(noise,2.0),0.0,1.0));    
}

vec3 CityLights(vec2 coord, vec2 coord2, vec3 color, float planet){
    
    float noise = clamp(texture(iChannel0, coord.st).x,0.0,1.0);
    noise *= clamp(pow(getNoise(coord),2.0),0.0,1.0);
    
    noise = pow(noise, 8.0);
    
    float alpha = clamp(coord2.x,0.0,1.0);
    vec3 lightCol = vec3(1.0,1.0,0.25);
	
    return mix(color, lightCol, noise * alpha * planet);
}

float stars(vec2 coord){
	  float noise = clamp(texture(iChannel0, coord.st).x,0.0,1.0);
    
    noise = pow(noise, 20.0);
    
    return noise;
}

vec2 sunPos(vec2 lPos){
	lPos.x = (lPos.x * 2.0 - 1.0)* 2.0 + 0.5 + 0.5 - 7.0;
    
    return vec2(lPos.x,-0.5);
}

vec3 sun(vec2 coord, vec2 lPos){
    
    float circle = 1.0 - distance(coord, sunPos(lPos));
    
    circle = pow(circle, 5.0) * 2.0;
    
    return vec3(1.0,1.0,0.9) * clamp(circle * 1.0,0.0,1.0);
    
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    
	vec2 uv = fragCoord.xy / iResolution.xy;
    vec2 texC = uv;
    
    vec2 lpos = vec2(0.0,(1.0 / 5.0) * 2.0 - 1.0) + (iMouse.xy / iResolution.xy * 2.0 - 1.0) * 5.0 * 0.5 + 0.5;
    lpos.y = -0.5;
    
    vec2 texC2 = fragCoord.xy / iResolution.x;
    
    texC2 = (texC2 * 2.0 - 1.0 ) * 5.0 * 0.5 + 0.5;
    
    texC = mix(texC2, (texC * 2.0 - lpos * 2.0) * 0.0 * 0.5 + lpos, (1.0 / (distance((texC2 * 2.0 - lpos * 2.0) * 10.0 * 0.5 + lpos, lpos) - 10.0)));
    
	vec2 moveUv = texC + iTime * 0.1 * ROTATION_SPEED;
    
	vec3 getColor = getTexure(moveUv);
    
    float planet = clamp((1.0 - distance(texC2,lpos)) * 50.0,0.0,1.0);
    
    getColor = pow(getColor, vec3(2.2));
    
    getColor *= planet;
    getColor += stars(texC2) * (1.0 - planet);
       
    getColor = pow(getColor, vec3(2.2));
    getColor += pow(sun(texC2, lpos), vec3(2.2)) * (1.0 - planet);
    getColor = pow(getColor, vec3(0.4545));
    
	if (distance(texC2,lpos) > 1.0)
    	getColor = pow(mix(getColor, vec3(0.4,0.6,1.0), pow(2.0 - clamp(distance(texC2, lpos),0.0,2.0),5.0 / ATMOSPHERE_HEIGHT)), vec3(2.2));   
  
    if (distance(texC2,lpos) < 1.0)
        getColor = pow(mix(getColor, vec3(0.4,0.6,1.0), pow(distance(texC2, lpos), 2.0 / AIR_DENSITY)),vec3(2.2));  
      
   	#ifdef SHADOWS
    		getColor *= mix(1.0,pow(SHADOW_DARKNESS, 2.2), clamp(texC.x,0.0,1.0) * planet);
    #endif
    
    #ifdef CITY_LIGHTS
    	if (distance(texC2,lpos) < 1.0) getColor = CityLights(moveUv, texC, getColor, planet);
    #endif
        
    getColor = pow(getColor, vec3(0.4545));
    
	fragColor = vec4(getColor,1.0);
}