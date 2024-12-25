// Lava Planet Unlimited 
// https://www.shadertoy.com/view/4dBBDD
// Tags: terrain, lava, volcanic

vec3 T(vec2 c, bool sky )
{
    vec4 t = texture(iChannel0,c*.1);
    
    if ( sky )
    {
        t = t * .75 + texture(iChannel0,c*.2 + iTime * .02) * .25;
        t = pow(t,vec4(.6));
    }
    
    return t.rgb;
}    

vec3 TraceRay( vec3 vRayOrigin, vec3 vRayDir )
{
    vec3 vRayOffest;
    vec3 g, t, l; 
    
    vec3 vWorldPos;
	
    vRayDir.z += vRayDir.y * .5;
    
    vRayOffest = vec3(0);
    vec3 vFog = vec3(0);
        
    vec3 pPrev = vRayOffest;
    
    bool sky = vRayDir.y > 0.;
    
    vec2 vTextureUV;
    
    for ( float h=0.; h<.6; h+=.001 )
    {        
        vRayOffest = vRayDir * h / vRayDir.y;
        vWorldPos = vRayOrigin + vRayOffest;
    	if (sky )
        {
        	vWorldPos.xz *= .2;
            vWorldPos.xz += iTime * 0.25;
        }
        
		vTextureUV = vWorldPos.xz;
		l = T( vTextureUV, sky );
		t = textureLod( iChannel1, vTextureUV, 15. * (l.x-vRayOffest.y) ).rgb;
		g = pow( l*t,
                    t+7. 
					+ sin(vRayOffest.x * 5. + iTime)
					+ sin(vRayOffest.z * 5. + iTime)                                                                           
				) * h;
        
        vec3 pDelta = pPrev - vRayOffest;
        vFog.rgb+= g * exp(length(pDelta.xyz) * .4);
        
        if (vRayOffest.y >= l.x )
            break;        
	}
            
            
    l -= T( vTextureUV - .1, sky );

    
    if ( vRayDir.y > 0. )
        l += vec3(0.4, 0.3, 0.2);
    else 
        l += vec3(0.2, 0.3, 0.4);
    
    vec3 vResult = vec3(0);
    
    vResult = vFog +
         t * l 
        + g * 1e3
        	* vRayOffest.y 
        ;
    
    if ( vRayDir.y > 0. )
        vResult = vResult.zyx;
    
    vResult *= exp( -dot(vRayOffest, vRayOffest)*.03);
        
    vResult = 1. - exp(-vResult * 1.5);     
    
    return vResult;
}

void mainImage( out vec4 fragColor, vec2 fragCoord )
{
    vec3 vRayOrigin, vRayDir;
    
    vRayDir = vec3( fragCoord / iResolution.y, 1 );

    vRayDir.xy -= 0.5 * iResolution.xy / iResolution.y;
    vRayDir = normalize(vRayDir);
    
    vRayOrigin = vec3(.01, 0, -.2)*iTime;
    
 
    vec3 vResult = TraceRay( vRayOrigin, vRayDir );
    
    fragColor = vec4( vResult, 0 );
}


void mainVR( out vec4 vFragColor, in vec2 vFragCoord, in vec3 vRayOrigin, in vec3 vRayDir )
{
    vec3 vResult = TraceRay( vRayOrigin, vRayDir );
    
    vFragColor = vec4( vResult, 0 );
}
