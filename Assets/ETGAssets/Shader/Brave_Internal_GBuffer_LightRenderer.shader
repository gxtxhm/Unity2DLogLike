//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/GBuffer_LightRenderer" {
Properties {
_LightPos ("Light Position", Vector) = (0,0,0,0)
_LightRadius ("Light Radius", Float) = 1
_LightIntensity ("Light Intensity", Float) = 0
_LightColor ("Light Color", Color) = (0,0,0,0)
_LightCookie ("Light Cookie", 2D) = "white" { }
_LightCookieAngle ("Light Cookie Angle", Float) = 0
_LightAngle ("Light Angle", Float) = 360
_LightOrient ("Light Orient", Float) = 0
}
SubShader {
 Pass {
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZTest Always
  GpuProgramID 34721
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _CameraWS;
uniform 	float _CameraOrthoSize;
uniform 	float _CameraOrthoSizeX;
in  vec4 in_POSITION0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.xy = in_TEXCOORD0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(_CameraOrthoSizeX, _CameraOrthoSize);
    u_xlat0.z = float(0.0);
    u_xlat0.w = float(0.0);
    vs_TEXCOORD1 = u_xlat0 + _CameraWS;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _LightPos;
uniform 	float _LightRadius;
uniform 	float _LightIntensity;
uniform 	vec4 _LightColor;
uniform 	float _LightCookieAngle;
uniform 	float _LightAngle;
uniform 	float _LightOrient;
uniform  sampler2D _LightCookie;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat16_0;
vec4 u_xlat10_0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec2 u_xlat3;
float u_xlat4;
vec3 u_xlat5;
bool u_xlatb7;
float u_xlat12;
float u_xlat18;
bool u_xlatb18;
void main()
{
    u_xlat0.xy = (-vs_TEXCOORD1.xy) + _LightPos.xy;
    u_xlat12 = max(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat18 = min(abs(u_xlat0.x), abs(u_xlat0.y));
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat18 = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat18 * 0.0208350997 + -0.0851330012;
    u_xlat1.x = u_xlat18 * u_xlat1.x + 0.180141002;
    u_xlat1.x = u_xlat18 * u_xlat1.x + -0.330299497;
    u_xlat18 = u_xlat18 * u_xlat1.x + 0.999866009;
    u_xlat1.x = u_xlat18 * u_xlat12;
    u_xlat1.x = u_xlat1.x * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat0.x)<abs(u_xlat0.y);
    u_xlat1.x = u_xlatb7 ? u_xlat1.x : float(0.0);
    u_xlat12 = u_xlat12 * u_xlat18 + u_xlat1.x;
    u_xlatb18 = u_xlat0.x<(-u_xlat0.x);
    u_xlat18 = u_xlatb18 ? -3.14159274 : float(0.0);
    u_xlat12 = u_xlat18 + u_xlat12;
    u_xlat18 = min(u_xlat0.x, u_xlat0.y);
    u_xlatb18 = u_xlat18<(-u_xlat18);
    u_xlat1.x = max(u_xlat0.x, u_xlat0.y);
    u_xlatb1 = u_xlat1.x>=(-u_xlat1.x);
    u_xlatb18 = u_xlatb18 && u_xlatb1;
    u_xlat12 = (u_xlatb18) ? (-u_xlat12) : u_xlat12;
    u_xlat12 = u_xlat12 * 57.2957993 + 180.0;
    u_xlat12 = u_xlat12 + (-_LightOrient);
    u_xlat12 = u_xlat12 + 180.0;
    u_xlat18 = u_xlat12 * 360.0;
    u_xlatb18 = u_xlat18>=(-u_xlat18);
    u_xlat1.xy = (bool(u_xlatb18)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat12 = u_xlat12 * u_xlat1.y;
    u_xlat12 = fract(u_xlat12);
    u_xlat12 = u_xlat1.x * u_xlat12 + -180.0;
    u_xlat12 = -abs(u_xlat12) + _LightAngle;
    u_xlat12 = u_xlat12 * 0.0500000007;
    u_xlat12 = clamp(u_xlat12, 0.0, 1.0);
    u_xlat18 = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat1.x = _LightRadius * _LightRadius;
    u_xlat1.x = float(1.0) / u_xlat1.x;
    u_xlat18 = (-u_xlat18) * u_xlat1.x + 1.0;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat1.w = u_xlat12 * u_xlat12;
    u_xlat12 = u_xlat1.w * _LightIntensity;
    u_xlat2.xyz = vec3(u_xlat12) * _LightColor.xyz;
    u_xlat12 = _LightRadius * 0.5;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat12);
    u_xlat3.x = sin(_LightCookieAngle);
    u_xlat4 = cos(_LightCookieAngle);
    u_xlat5.z = u_xlat3.x;
    u_xlat5.y = u_xlat4;
    u_xlat5.x = (-u_xlat3.x);
    u_xlat3.y = dot(u_xlat0.xy, u_xlat5.xy);
    u_xlat3.x = dot(u_xlat0.xy, u_xlat5.yz);
    u_xlat0.xy = u_xlat3.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10_0 = texture(_LightCookie, u_xlat0.xy);
    u_xlat16_0.xyz = u_xlat10_0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat0 = u_xlat1 + vec4(-0.5, -0.5, -0.5, -1.0);
    u_xlat1.x = _LightIntensity;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat0 = u_xlat1.xxxx * u_xlat0 + vec4(0.5, 0.5, 0.5, 1.0);
    u_xlat0 = u_xlat1.wwww * u_xlat0;
    u_xlat0 = u_xlat1.xxxx * u_xlat0;
    SV_Target0 = min(u_xlat0, vec4(12.5, 12.5, 12.5, 12.5));
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 127
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %84 %85 %116 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpMemberDecorate %18 4 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %116 Location 116 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeStruct %16 %17 %7 %6 %6 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32; f32;}* %20 = OpVariable Uniform 
                                              %21 = OpTypeInt 32 1 
                                          i32 %22 = OpConstant 0 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %35 = OpConstant 2 
                                          i32 %44 = OpConstant 3 
                               Private f32_4* %48 = OpVariable Private 
                                          u32 %68 = OpConstant 1 
                                              %69 = OpTypeArray %6 %68 
                                              %70 = OpTypeStruct %7 %6 %69 
                                              %71 = OpTypePointer Output %70 
         Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                              %80 = OpTypePointer Output %7 
                                              %82 = OpTypeVector %6 2 
                                              %83 = OpTypePointer Output %82 
                                Output f32_2* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                          f32 %90 = OpConstant 3.67402E-40 
                                        f32_2 %91 = OpConstantComposite %90 %90 
                                          f32 %93 = OpConstant 3.67402E-40 
                                        f32_2 %94 = OpConstantComposite %93 %93 
                                         i32 %100 = OpConstant 4 
                                             %101 = OpTypePointer Uniform %6 
                                         f32 %110 = OpConstant 3.67402E-40 
                                         u32 %111 = OpConstant 2 
                                             %112 = OpTypePointer Private %6 
                                         u32 %114 = OpConstant 3 
                               Output f32_4* %116 = OpVariable Output 
                                             %121 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpLoad %11 
                                        f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                        f32_4 %32 = OpFMul %29 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_4 %34 = OpFAdd %32 %33 
                                                      OpStore %9 %34 
                               Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_4 %38 = OpLoad %11 
                                        f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                        f32_4 %40 = OpFMul %37 %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpFAdd %40 %41 
                                                      OpStore %9 %42 
                                        f32_4 %43 = OpLoad %9 
                               Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                        f32_4 %46 = OpLoad %45 
                                        f32_4 %47 = OpFAdd %43 %46 
                                                      OpStore %9 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                               Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpFMul %50 %52 
                                                      OpStore %48 %53 
                               Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                        f32_4 %58 = OpFMul %55 %57 
                                        f32_4 %59 = OpLoad %48 
                                        f32_4 %60 = OpFAdd %58 %59 
                                                      OpStore %48 %60 
                               Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                        f32_4 %65 = OpFMul %62 %64 
                                        f32_4 %66 = OpLoad %48 
                                        f32_4 %67 = OpFAdd %65 %66 
                                                      OpStore %48 %67 
                               Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                        f32_4 %74 = OpLoad %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                        f32_4 %77 = OpFMul %74 %76 
                                        f32_4 %78 = OpLoad %48 
                                        f32_4 %79 = OpFAdd %77 %78 
                                Output f32_4* %81 = OpAccessChain %72 %22 
                                                      OpStore %81 %79 
                                        f32_4 %86 = OpLoad %85 
                                        f32_2 %87 = OpVectorShuffle %86 %86 0 1 
                                                      OpStore %84 %87 
                                        f32_4 %88 = OpLoad %85 
                                        f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                        f32_2 %92 = OpFMul %89 %91 
                                        f32_2 %95 = OpFAdd %92 %94 
                                        f32_4 %96 = OpLoad %9 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
                                                      OpStore %9 %97 
                                        f32_4 %98 = OpLoad %9 
                                        f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                Uniform f32* %102 = OpAccessChain %20 %100 
                                         f32 %103 = OpLoad %102 
                                Uniform f32* %104 = OpAccessChain %20 %44 
                                         f32 %105 = OpLoad %104 
                                       f32_2 %106 = OpCompositeConstruct %103 %105 
                                       f32_2 %107 = OpFMul %99 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 2 3 
                                                      OpStore %9 %109 
                                Private f32* %113 = OpAccessChain %9 %111 
                                                      OpStore %113 %110 
                                Private f32* %115 = OpAccessChain %9 %114 
                                                      OpStore %115 %110 
                                       f32_4 %117 = OpLoad %9 
                              Uniform f32_4* %118 = OpAccessChain %20 %35 
                                       f32_4 %119 = OpLoad %118 
                                       f32_4 %120 = OpFAdd %117 %119 
                                                      OpStore %116 %120 
                                 Output f32* %122 = OpAccessChain %72 %22 %68 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFNegate %123 
                                 Output f32* %125 = OpAccessChain %72 %22 %68 
                                                      OpStore %125 %124 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 399
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %393 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %11 Location 11 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpMemberDecorate %16 6 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %347 DescriptorSet 347 
                                                      OpDecorate %347 Binding 347 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %356 RelaxedPrecision 
                                                      OpDecorate %357 RelaxedPrecision 
                                                      OpDecorate %358 RelaxedPrecision 
                                                      OpDecorate %359 RelaxedPrecision 
                                                      OpDecorate %360 RelaxedPrecision 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %393 Location 393 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %16 = OpTypeStruct %7 %6 %6 %7 %6 %6 %6 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4; f32; f32; f32_4; f32; f32; f32;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %7 
                                              %28 = OpTypePointer Private %6 
                                 Private f32* %29 = OpVariable Private 
                                              %30 = OpTypeInt 32 0 
                                          u32 %31 = OpConstant 0 
                                          u32 %35 = OpConstant 1 
                                          f32 %40 = OpConstant 3.67402E-40 
                                 Private f32* %43 = OpVariable Private 
                               Private f32_4* %57 = OpVariable Private 
                                          f32 %59 = OpConstant 3.67402E-40 
                                          f32 %61 = OpConstant 3.67402E-40 
                                          f32 %68 = OpConstant 3.67402E-40 
                                          f32 %75 = OpConstant 3.67402E-40 
                                          f32 %82 = OpConstant 3.67402E-40 
                                          f32 %90 = OpConstant 3.67402E-40 
                                          f32 %92 = OpConstant 3.67402E-40 
                                              %95 = OpTypeBool 
                                              %96 = OpTypePointer Private %95 
                                Private bool* %97 = OpVariable Private 
                                             %105 = OpTypePointer Function %6 
                                         f32 %113 = OpConstant 3.67402E-40 
                               Private bool* %122 = OpVariable Private 
                                         f32 %133 = OpConstant 3.67402E-40 
                               Private bool* %154 = OpVariable Private 
                                         f32 %174 = OpConstant 3.67402E-40 
                                         f32 %176 = OpConstant 3.67402E-40 
                                         i32 %179 = OpConstant 6 
                                             %180 = OpTypePointer Uniform %6 
                                         f32 %188 = OpConstant 3.67402E-40 
                                             %194 = OpTypePointer Function %12 
                                         f32 %199 = OpConstant 3.67402E-40 
                                       f32_2 %200 = OpConstantComposite %188 %199 
                                         f32 %202 = OpConstant 3.67402E-40 
                                         f32 %203 = OpConstant 3.67402E-40 
                                       f32_2 %204 = OpConstantComposite %202 %203 
                                         f32 %218 = OpConstant 3.67402E-40 
                                         i32 %223 = OpConstant 5 
                                         f32 %228 = OpConstant 3.67402E-40 
                                         i32 %237 = OpConstant 1 
                                         u32 %262 = OpConstant 3 
                                         i32 %266 = OpConstant 2 
                                             %270 = OpTypeVector %6 3 
                                             %271 = OpTypePointer Private %270 
                              Private f32_3* %272 = OpVariable Private 
                                         i32 %275 = OpConstant 3 
                                         f32 %282 = OpConstant 3.67402E-40 
                                             %291 = OpTypePointer Private %12 
                              Private f32_2* %292 = OpVariable Private 
                                         i32 %293 = OpConstant 4 
                                Private f32* %298 = OpVariable Private 
                              Private f32_3* %302 = OpVariable Private 
                                         u32 %305 = OpConstant 2 
                                       f32_2 %326 = OpConstantComposite %40 %40 
                                       f32_2 %332 = OpConstantComposite %282 %282 
                              Private f32_3* %343 = OpVariable Private 
                                             %344 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %345 = OpTypeSampledImage %344 
                                             %346 = OpTypePointer UniformConstant %345 
 UniformConstant read_only Texture2DSampled* %347 = OpVariable UniformConstant 
                              Private f32_3* %353 = OpVariable Private 
                                       f32_3 %355 = OpConstantComposite %282 %282 %282 
                                         f32 %367 = OpConstant 3.67402E-40 
                                         f32 %368 = OpConstant 3.67402E-40 
                                       f32_4 %369 = OpConstantComposite %367 %367 %367 %368 
                                       f32_4 %382 = OpConstantComposite %282 %282 %282 %40 
                                             %392 = OpTypePointer Output %7 
                               Output f32_4* %393 = OpVariable Output 
                                         f32 %395 = OpConstant 3.67402E-40 
                                       f32_4 %396 = OpConstantComposite %395 %395 %395 %395 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %106 = OpVariable Function 
                               Function f32* %129 = OpVariable Function 
                               Function f32* %164 = OpVariable Function 
                             Function f32_2* %195 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                        f32_2 %15 = OpFNegate %14 
                               Uniform f32_4* %22 = OpAccessChain %18 %20 
                                        f32_4 %23 = OpLoad %22 
                                        f32_2 %24 = OpVectorShuffle %23 %23 0 1 
                                        f32_2 %25 = OpFAdd %15 %24 
                                        f32_4 %26 = OpLoad %9 
                                        f32_4 %27 = OpVectorShuffle %26 %25 4 5 2 3 
                                                      OpStore %9 %27 
                                 Private f32* %32 = OpAccessChain %9 %31 
                                          f32 %33 = OpLoad %32 
                                          f32 %34 = OpExtInst %1 4 %33 
                                 Private f32* %36 = OpAccessChain %9 %35 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpExtInst %1 4 %37 
                                          f32 %39 = OpExtInst %1 40 %34 %38 
                                                      OpStore %29 %39 
                                          f32 %41 = OpLoad %29 
                                          f32 %42 = OpFDiv %40 %41 
                                                      OpStore %29 %42 
                                 Private f32* %44 = OpAccessChain %9 %31 
                                          f32 %45 = OpLoad %44 
                                          f32 %46 = OpExtInst %1 4 %45 
                                 Private f32* %47 = OpAccessChain %9 %35 
                                          f32 %48 = OpLoad %47 
                                          f32 %49 = OpExtInst %1 4 %48 
                                          f32 %50 = OpExtInst %1 37 %46 %49 
                                                      OpStore %43 %50 
                                          f32 %51 = OpLoad %29 
                                          f32 %52 = OpLoad %43 
                                          f32 %53 = OpFMul %51 %52 
                                                      OpStore %29 %53 
                                          f32 %54 = OpLoad %29 
                                          f32 %55 = OpLoad %29 
                                          f32 %56 = OpFMul %54 %55 
                                                      OpStore %43 %56 
                                          f32 %58 = OpLoad %43 
                                          f32 %60 = OpFMul %58 %59 
                                          f32 %62 = OpFAdd %60 %61 
                                 Private f32* %63 = OpAccessChain %57 %31 
                                                      OpStore %63 %62 
                                          f32 %64 = OpLoad %43 
                                 Private f32* %65 = OpAccessChain %57 %31 
                                          f32 %66 = OpLoad %65 
                                          f32 %67 = OpFMul %64 %66 
                                          f32 %69 = OpFAdd %67 %68 
                                 Private f32* %70 = OpAccessChain %57 %31 
                                                      OpStore %70 %69 
                                          f32 %71 = OpLoad %43 
                                 Private f32* %72 = OpAccessChain %57 %31 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFMul %71 %73 
                                          f32 %76 = OpFAdd %74 %75 
                                 Private f32* %77 = OpAccessChain %57 %31 
                                                      OpStore %77 %76 
                                          f32 %78 = OpLoad %43 
                                 Private f32* %79 = OpAccessChain %57 %31 
                                          f32 %80 = OpLoad %79 
                                          f32 %81 = OpFMul %78 %80 
                                          f32 %83 = OpFAdd %81 %82 
                                                      OpStore %43 %83 
                                          f32 %84 = OpLoad %43 
                                          f32 %85 = OpLoad %29 
                                          f32 %86 = OpFMul %84 %85 
                                 Private f32* %87 = OpAccessChain %57 %31 
                                                      OpStore %87 %86 
                                 Private f32* %88 = OpAccessChain %57 %31 
                                          f32 %89 = OpLoad %88 
                                          f32 %91 = OpFMul %89 %90 
                                          f32 %93 = OpFAdd %91 %92 
                                 Private f32* %94 = OpAccessChain %57 %31 
                                                      OpStore %94 %93 
                                 Private f32* %98 = OpAccessChain %9 %31 
                                          f32 %99 = OpLoad %98 
                                         f32 %100 = OpExtInst %1 4 %99 
                                Private f32* %101 = OpAccessChain %9 %35 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpExtInst %1 4 %102 
                                        bool %104 = OpFOrdLessThan %100 %103 
                                                      OpStore %97 %104 
                                        bool %107 = OpLoad %97 
                                                      OpSelectionMerge %109 None 
                                                      OpBranchConditional %107 %108 %112 
                                             %108 = OpLabel 
                                Private f32* %110 = OpAccessChain %57 %31 
                                         f32 %111 = OpLoad %110 
                                                      OpStore %106 %111 
                                                      OpBranch %109 
                                             %112 = OpLabel 
                                                      OpStore %106 %113 
                                                      OpBranch %109 
                                             %109 = OpLabel 
                                         f32 %114 = OpLoad %106 
                                Private f32* %115 = OpAccessChain %57 %31 
                                                      OpStore %115 %114 
                                         f32 %116 = OpLoad %29 
                                         f32 %117 = OpLoad %43 
                                         f32 %118 = OpFMul %116 %117 
                                Private f32* %119 = OpAccessChain %57 %31 
                                         f32 %120 = OpLoad %119 
                                         f32 %121 = OpFAdd %118 %120 
                                                      OpStore %29 %121 
                                Private f32* %123 = OpAccessChain %9 %31 
                                         f32 %124 = OpLoad %123 
                                Private f32* %125 = OpAccessChain %9 %31 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFNegate %126 
                                        bool %128 = OpFOrdLessThan %124 %127 
                                                      OpStore %122 %128 
                                        bool %130 = OpLoad %122 
                                                      OpSelectionMerge %132 None 
                                                      OpBranchConditional %130 %131 %134 
                                             %131 = OpLabel 
                                                      OpStore %129 %133 
                                                      OpBranch %132 
                                             %134 = OpLabel 
                                                      OpStore %129 %113 
                                                      OpBranch %132 
                                             %132 = OpLabel 
                                         f32 %135 = OpLoad %129 
                                                      OpStore %43 %135 
                                         f32 %136 = OpLoad %43 
                                         f32 %137 = OpLoad %29 
                                         f32 %138 = OpFAdd %136 %137 
                                                      OpStore %29 %138 
                                Private f32* %139 = OpAccessChain %9 %31 
                                         f32 %140 = OpLoad %139 
                                Private f32* %141 = OpAccessChain %9 %35 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpExtInst %1 37 %140 %142 
                                                      OpStore %43 %143 
                                         f32 %144 = OpLoad %43 
                                         f32 %145 = OpLoad %43 
                                         f32 %146 = OpFNegate %145 
                                        bool %147 = OpFOrdLessThan %144 %146 
                                                      OpStore %122 %147 
                                Private f32* %148 = OpAccessChain %9 %31 
                                         f32 %149 = OpLoad %148 
                                Private f32* %150 = OpAccessChain %9 %35 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpExtInst %1 40 %149 %151 
                                Private f32* %153 = OpAccessChain %57 %31 
                                                      OpStore %153 %152 
                                Private f32* %155 = OpAccessChain %57 %31 
                                         f32 %156 = OpLoad %155 
                                Private f32* %157 = OpAccessChain %57 %31 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFNegate %158 
                                        bool %160 = OpFOrdGreaterThanEqual %156 %159 
                                                      OpStore %154 %160 
                                        bool %161 = OpLoad %122 
                                        bool %162 = OpLoad %154 
                                        bool %163 = OpLogicalAnd %161 %162 
                                                      OpStore %122 %163 
                                        bool %165 = OpLoad %122 
                                                      OpSelectionMerge %167 None 
                                                      OpBranchConditional %165 %166 %170 
                                             %166 = OpLabel 
                                         f32 %168 = OpLoad %29 
                                         f32 %169 = OpFNegate %168 
                                                      OpStore %164 %169 
                                                      OpBranch %167 
                                             %170 = OpLabel 
                                         f32 %171 = OpLoad %29 
                                                      OpStore %164 %171 
                                                      OpBranch %167 
                                             %167 = OpLabel 
                                         f32 %172 = OpLoad %164 
                                                      OpStore %29 %172 
                                         f32 %173 = OpLoad %29 
                                         f32 %175 = OpFMul %173 %174 
                                         f32 %177 = OpFAdd %175 %176 
                                                      OpStore %29 %177 
                                         f32 %178 = OpLoad %29 
                                Uniform f32* %181 = OpAccessChain %18 %179 
                                         f32 %182 = OpLoad %181 
                                         f32 %183 = OpFNegate %182 
                                         f32 %184 = OpFAdd %178 %183 
                                                      OpStore %29 %184 
                                         f32 %185 = OpLoad %29 
                                         f32 %186 = OpFAdd %185 %176 
                                                      OpStore %29 %186 
                                         f32 %187 = OpLoad %29 
                                         f32 %189 = OpFMul %187 %188 
                                                      OpStore %43 %189 
                                         f32 %190 = OpLoad %43 
                                         f32 %191 = OpLoad %43 
                                         f32 %192 = OpFNegate %191 
                                        bool %193 = OpFOrdGreaterThanEqual %190 %192 
                                                      OpStore %122 %193 
                                        bool %196 = OpLoad %122 
                                                      OpSelectionMerge %198 None 
                                                      OpBranchConditional %196 %197 %201 
                                             %197 = OpLabel 
                                                      OpStore %195 %200 
                                                      OpBranch %198 
                                             %201 = OpLabel 
                                                      OpStore %195 %204 
                                                      OpBranch %198 
                                             %198 = OpLabel 
                                       f32_2 %205 = OpLoad %195 
                                       f32_4 %206 = OpLoad %57 
                                       f32_4 %207 = OpVectorShuffle %206 %205 4 5 2 3 
                                                      OpStore %57 %207 
                                         f32 %208 = OpLoad %29 
                                Private f32* %209 = OpAccessChain %57 %35 
                                         f32 %210 = OpLoad %209 
                                         f32 %211 = OpFMul %208 %210 
                                                      OpStore %29 %211 
                                         f32 %212 = OpLoad %29 
                                         f32 %213 = OpExtInst %1 10 %212 
                                                      OpStore %29 %213 
                                Private f32* %214 = OpAccessChain %57 %31 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpLoad %29 
                                         f32 %217 = OpFMul %215 %216 
                                         f32 %219 = OpFAdd %217 %218 
                                                      OpStore %29 %219 
                                         f32 %220 = OpLoad %29 
                                         f32 %221 = OpExtInst %1 4 %220 
                                         f32 %222 = OpFNegate %221 
                                Uniform f32* %224 = OpAccessChain %18 %223 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpFAdd %222 %225 
                                                      OpStore %29 %226 
                                         f32 %227 = OpLoad %29 
                                         f32 %229 = OpFMul %227 %228 
                                                      OpStore %29 %229 
                                         f32 %230 = OpLoad %29 
                                         f32 %231 = OpExtInst %1 43 %230 %113 %40 
                                                      OpStore %29 %231 
                                       f32_4 %232 = OpLoad %9 
                                       f32_2 %233 = OpVectorShuffle %232 %232 0 1 
                                       f32_4 %234 = OpLoad %9 
                                       f32_2 %235 = OpVectorShuffle %234 %234 0 1 
                                         f32 %236 = OpDot %233 %235 
                                                      OpStore %43 %236 
                                Uniform f32* %238 = OpAccessChain %18 %237 
                                         f32 %239 = OpLoad %238 
                                Uniform f32* %240 = OpAccessChain %18 %237 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFMul %239 %241 
                                Private f32* %243 = OpAccessChain %57 %31 
                                                      OpStore %243 %242 
                                Private f32* %244 = OpAccessChain %57 %31 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpFDiv %40 %245 
                                Private f32* %247 = OpAccessChain %57 %31 
                                                      OpStore %247 %246 
                                         f32 %248 = OpLoad %43 
                                         f32 %249 = OpFNegate %248 
                                Private f32* %250 = OpAccessChain %57 %31 
                                         f32 %251 = OpLoad %250 
                                         f32 %252 = OpFMul %249 %251 
                                         f32 %253 = OpFAdd %252 %40 
                                                      OpStore %43 %253 
                                         f32 %254 = OpLoad %43 
                                         f32 %255 = OpExtInst %1 40 %254 %113 
                                                      OpStore %43 %255 
                                         f32 %256 = OpLoad %29 
                                         f32 %257 = OpLoad %43 
                                         f32 %258 = OpFMul %256 %257 
                                                      OpStore %29 %258 
                                         f32 %259 = OpLoad %29 
                                         f32 %260 = OpLoad %29 
                                         f32 %261 = OpFMul %259 %260 
                                Private f32* %263 = OpAccessChain %57 %262 
                                                      OpStore %263 %261 
                                Private f32* %264 = OpAccessChain %57 %262 
                                         f32 %265 = OpLoad %264 
                                Uniform f32* %267 = OpAccessChain %18 %266 
                                         f32 %268 = OpLoad %267 
                                         f32 %269 = OpFMul %265 %268 
                                                      OpStore %29 %269 
                                         f32 %273 = OpLoad %29 
                                       f32_3 %274 = OpCompositeConstruct %273 %273 %273 
                              Uniform f32_4* %276 = OpAccessChain %18 %275 
                                       f32_4 %277 = OpLoad %276 
                                       f32_3 %278 = OpVectorShuffle %277 %277 0 1 2 
                                       f32_3 %279 = OpFMul %274 %278 
                                                      OpStore %272 %279 
                                Uniform f32* %280 = OpAccessChain %18 %237 
                                         f32 %281 = OpLoad %280 
                                         f32 %283 = OpFMul %281 %282 
                                                      OpStore %29 %283 
                                       f32_4 %284 = OpLoad %9 
                                       f32_2 %285 = OpVectorShuffle %284 %284 0 1 
                                         f32 %286 = OpLoad %29 
                                       f32_2 %287 = OpCompositeConstruct %286 %286 
                                       f32_2 %288 = OpFDiv %285 %287 
                                       f32_4 %289 = OpLoad %9 
                                       f32_4 %290 = OpVectorShuffle %289 %288 4 5 2 3 
                                                      OpStore %9 %290 
                                Uniform f32* %294 = OpAccessChain %18 %293 
                                         f32 %295 = OpLoad %294 
                                         f32 %296 = OpExtInst %1 13 %295 
                                Private f32* %297 = OpAccessChain %292 %31 
                                                      OpStore %297 %296 
                                Uniform f32* %299 = OpAccessChain %18 %293 
                                         f32 %300 = OpLoad %299 
                                         f32 %301 = OpExtInst %1 14 %300 
                                                      OpStore %298 %301 
                                Private f32* %303 = OpAccessChain %292 %31 
                                         f32 %304 = OpLoad %303 
                                Private f32* %306 = OpAccessChain %302 %305 
                                                      OpStore %306 %304 
                                         f32 %307 = OpLoad %298 
                                Private f32* %308 = OpAccessChain %302 %35 
                                                      OpStore %308 %307 
                                Private f32* %309 = OpAccessChain %292 %31 
                                         f32 %310 = OpLoad %309 
                                         f32 %311 = OpFNegate %310 
                                Private f32* %312 = OpAccessChain %302 %31 
                                                      OpStore %312 %311 
                                       f32_4 %313 = OpLoad %9 
                                       f32_2 %314 = OpVectorShuffle %313 %313 0 1 
                                       f32_3 %315 = OpLoad %302 
                                       f32_2 %316 = OpVectorShuffle %315 %315 0 1 
                                         f32 %317 = OpDot %314 %316 
                                Private f32* %318 = OpAccessChain %292 %35 
                                                      OpStore %318 %317 
                                       f32_4 %319 = OpLoad %9 
                                       f32_2 %320 = OpVectorShuffle %319 %319 0 1 
                                       f32_3 %321 = OpLoad %302 
                                       f32_2 %322 = OpVectorShuffle %321 %321 1 2 
                                         f32 %323 = OpDot %320 %322 
                                Private f32* %324 = OpAccessChain %292 %31 
                                                      OpStore %324 %323 
                                       f32_2 %325 = OpLoad %292 
                                       f32_2 %327 = OpFAdd %325 %326 
                                       f32_4 %328 = OpLoad %9 
                                       f32_4 %329 = OpVectorShuffle %328 %327 4 5 2 3 
                                                      OpStore %9 %329 
                                       f32_4 %330 = OpLoad %9 
                                       f32_2 %331 = OpVectorShuffle %330 %330 0 1 
                                       f32_2 %333 = OpFMul %331 %332 
                                       f32_4 %334 = OpLoad %9 
                                       f32_4 %335 = OpVectorShuffle %334 %333 4 5 2 3 
                                                      OpStore %9 %335 
                                       f32_4 %336 = OpLoad %9 
                                       f32_2 %337 = OpVectorShuffle %336 %336 0 1 
                                       f32_2 %338 = OpCompositeConstruct %113 %113 
                                       f32_2 %339 = OpCompositeConstruct %40 %40 
                                       f32_2 %340 = OpExtInst %1 43 %337 %338 %339 
                                       f32_4 %341 = OpLoad %9 
                                       f32_4 %342 = OpVectorShuffle %341 %340 4 5 2 3 
                                                      OpStore %9 %342 
                  read_only Texture2DSampled %348 = OpLoad %347 
                                       f32_4 %349 = OpLoad %9 
                                       f32_2 %350 = OpVectorShuffle %349 %349 0 1 
                                       f32_4 %351 = OpImageSampleImplicitLod %348 %350 
                                       f32_3 %352 = OpVectorShuffle %351 %351 0 1 2 
                                                      OpStore %343 %352 
                                       f32_3 %354 = OpLoad %343 
                                       f32_3 %356 = OpFAdd %354 %355 
                                                      OpStore %353 %356 
                                       f32_3 %357 = OpLoad %353 
                                       f32_3 %358 = OpCompositeConstruct %113 %113 %113 
                                       f32_3 %359 = OpCompositeConstruct %40 %40 %40 
                                       f32_3 %360 = OpExtInst %1 43 %357 %358 %359 
                                                      OpStore %353 %360 
                                       f32_3 %361 = OpLoad %353 
                                       f32_3 %362 = OpLoad %272 
                                       f32_3 %363 = OpFMul %361 %362 
                                       f32_4 %364 = OpLoad %57 
                                       f32_4 %365 = OpVectorShuffle %364 %363 4 5 6 3 
                                                      OpStore %57 %365 
                                       f32_4 %366 = OpLoad %57 
                                       f32_4 %370 = OpFAdd %366 %369 
                                                      OpStore %9 %370 
                                Uniform f32* %371 = OpAccessChain %18 %266 
                                         f32 %372 = OpLoad %371 
                                Private f32* %373 = OpAccessChain %57 %31 
                                                      OpStore %373 %372 
                                Private f32* %374 = OpAccessChain %57 %31 
                                         f32 %375 = OpLoad %374 
                                         f32 %376 = OpExtInst %1 43 %375 %113 %40 
                                Private f32* %377 = OpAccessChain %57 %31 
                                                      OpStore %377 %376 
                                       f32_4 %378 = OpLoad %57 
                                       f32_4 %379 = OpVectorShuffle %378 %378 0 0 0 0 
                                       f32_4 %380 = OpLoad %9 
                                       f32_4 %381 = OpFMul %379 %380 
                                       f32_4 %383 = OpFAdd %381 %382 
                                                      OpStore %9 %383 
                                       f32_4 %384 = OpLoad %57 
                                       f32_4 %385 = OpVectorShuffle %384 %384 3 3 3 3 
                                       f32_4 %386 = OpLoad %9 
                                       f32_4 %387 = OpFMul %385 %386 
                                                      OpStore %9 %387 
                                       f32_4 %388 = OpLoad %57 
                                       f32_4 %389 = OpVectorShuffle %388 %388 0 0 0 0 
                                       f32_4 %390 = OpLoad %9 
                                       f32_4 %391 = OpFMul %389 %390 
                                                      OpStore %9 %391 
                                       f32_4 %394 = OpLoad %9 
                                       f32_4 %397 = OpExtInst %1 37 %394 %396 
                                                      OpStore %393 %397 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 130091
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in  vec4 in_POSITION0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 glstate_lightmodel_ambient;
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0.xyz = glstate_lightmodel_ambient.xyz * vec3(2.0, 2.0, 2.0);
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 88
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                          Output f32* %83 = OpAccessChain %72 %22 %68 
                                  f32 %84 = OpLoad %83 
                                  f32 %85 = OpFNegate %84 
                          Output f32* %86 = OpAccessChain %72 %22 %68 
                                              OpStore %86 %85 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 35
; Schema: 0
                                 OpCapability Shader 
                          %1 = OpExtInstImport "GLSL.std.450" 
                                 OpMemoryModel Logical GLSL450 
                                 OpEntryPoint Fragment %4 "main" %25 
                                 OpExecutionMode %4 OriginUpperLeft 
                                 OpDecorate %9 RelaxedPrecision 
                                 OpMemberDecorate %11 0 RelaxedPrecision 
                                 OpMemberDecorate %11 0 Offset 11 
                                 OpDecorate %11 Block 
                                 OpDecorate %13 DescriptorSet 13 
                                 OpDecorate %13 Binding 13 
                                 OpDecorate %18 RelaxedPrecision 
                                 OpDecorate %19 RelaxedPrecision 
                                 OpDecorate %21 RelaxedPrecision 
                                 OpDecorate %22 RelaxedPrecision 
                                 OpDecorate %23 RelaxedPrecision 
                                 OpDecorate %25 Location 25 
                                 OpDecorate %26 RelaxedPrecision 
                          %2 = OpTypeVoid 
                          %3 = OpTypeFunction %2 
                          %6 = OpTypeFloat 32 
                          %7 = OpTypeVector %6 3 
                          %8 = OpTypePointer Private %7 
           Private f32_3* %9 = OpVariable Private 
                         %10 = OpTypeVector %6 4 
                         %11 = OpTypeStruct %10 
                         %12 = OpTypePointer Uniform %11 
Uniform struct {f32_4;}* %13 = OpVariable Uniform 
                         %14 = OpTypeInt 32 1 
                     i32 %15 = OpConstant 0 
                         %16 = OpTypePointer Uniform %10 
                         %24 = OpTypePointer Output %10 
           Output f32_4* %25 = OpVariable Output 
                     f32 %29 = OpConstant 3.67402E-40 
                         %30 = OpTypeInt 32 0 
                     u32 %31 = OpConstant 3 
                         %32 = OpTypePointer Output %6 
                     void %4 = OpFunction None %3 
                          %5 = OpLabel 
          Uniform f32_4* %17 = OpAccessChain %13 %15 
                   f32_4 %18 = OpLoad %17 
                   f32_3 %19 = OpVectorShuffle %18 %18 0 1 2 
          Uniform f32_4* %20 = OpAccessChain %13 %15 
                   f32_4 %21 = OpLoad %20 
                   f32_3 %22 = OpVectorShuffle %21 %21 0 1 2 
                   f32_3 %23 = OpFAdd %19 %22 
                                 OpStore %9 %23 
                   f32_3 %26 = OpLoad %9 
                   f32_4 %27 = OpLoad %25 
                   f32_4 %28 = OpVectorShuffle %27 %26 4 5 6 3 
                                 OpStore %25 %28 
             Output f32* %33 = OpAccessChain %25 %31 
                                 OpStore %33 %29 
                                 OpReturn
                                 OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
}
}
}
Fallback "Diffuse"
}