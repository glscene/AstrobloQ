// Exoplanet #2
// https://www.shadertoy.com/view/fdX3zr

// Cole Peterson
// Different version of my planet thing here: https://www.shadertoy.com/view/ttKBDd


vec4 sphere(vec3 ro, vec3 rd, vec3 cn, float r){
    float b = 2.*dot(rd, ro - cn);
    float c = dot(ro - cn, ro - cn) - (r*r);
    float d = (b*b) - (4.*c);
 	
    if(d < 0.)
        return vec4(0);
    else{
     	float t = .5*(-b - sqrt(d));   
        return vec4(ro+rd*t, t);
    }
}

const float rad = 2.;
float camR = 4.35;

void mainImage( out vec4 f, in vec2 u ){
    vec2 uv = vec2(u.xy - 0.5*R.xy)/R.y;
    float ang = iTime*.12 + 5.;
    
    if(iMouse.z > 0.){
        camR -= m.y*6.;
        ang += m.x;
    }
    
    vec3 ro = vec3(camR*cos(ang), 0., camR*sin(ang));
    vec3 rd = normalize(vec3(uv, 1.));
    
    ro.x = camR*cos(ang);
    ro.z = camR*sin(ang);
    rd.xz *= rot(ang + pi/2. + .04);
    
    vec3 ld = normalize(vec3(0.4, 0.3, -0.5)),
    pp = vec3(0),
    n = vec3(0),
    cntr = vec3(0., 0., 0.),
    col = vec3(0);
    
    vec4 p = sphere(ro, rd, cntr, rad);
    
    if(p.w > 0.){
        pp = p.xyz;
        n = pp - cntr;
        n = normalize(n);
        vec2 cuv = abs(vec2(atan(n.z, n.x), acos(p.y / rad))); 
        
        float n1 = 2.*octnse(cuv, 10, 0.) - 1.;
        float n2 = 2.*octnse((cuv+3.), 10, 0.) - 1.;
        vec2 os = vec2(n1, n2);
    
        float v1 = octnse((cuv + vec2(n1, n2)*3.6), 9, 0.),
              z = (v1-.33)*2.1 ; // v1 in [.33,.8], depth z in [0,1]
        {
            pp += .15*z*rd;      // parallax, then redo v1 texture calculation
            n = pp - cntr;
            n = normalize(n);
            cuv = abs(vec2(atan(n.z, n.x), acos(p.y / rad))); 
            n1 = 2.*octnse(cuv, 10, 0.) - 1.;
            n2 = 2.*octnse((cuv+3.), 10, 0.) - 1.;
            os = vec2(n1, n2);

            v1 = octnse((cuv + vec2(n1, n2)*3.6), 9, 0.);
        }
        float v2 = octnse((vec2(v1)*1.3 + os)*5., 9, 0.);
        col = vec3(1) * v2*3. * vec3(.9, .8, .8);
        col *= max(dot(n, -rd), 0.0)*vec3(.9, .8, .7) 
            * min(1.,1.5-1.1*z); // AO(depth)
        
        col = vec3(1) * v2*3. * vec3(.9, .8, .8);
        col *= max(dot(n, -rd), 0.0)*vec3(.9, .8, .7);
    }
    else{
        col += .55*ss(.3, .01, simplex3d(rd*160.));
        col += .15*texture(iChannel0, rd).yzx;
    }
    
    col = col*col*1.1;
    col = 1.-exp(-col);
    f = vec4(col, 1.0);
}