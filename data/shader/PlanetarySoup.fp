// Planetary Soup
// Cole Peterson
// https://www.shadertoy.com/view/ttKBDd

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
float camR = 4.14;

void mainImage( out vec4 f, in vec2 u ){
    vec2 uv = vec2(u.xy - 0.5*R.xy)/R.y;
    float ux = uv.x;
    uv *= rot(-iTime*.12 + 2.2);
    
    vec3 ro = vec3(0., 0., 0.);
    vec3 rd = normalize(vec3(uv, 1.));
    
    float ang = iTime*.12 + 7.;
    
    
    if(iMouse.z > 0.){
        camR -= m.y*6.;
        ang += m.x;
    }
    
    ro.x += camR*cos(ang);
    ro.z += camR*sin(ang);
    
    rd.xz *= rot(ang + pi/2. + .04);
    
    
    
    vec3 ld = normalize(vec3(0.4, 0.3, -0.5));
    
    float ts = .5;
    
    vec3 pp = vec3(0);
    vec3 n = vec3(0);
    
    vec3 cntr = vec3(0., 0., 0.);
    vec4 p = sphere(ro, rd, cntr, rad);
    
    vec3 col = vec3(0);
    
    if(p.w > 0.){
        pp = p.xyz;
        n = pp - cntr;
        n = normalize(n);
        
        vec2 cuv = abs(vec2(atan(n.z, n.x), acos(p.y / rad))); 
        cuv *= rot(-iTime*.05 * ts);
        
        float n1 = 2.*octnse(cuv, 10, -iTime*.08 * ts) - 1.;
        float n2 = 2.*octnse((cuv+3.), 10, -iTime*.03 * ts) - 1.;
    
        vec2 os = vec2(n1, n2);
    
        float val = octnse((cuv + vec2(n1, n2)*3.6), 8, -iTime*.1 * ts);
        
        col += .35+.35*cos(vec3(1.4, .7, 0.9)*n1*10. + iTime*.35);
        col += .48+.37*cos(vec3(2.2, .1, 0.3)*n2*20. + vec3(.7, 1.2, .7));
        col += .48+.23*cos(vec3(1.4, .7, 0.9)*val*30. + vec3(.2, 0.8, 4.7)+ iTime*.25);
        col*=.38;
        
        vec3 ref = reflect(n, rd);
        float val2 = octnse((ref.xy + os*10. + val*5.), 8, -iTime*.1 * ts);
        
        col *= val2*3. * vec3(.9, .8, .8);
        col *= max(dot(n, -rd), 0.0)*vec3(.9, .8, .7);
    }
    else{
        col += .7*ss(.3, .01, simplex3d(rd*160.));
        col += .15*texture(iChannel0, rd).yzx;
    }
    
    col = col*col*1.7;
    
    
    
    col = 1.-exp(-col);
    
    f = vec4(col, 1.0);
}