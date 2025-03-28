//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/RadiusIndicatorEffect" {
Properties {
_Radius ("Radius", Float) = 5
_PxWidth ("Pixel Width", Float) = 1
_RingColor ("Ring Color", Color) = (1,1,1,1)
_WorldCenter ("World Center", Vector) = (0,0,0,0)
}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  GpuProgramID 51720
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
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	float _Radius;
uniform 	float _PxWidth;
uniform 	vec4 _RingColor;
uniform 	vec4 _WorldCenter;
in  vec3 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
float u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
float u_xlat3;
bool u_xlatb3;
vec2 u_xlat4;
vec2 u_xlat5;
bool u_xlatb5;
float u_xlat6;
bool u_xlatb6;
bool u_xlatb7;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.yx + (-_WorldCenter.yx);
    u_xlat4.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat1 = max(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat1 = float(1.0) / u_xlat1;
    u_xlat3 = min(abs(u_xlat4.y), abs(u_xlat4.x));
    u_xlat1 = u_xlat1 * u_xlat3;
    u_xlat3 = u_xlat1 * u_xlat1;
    u_xlat5.x = u_xlat3 * 0.0208350997 + -0.0851330012;
    u_xlat5.x = u_xlat3 * u_xlat5.x + 0.180141002;
    u_xlat5.x = u_xlat3 * u_xlat5.x + -0.330299497;
    u_xlat3 = u_xlat3 * u_xlat5.x + 0.999866009;
    u_xlat5.x = u_xlat3 * u_xlat1;
    u_xlat5.x = u_xlat5.x * -2.0 + 1.57079637;
    u_xlatb7 = abs(u_xlat4.y)<abs(u_xlat4.x);
    u_xlat5.x = u_xlatb7 ? u_xlat5.x : float(0.0);
    u_xlat1 = u_xlat1 * u_xlat3 + u_xlat5.x;
    u_xlatb3 = u_xlat4.y<(-u_xlat4.y);
    u_xlat3 = u_xlatb3 ? -3.14159274 : float(0.0);
    u_xlat1 = u_xlat3 + u_xlat1;
    u_xlat3 = min(u_xlat4.y, u_xlat4.x);
    u_xlatb3 = u_xlat3<(-u_xlat3);
    u_xlat5.x = max(u_xlat4.y, u_xlat4.x);
    u_xlatb5 = u_xlat5.x>=(-u_xlat5.x);
    u_xlatb3 = u_xlatb5 && u_xlatb3;
    u_xlat1 = (u_xlatb3) ? (-u_xlat1) : u_xlat1;
    u_xlat1 = _Time.x * 5.0 + u_xlat1;
    u_xlat3 = u_xlat1 * 5.0 + _Time.z;
    u_xlat1 = u_xlat1 * 12.0;
    u_xlat1 = sin(u_xlat1);
    u_xlat1 = u_xlat1 + 1.0;
    u_xlat1 = u_xlat1 * 0.5;
    u_xlat3 = cos(u_xlat3);
    u_xlat3 = u_xlat3 + 1.0;
    u_xlat3 = u_xlat3 * 0.0325000025 + 0.00999999978;
    u_xlat5.xy = u_xlat4.xy * vec2(0.00999999978, 0.00999999978);
    u_xlat4.xy = u_xlat4.xy * vec2(u_xlat3) + (-u_xlat5.xy);
    u_xlat4.xy = vec2(u_xlat1) * u_xlat4.xy + u_xlat5.xy;
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat4.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat4.x = sqrt(u_xlat4.x);
    u_xlat6 = (-u_xlat4.x) + _Radius;
    u_xlatb6 = u_xlat6<0.0;
    if((int(u_xlatb6) * int(0xffffffffu))!=0){discard;}
    u_xlat6 = _PxWidth * 0.0625 + u_xlat4.x;
    u_xlat6 = u_xlat6 + 0.375;
    u_xlat6 = u_xlat6 + (-_Radius);
    u_xlatb6 = u_xlat6<0.0;
    if((int(u_xlatb6) * int(0xffffffffu))!=0){discard;}
    u_xlat6 = max(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat1 = min(abs(u_xlat0.y), abs(u_xlat0.x));
    u_xlat6 = u_xlat6 * u_xlat1;
    u_xlat1 = u_xlat6 * u_xlat6;
    u_xlat3 = u_xlat1 * 0.0208350997 + -0.0851330012;
    u_xlat3 = u_xlat1 * u_xlat3 + 0.180141002;
    u_xlat3 = u_xlat1 * u_xlat3 + -0.330299497;
    u_xlat1 = u_xlat1 * u_xlat3 + 0.999866009;
    u_xlat3 = u_xlat6 * u_xlat1;
    u_xlat3 = u_xlat3 * -2.0 + 1.57079637;
    u_xlatb5 = abs(u_xlat0.y)<abs(u_xlat0.x);
    u_xlat3 = u_xlatb5 ? u_xlat3 : float(0.0);
    u_xlat6 = u_xlat6 * u_xlat1 + u_xlat3;
    u_xlatb1 = u_xlat0.y<(-u_xlat0.y);
    u_xlat1 = u_xlatb1 ? -3.14159274 : float(0.0);
    u_xlat6 = u_xlat6 + u_xlat1;
    u_xlat1 = min(u_xlat0.y, u_xlat0.x);
    u_xlat0.x = max(u_xlat0.y, u_xlat0.x);
    u_xlatb0 = u_xlat0.x>=(-u_xlat0.x);
    u_xlatb2 = u_xlat1<(-u_xlat1);
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat0.x = (u_xlatb0) ? (-u_xlat6) : u_xlat6;
    u_xlat2.xz = _Time.zz * vec2(3.0, -5.69999981);
    u_xlat6 = u_xlat0.x * 4.5 + u_xlat2.z;
    u_xlat6 = sin(u_xlat6);
    u_xlat0.w = u_xlat6 + 1.0;
    u_xlat0.xw = u_xlat0.xw * vec2(4.5, 0.5);
    u_xlat1 = sin(u_xlat0.x);
    u_xlat1 = u_xlat1 + 1.0;
    u_xlat1 = u_xlat1 * 0.25 + 10.5;
    u_xlat0.x = u_xlat0.x * u_xlat1 + u_xlat2.x;
    u_xlat0.x = cos(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.x = u_xlat0.x * 0.5 + u_xlat0.w;
    u_xlat0.x = max(u_xlat0.x, 0.200000003);
    u_xlat2.x = (-_PxWidth) * 0.0625 + _Radius;
    u_xlatb2 = u_xlat2.x<u_xlat4.x;
    u_xlat4.x = u_xlat4.x + (-_Radius);
    u_xlat0.x = (u_xlatb2) ? 1.0 : u_xlat0.x;
    u_xlat2.x = _PxWidth * 0.0625 + 0.375;
    u_xlat2.x = -abs(u_xlat4.x) + u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 2.66666675;
    u_xlat0.x = u_xlat2.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 5.0;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 0.200000003;
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * _RingColor;
    SV_Target0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 106
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %9 %11 %17 %57 %90 
                                              OpDecorate %9 Location 9 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %17 Location 17 
                                              OpDecorate %22 ArrayStride 22 
                                              OpDecorate %23 ArrayStride 23 
                                              OpMemberDecorate %24 0 Offset 24 
                                              OpMemberDecorate %24 1 Offset 24 
                                              OpDecorate %24 Block 
                                              OpDecorate %26 DescriptorSet 26 
                                              OpDecorate %26 Binding 26 
                                              OpDecorate %57 Location 57 
                                              OpMemberDecorate %88 0 BuiltIn 88 
                                              OpMemberDecorate %88 1 BuiltIn 88 
                                              OpMemberDecorate %88 2 BuiltIn 88 
                                              OpDecorate %88 Block 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 2 
                                       %8 = OpTypePointer Output %7 
                         Output f32_2* %9 = OpVariable Output 
                                      %10 = OpTypePointer Input %7 
                         Input f32_2* %11 = OpVariable Input 
                                      %13 = OpTypeVector %6 4 
                                      %14 = OpTypePointer Private %13 
                       Private f32_4* %15 = OpVariable Private 
                                      %16 = OpTypePointer Input %13 
                         Input f32_4* %17 = OpVariable Input 
                                      %20 = OpTypeInt 32 0 
                                  u32 %21 = OpConstant 4 
                                      %22 = OpTypeArray %13 %21 
                                      %23 = OpTypeArray %13 %21 
                                      %24 = OpTypeStruct %22 %23 
                                      %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                      %27 = OpTypeInt 32 1 
                                  i32 %28 = OpConstant 0 
                                  i32 %29 = OpConstant 1 
                                      %30 = OpTypePointer Uniform %13 
                                  i32 %41 = OpConstant 2 
                       Private f32_4* %49 = OpVariable Private 
                                  i32 %51 = OpConstant 3 
                                      %55 = OpTypeVector %6 3 
                                      %56 = OpTypePointer Output %55 
                        Output f32_3* %57 = OpVariable Output 
                                  u32 %86 = OpConstant 1 
                                      %87 = OpTypeArray %6 %86 
                                      %88 = OpTypeStruct %13 %6 %87 
                                      %89 = OpTypePointer Output %88 
 Output struct {f32_4; f32; f32[1];}* %90 = OpVariable Output 
                                      %98 = OpTypePointer Output %13 
                                     %100 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_2 %12 = OpLoad %11 
                                              OpStore %9 %12 
                                f32_4 %18 = OpLoad %17 
                                f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                       Uniform f32_4* %31 = OpAccessChain %26 %28 %29 
                                f32_4 %32 = OpLoad %31 
                                f32_4 %33 = OpFMul %19 %32 
                                              OpStore %15 %33 
                       Uniform f32_4* %34 = OpAccessChain %26 %28 %28 
                                f32_4 %35 = OpLoad %34 
                                f32_4 %36 = OpLoad %17 
                                f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                                f32_4 %38 = OpFMul %35 %37 
                                f32_4 %39 = OpLoad %15 
                                f32_4 %40 = OpFAdd %38 %39 
                                              OpStore %15 %40 
                       Uniform f32_4* %42 = OpAccessChain %26 %28 %41 
                                f32_4 %43 = OpLoad %42 
                                f32_4 %44 = OpLoad %17 
                                f32_4 %45 = OpVectorShuffle %44 %44 2 2 2 2 
                                f32_4 %46 = OpFMul %43 %45 
                                f32_4 %47 = OpLoad %15 
                                f32_4 %48 = OpFAdd %46 %47 
                                              OpStore %15 %48 
                                f32_4 %50 = OpLoad %15 
                       Uniform f32_4* %52 = OpAccessChain %26 %28 %51 
                                f32_4 %53 = OpLoad %52 
                                f32_4 %54 = OpFAdd %50 %53 
                                              OpStore %49 %54 
                       Uniform f32_4* %58 = OpAccessChain %26 %28 %51 
                                f32_4 %59 = OpLoad %58 
                                f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                f32_4 %61 = OpLoad %17 
                                f32_3 %62 = OpVectorShuffle %61 %61 3 3 3 
                                f32_3 %63 = OpFMul %60 %62 
                                f32_4 %64 = OpLoad %15 
                                f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                                f32_3 %66 = OpFAdd %63 %65 
                                              OpStore %57 %66 
                                f32_4 %67 = OpLoad %49 
                                f32_4 %68 = OpVectorShuffle %67 %67 1 1 1 1 
                       Uniform f32_4* %69 = OpAccessChain %26 %29 %29 
                                f32_4 %70 = OpLoad %69 
                                f32_4 %71 = OpFMul %68 %70 
                                              OpStore %15 %71 
                       Uniform f32_4* %72 = OpAccessChain %26 %29 %28 
                                f32_4 %73 = OpLoad %72 
                                f32_4 %74 = OpLoad %49 
                                f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                f32_4 %76 = OpFMul %73 %75 
                                f32_4 %77 = OpLoad %15 
                                f32_4 %78 = OpFAdd %76 %77 
                                              OpStore %15 %78 
                       Uniform f32_4* %79 = OpAccessChain %26 %29 %41 
                                f32_4 %80 = OpLoad %79 
                                f32_4 %81 = OpLoad %49 
                                f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                f32_4 %83 = OpFMul %80 %82 
                                f32_4 %84 = OpLoad %15 
                                f32_4 %85 = OpFAdd %83 %84 
                                              OpStore %15 %85 
                       Uniform f32_4* %91 = OpAccessChain %26 %29 %51 
                                f32_4 %92 = OpLoad %91 
                                f32_4 %93 = OpLoad %49 
                                f32_4 %94 = OpVectorShuffle %93 %93 3 3 3 3 
                                f32_4 %95 = OpFMul %92 %94 
                                f32_4 %96 = OpLoad %15 
                                f32_4 %97 = OpFAdd %95 %96 
                        Output f32_4* %99 = OpAccessChain %90 %28 
                                              OpStore %99 %97 
                         Output f32* %101 = OpAccessChain %90 %28 %86 
                                 f32 %102 = OpLoad %101 
                                 f32 %103 = OpFNegate %102 
                         Output f32* %104 = OpAccessChain %90 %28 %86 
                                              OpStore %104 %103 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 564
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %12 %561 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %12 Location 12 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %561 RelaxedPrecision 
                                                      OpDecorate %561 Location 561 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeVector %6 2 
                                              %16 = OpTypeStruct %7 %6 %6 %7 %7 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4; f32; f32; f32_4; f32_4;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 4 
                                              %21 = OpTypePointer Uniform %7 
                                              %29 = OpTypePointer Private %13 
                               Private f32_2* %30 = OpVariable Private 
                                          f32 %33 = OpConstant 3.67402E-40 
                                        f32_2 %34 = OpConstantComposite %33 %33 
                                              %36 = OpTypePointer Private %6 
                                 Private f32* %37 = OpVariable Private 
                                              %38 = OpTypeInt 32 0 
                                          u32 %39 = OpConstant 1 
                                          u32 %43 = OpConstant 0 
                                          f32 %48 = OpConstant 3.67402E-40 
                                 Private f32* %51 = OpVariable Private 
                               Private f32_2* %65 = OpVariable Private 
                                          f32 %67 = OpConstant 3.67402E-40 
                                          f32 %69 = OpConstant 3.67402E-40 
                                          f32 %76 = OpConstant 3.67402E-40 
                                          f32 %83 = OpConstant 3.67402E-40 
                                          f32 %90 = OpConstant 3.67402E-40 
                                          f32 %98 = OpConstant 3.67402E-40 
                                         f32 %100 = OpConstant 3.67402E-40 
                                             %103 = OpTypeBool 
                                             %104 = OpTypePointer Private %103 
                               Private bool* %105 = OpVariable Private 
                                             %113 = OpTypePointer Function %6 
                                         f32 %121 = OpConstant 3.67402E-40 
                               Private bool* %130 = OpVariable Private 
                                         f32 %141 = OpConstant 3.67402E-40 
                               Private bool* %162 = OpVariable Private 
                                         i32 %181 = OpConstant 0 
                                             %182 = OpTypePointer Uniform %6 
                                         f32 %185 = OpConstant 3.67402E-40 
                                         u32 %191 = OpConstant 2 
                                         f32 %196 = OpConstant 3.67402E-40 
                                         f32 %203 = OpConstant 3.67402E-40 
                                         f32 %210 = OpConstant 3.67402E-40 
                                         f32 %212 = OpConstant 3.67402E-40 
                                       f32_2 %215 = OpConstantComposite %212 %212 
                                Private f32* %246 = OpVariable Private 
                                         i32 %250 = OpConstant 1 
                               Private bool* %254 = OpVariable Private 
                                         i32 %259 = OpConstant -1 
                                         i32 %265 = OpConstant 2 
                                         f32 %268 = OpConstant 3.67402E-40 
                                         f32 %274 = OpConstant 3.67402E-40 
                               Private bool* %352 = OpVariable Private 
                               Private bool* %379 = OpVariable Private 
                               Private bool* %386 = OpVariable Private 
                                             %404 = OpTypePointer Private %10 
                              Private f32_3* %405 = OpVariable Private 
                                         f32 %409 = OpConstant 3.67402E-40 
                                         f32 %410 = OpConstant 3.67402E-40 
                                       f32_2 %411 = OpConstantComposite %409 %410 
                                         f32 %417 = OpConstant 3.67402E-40 
                                         u32 %426 = OpConstant 3 
                                       f32_2 %430 = OpConstantComposite %417 %203 
                                         f32 %440 = OpConstant 3.67402E-40 
                                         f32 %442 = OpConstant 3.67402E-40 
                                         f32 %469 = OpConstant 3.67402E-40 
                                         f32 %522 = OpConstant 3.67402E-40 
                                         i32 %553 = OpConstant 3 
                                       f32_4 %558 = OpConstantComposite %203 %203 %203 %203 
                                             %560 = OpTypePointer Output %7 
                               Output f32_4* %561 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %114 = OpVariable Function 
                               Function f32* %137 = OpVariable Function 
                               Function f32* %172 = OpVariable Function 
                               Function f32* %340 = OpVariable Function 
                               Function f32* %359 = OpVariable Function 
                               Function f32* %394 = OpVariable Function 
                               Function f32* %492 = OpVariable Function 
                                        f32_3 %14 = OpLoad %12 
                                        f32_2 %15 = OpVectorShuffle %14 %14 1 0 
                               Uniform f32_4* %22 = OpAccessChain %18 %20 
                                        f32_4 %23 = OpLoad %22 
                                        f32_2 %24 = OpVectorShuffle %23 %23 1 0 
                                        f32_2 %25 = OpFNegate %24 
                                        f32_2 %26 = OpFAdd %15 %25 
                                        f32_4 %27 = OpLoad %9 
                                        f32_4 %28 = OpVectorShuffle %27 %26 4 5 2 3 
                                                      OpStore %9 %28 
                                        f32_4 %31 = OpLoad %9 
                                        f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                                        f32_2 %35 = OpFAdd %32 %34 
                                                      OpStore %30 %35 
                                 Private f32* %40 = OpAccessChain %30 %39 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpExtInst %1 4 %41 
                                 Private f32* %44 = OpAccessChain %30 %43 
                                          f32 %45 = OpLoad %44 
                                          f32 %46 = OpExtInst %1 4 %45 
                                          f32 %47 = OpExtInst %1 40 %42 %46 
                                                      OpStore %37 %47 
                                          f32 %49 = OpLoad %37 
                                          f32 %50 = OpFDiv %48 %49 
                                                      OpStore %37 %50 
                                 Private f32* %52 = OpAccessChain %30 %39 
                                          f32 %53 = OpLoad %52 
                                          f32 %54 = OpExtInst %1 4 %53 
                                 Private f32* %55 = OpAccessChain %30 %43 
                                          f32 %56 = OpLoad %55 
                                          f32 %57 = OpExtInst %1 4 %56 
                                          f32 %58 = OpExtInst %1 37 %54 %57 
                                                      OpStore %51 %58 
                                          f32 %59 = OpLoad %37 
                                          f32 %60 = OpLoad %51 
                                          f32 %61 = OpFMul %59 %60 
                                                      OpStore %37 %61 
                                          f32 %62 = OpLoad %37 
                                          f32 %63 = OpLoad %37 
                                          f32 %64 = OpFMul %62 %63 
                                                      OpStore %51 %64 
                                          f32 %66 = OpLoad %51 
                                          f32 %68 = OpFMul %66 %67 
                                          f32 %70 = OpFAdd %68 %69 
                                 Private f32* %71 = OpAccessChain %65 %43 
                                                      OpStore %71 %70 
                                          f32 %72 = OpLoad %51 
                                 Private f32* %73 = OpAccessChain %65 %43 
                                          f32 %74 = OpLoad %73 
                                          f32 %75 = OpFMul %72 %74 
                                          f32 %77 = OpFAdd %75 %76 
                                 Private f32* %78 = OpAccessChain %65 %43 
                                                      OpStore %78 %77 
                                          f32 %79 = OpLoad %51 
                                 Private f32* %80 = OpAccessChain %65 %43 
                                          f32 %81 = OpLoad %80 
                                          f32 %82 = OpFMul %79 %81 
                                          f32 %84 = OpFAdd %82 %83 
                                 Private f32* %85 = OpAccessChain %65 %43 
                                                      OpStore %85 %84 
                                          f32 %86 = OpLoad %51 
                                 Private f32* %87 = OpAccessChain %65 %43 
                                          f32 %88 = OpLoad %87 
                                          f32 %89 = OpFMul %86 %88 
                                          f32 %91 = OpFAdd %89 %90 
                                                      OpStore %51 %91 
                                          f32 %92 = OpLoad %51 
                                          f32 %93 = OpLoad %37 
                                          f32 %94 = OpFMul %92 %93 
                                 Private f32* %95 = OpAccessChain %65 %43 
                                                      OpStore %95 %94 
                                 Private f32* %96 = OpAccessChain %65 %43 
                                          f32 %97 = OpLoad %96 
                                          f32 %99 = OpFMul %97 %98 
                                         f32 %101 = OpFAdd %99 %100 
                                Private f32* %102 = OpAccessChain %65 %43 
                                                      OpStore %102 %101 
                                Private f32* %106 = OpAccessChain %30 %39 
                                         f32 %107 = OpLoad %106 
                                         f32 %108 = OpExtInst %1 4 %107 
                                Private f32* %109 = OpAccessChain %30 %43 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpExtInst %1 4 %110 
                                        bool %112 = OpFOrdLessThan %108 %111 
                                                      OpStore %105 %112 
                                        bool %115 = OpLoad %105 
                                                      OpSelectionMerge %117 None 
                                                      OpBranchConditional %115 %116 %120 
                                             %116 = OpLabel 
                                Private f32* %118 = OpAccessChain %65 %43 
                                         f32 %119 = OpLoad %118 
                                                      OpStore %114 %119 
                                                      OpBranch %117 
                                             %120 = OpLabel 
                                                      OpStore %114 %121 
                                                      OpBranch %117 
                                             %117 = OpLabel 
                                         f32 %122 = OpLoad %114 
                                Private f32* %123 = OpAccessChain %65 %43 
                                                      OpStore %123 %122 
                                         f32 %124 = OpLoad %37 
                                         f32 %125 = OpLoad %51 
                                         f32 %126 = OpFMul %124 %125 
                                Private f32* %127 = OpAccessChain %65 %43 
                                         f32 %128 = OpLoad %127 
                                         f32 %129 = OpFAdd %126 %128 
                                                      OpStore %37 %129 
                                Private f32* %131 = OpAccessChain %30 %39 
                                         f32 %132 = OpLoad %131 
                                Private f32* %133 = OpAccessChain %30 %39 
                                         f32 %134 = OpLoad %133 
                                         f32 %135 = OpFNegate %134 
                                        bool %136 = OpFOrdLessThan %132 %135 
                                                      OpStore %130 %136 
                                        bool %138 = OpLoad %130 
                                                      OpSelectionMerge %140 None 
                                                      OpBranchConditional %138 %139 %142 
                                             %139 = OpLabel 
                                                      OpStore %137 %141 
                                                      OpBranch %140 
                                             %142 = OpLabel 
                                                      OpStore %137 %121 
                                                      OpBranch %140 
                                             %140 = OpLabel 
                                         f32 %143 = OpLoad %137 
                                                      OpStore %51 %143 
                                         f32 %144 = OpLoad %51 
                                         f32 %145 = OpLoad %37 
                                         f32 %146 = OpFAdd %144 %145 
                                                      OpStore %37 %146 
                                Private f32* %147 = OpAccessChain %30 %39 
                                         f32 %148 = OpLoad %147 
                                Private f32* %149 = OpAccessChain %30 %43 
                                         f32 %150 = OpLoad %149 
                                         f32 %151 = OpExtInst %1 37 %148 %150 
                                                      OpStore %51 %151 
                                         f32 %152 = OpLoad %51 
                                         f32 %153 = OpLoad %51 
                                         f32 %154 = OpFNegate %153 
                                        bool %155 = OpFOrdLessThan %152 %154 
                                                      OpStore %130 %155 
                                Private f32* %156 = OpAccessChain %30 %39 
                                         f32 %157 = OpLoad %156 
                                Private f32* %158 = OpAccessChain %30 %43 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpExtInst %1 40 %157 %159 
                                Private f32* %161 = OpAccessChain %65 %43 
                                                      OpStore %161 %160 
                                Private f32* %163 = OpAccessChain %65 %43 
                                         f32 %164 = OpLoad %163 
                                Private f32* %165 = OpAccessChain %65 %43 
                                         f32 %166 = OpLoad %165 
                                         f32 %167 = OpFNegate %166 
                                        bool %168 = OpFOrdGreaterThanEqual %164 %167 
                                                      OpStore %162 %168 
                                        bool %169 = OpLoad %162 
                                        bool %170 = OpLoad %130 
                                        bool %171 = OpLogicalAnd %169 %170 
                                                      OpStore %130 %171 
                                        bool %173 = OpLoad %130 
                                                      OpSelectionMerge %175 None 
                                                      OpBranchConditional %173 %174 %178 
                                             %174 = OpLabel 
                                         f32 %176 = OpLoad %37 
                                         f32 %177 = OpFNegate %176 
                                                      OpStore %172 %177 
                                                      OpBranch %175 
                                             %178 = OpLabel 
                                         f32 %179 = OpLoad %37 
                                                      OpStore %172 %179 
                                                      OpBranch %175 
                                             %175 = OpLabel 
                                         f32 %180 = OpLoad %172 
                                                      OpStore %37 %180 
                                Uniform f32* %183 = OpAccessChain %18 %181 %43 
                                         f32 %184 = OpLoad %183 
                                         f32 %186 = OpFMul %184 %185 
                                         f32 %187 = OpLoad %37 
                                         f32 %188 = OpFAdd %186 %187 
                                                      OpStore %37 %188 
                                         f32 %189 = OpLoad %37 
                                         f32 %190 = OpFMul %189 %185 
                                Uniform f32* %192 = OpAccessChain %18 %181 %191 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFAdd %190 %193 
                                                      OpStore %51 %194 
                                         f32 %195 = OpLoad %37 
                                         f32 %197 = OpFMul %195 %196 
                                                      OpStore %37 %197 
                                         f32 %198 = OpLoad %37 
                                         f32 %199 = OpExtInst %1 13 %198 
                                                      OpStore %37 %199 
                                         f32 %200 = OpLoad %37 
                                         f32 %201 = OpFAdd %200 %48 
                                                      OpStore %37 %201 
                                         f32 %202 = OpLoad %37 
                                         f32 %204 = OpFMul %202 %203 
                                                      OpStore %37 %204 
                                         f32 %205 = OpLoad %51 
                                         f32 %206 = OpExtInst %1 14 %205 
                                                      OpStore %51 %206 
                                         f32 %207 = OpLoad %51 
                                         f32 %208 = OpFAdd %207 %48 
                                                      OpStore %51 %208 
                                         f32 %209 = OpLoad %51 
                                         f32 %211 = OpFMul %209 %210 
                                         f32 %213 = OpFAdd %211 %212 
                                                      OpStore %51 %213 
                                       f32_2 %214 = OpLoad %30 
                                       f32_2 %216 = OpFMul %214 %215 
                                                      OpStore %65 %216 
                                       f32_2 %217 = OpLoad %30 
                                         f32 %218 = OpLoad %51 
                                       f32_2 %219 = OpCompositeConstruct %218 %218 
                                       f32_2 %220 = OpFMul %217 %219 
                                       f32_2 %221 = OpLoad %65 
                                       f32_2 %222 = OpFNegate %221 
                                       f32_2 %223 = OpFAdd %220 %222 
                                                      OpStore %30 %223 
                                         f32 %224 = OpLoad %37 
                                       f32_2 %225 = OpCompositeConstruct %224 %224 
                                       f32_2 %226 = OpLoad %30 
                                       f32_2 %227 = OpFMul %225 %226 
                                       f32_2 %228 = OpLoad %65 
                                       f32_2 %229 = OpFAdd %227 %228 
                                                      OpStore %30 %229 
                                       f32_2 %230 = OpLoad %30 
                                       f32_4 %231 = OpLoad %9 
                                       f32_2 %232 = OpVectorShuffle %231 %231 0 1 
                                       f32_2 %233 = OpFAdd %230 %232 
                                       f32_4 %234 = OpLoad %9 
                                       f32_4 %235 = OpVectorShuffle %234 %233 4 5 2 3 
                                                      OpStore %9 %235 
                                       f32_4 %236 = OpLoad %9 
                                       f32_2 %237 = OpVectorShuffle %236 %236 0 1 
                                       f32_4 %238 = OpLoad %9 
                                       f32_2 %239 = OpVectorShuffle %238 %238 0 1 
                                         f32 %240 = OpDot %237 %239 
                                Private f32* %241 = OpAccessChain %30 %43 
                                                      OpStore %241 %240 
                                Private f32* %242 = OpAccessChain %30 %43 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpExtInst %1 31 %243 
                                Private f32* %245 = OpAccessChain %30 %43 
                                                      OpStore %245 %244 
                                Private f32* %247 = OpAccessChain %30 %43 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpFNegate %248 
                                Uniform f32* %251 = OpAccessChain %18 %250 
                                         f32 %252 = OpLoad %251 
                                         f32 %253 = OpFAdd %249 %252 
                                                      OpStore %246 %253 
                                         f32 %255 = OpLoad %246 
                                        bool %256 = OpFOrdLessThan %255 %121 
                                                      OpStore %254 %256 
                                        bool %257 = OpLoad %254 
                                         i32 %258 = OpSelect %257 %250 %181 
                                         i32 %260 = OpIMul %258 %259 
                                        bool %261 = OpINotEqual %260 %181 
                                                      OpSelectionMerge %263 None 
                                                      OpBranchConditional %261 %262 %263 
                                             %262 = OpLabel 
                                                      OpKill
                                             %263 = OpLabel 
                                Uniform f32* %266 = OpAccessChain %18 %265 
                                         f32 %267 = OpLoad %266 
                                         f32 %269 = OpFMul %267 %268 
                                Private f32* %270 = OpAccessChain %30 %43 
                                         f32 %271 = OpLoad %270 
                                         f32 %272 = OpFAdd %269 %271 
                                                      OpStore %246 %272 
                                         f32 %273 = OpLoad %246 
                                         f32 %275 = OpFAdd %273 %274 
                                                      OpStore %246 %275 
                                         f32 %276 = OpLoad %246 
                                Uniform f32* %277 = OpAccessChain %18 %250 
                                         f32 %278 = OpLoad %277 
                                         f32 %279 = OpFNegate %278 
                                         f32 %280 = OpFAdd %276 %279 
                                                      OpStore %246 %280 
                                         f32 %281 = OpLoad %246 
                                        bool %282 = OpFOrdLessThan %281 %121 
                                                      OpStore %254 %282 
                                        bool %283 = OpLoad %254 
                                         i32 %284 = OpSelect %283 %250 %181 
                                         i32 %285 = OpIMul %284 %259 
                                        bool %286 = OpINotEqual %285 %181 
                                                      OpSelectionMerge %288 None 
                                                      OpBranchConditional %286 %287 %288 
                                             %287 = OpLabel 
                                                      OpKill
                                             %288 = OpLabel 
                                Private f32* %290 = OpAccessChain %9 %39 
                                         f32 %291 = OpLoad %290 
                                         f32 %292 = OpExtInst %1 4 %291 
                                Private f32* %293 = OpAccessChain %9 %43 
                                         f32 %294 = OpLoad %293 
                                         f32 %295 = OpExtInst %1 4 %294 
                                         f32 %296 = OpExtInst %1 40 %292 %295 
                                                      OpStore %246 %296 
                                         f32 %297 = OpLoad %246 
                                         f32 %298 = OpFDiv %48 %297 
                                                      OpStore %246 %298 
                                Private f32* %299 = OpAccessChain %9 %39 
                                         f32 %300 = OpLoad %299 
                                         f32 %301 = OpExtInst %1 4 %300 
                                Private f32* %302 = OpAccessChain %9 %43 
                                         f32 %303 = OpLoad %302 
                                         f32 %304 = OpExtInst %1 4 %303 
                                         f32 %305 = OpExtInst %1 37 %301 %304 
                                                      OpStore %37 %305 
                                         f32 %306 = OpLoad %246 
                                         f32 %307 = OpLoad %37 
                                         f32 %308 = OpFMul %306 %307 
                                                      OpStore %246 %308 
                                         f32 %309 = OpLoad %246 
                                         f32 %310 = OpLoad %246 
                                         f32 %311 = OpFMul %309 %310 
                                                      OpStore %37 %311 
                                         f32 %312 = OpLoad %37 
                                         f32 %313 = OpFMul %312 %67 
                                         f32 %314 = OpFAdd %313 %69 
                                                      OpStore %51 %314 
                                         f32 %315 = OpLoad %37 
                                         f32 %316 = OpLoad %51 
                                         f32 %317 = OpFMul %315 %316 
                                         f32 %318 = OpFAdd %317 %76 
                                                      OpStore %51 %318 
                                         f32 %319 = OpLoad %37 
                                         f32 %320 = OpLoad %51 
                                         f32 %321 = OpFMul %319 %320 
                                         f32 %322 = OpFAdd %321 %83 
                                                      OpStore %51 %322 
                                         f32 %323 = OpLoad %37 
                                         f32 %324 = OpLoad %51 
                                         f32 %325 = OpFMul %323 %324 
                                         f32 %326 = OpFAdd %325 %90 
                                                      OpStore %37 %326 
                                         f32 %327 = OpLoad %246 
                                         f32 %328 = OpLoad %37 
                                         f32 %329 = OpFMul %327 %328 
                                                      OpStore %51 %329 
                                         f32 %330 = OpLoad %51 
                                         f32 %331 = OpFMul %330 %98 
                                         f32 %332 = OpFAdd %331 %100 
                                                      OpStore %51 %332 
                                Private f32* %333 = OpAccessChain %9 %39 
                                         f32 %334 = OpLoad %333 
                                         f32 %335 = OpExtInst %1 4 %334 
                                Private f32* %336 = OpAccessChain %9 %43 
                                         f32 %337 = OpLoad %336 
                                         f32 %338 = OpExtInst %1 4 %337 
                                        bool %339 = OpFOrdLessThan %335 %338 
                                                      OpStore %162 %339 
                                        bool %341 = OpLoad %162 
                                                      OpSelectionMerge %343 None 
                                                      OpBranchConditional %341 %342 %345 
                                             %342 = OpLabel 
                                         f32 %344 = OpLoad %51 
                                                      OpStore %340 %344 
                                                      OpBranch %343 
                                             %345 = OpLabel 
                                                      OpStore %340 %121 
                                                      OpBranch %343 
                                             %343 = OpLabel 
                                         f32 %346 = OpLoad %340 
                                                      OpStore %51 %346 
                                         f32 %347 = OpLoad %246 
                                         f32 %348 = OpLoad %37 
                                         f32 %349 = OpFMul %347 %348 
                                         f32 %350 = OpLoad %51 
                                         f32 %351 = OpFAdd %349 %350 
                                                      OpStore %246 %351 
                                Private f32* %353 = OpAccessChain %9 %39 
                                         f32 %354 = OpLoad %353 
                                Private f32* %355 = OpAccessChain %9 %39 
                                         f32 %356 = OpLoad %355 
                                         f32 %357 = OpFNegate %356 
                                        bool %358 = OpFOrdLessThan %354 %357 
                                                      OpStore %352 %358 
                                        bool %360 = OpLoad %352 
                                                      OpSelectionMerge %362 None 
                                                      OpBranchConditional %360 %361 %363 
                                             %361 = OpLabel 
                                                      OpStore %359 %141 
                                                      OpBranch %362 
                                             %363 = OpLabel 
                                                      OpStore %359 %121 
                                                      OpBranch %362 
                                             %362 = OpLabel 
                                         f32 %364 = OpLoad %359 
                                                      OpStore %37 %364 
                                         f32 %365 = OpLoad %246 
                                         f32 %366 = OpLoad %37 
                                         f32 %367 = OpFAdd %365 %366 
                                                      OpStore %246 %367 
                                Private f32* %368 = OpAccessChain %9 %39 
                                         f32 %369 = OpLoad %368 
                                Private f32* %370 = OpAccessChain %9 %43 
                                         f32 %371 = OpLoad %370 
                                         f32 %372 = OpExtInst %1 37 %369 %371 
                                                      OpStore %37 %372 
                                Private f32* %373 = OpAccessChain %9 %39 
                                         f32 %374 = OpLoad %373 
                                Private f32* %375 = OpAccessChain %9 %43 
                                         f32 %376 = OpLoad %375 
                                         f32 %377 = OpExtInst %1 40 %374 %376 
                                Private f32* %378 = OpAccessChain %9 %43 
                                                      OpStore %378 %377 
                                Private f32* %380 = OpAccessChain %9 %43 
                                         f32 %381 = OpLoad %380 
                                Private f32* %382 = OpAccessChain %9 %43 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpFNegate %383 
                                        bool %385 = OpFOrdGreaterThanEqual %381 %384 
                                                      OpStore %379 %385 
                                         f32 %387 = OpLoad %37 
                                         f32 %388 = OpLoad %37 
                                         f32 %389 = OpFNegate %388 
                                        bool %390 = OpFOrdLessThan %387 %389 
                                                      OpStore %386 %390 
                                        bool %391 = OpLoad %379 
                                        bool %392 = OpLoad %386 
                                        bool %393 = OpLogicalAnd %391 %392 
                                                      OpStore %379 %393 
                                        bool %395 = OpLoad %379 
                                                      OpSelectionMerge %397 None 
                                                      OpBranchConditional %395 %396 %400 
                                             %396 = OpLabel 
                                         f32 %398 = OpLoad %246 
                                         f32 %399 = OpFNegate %398 
                                                      OpStore %394 %399 
                                                      OpBranch %397 
                                             %400 = OpLabel 
                                         f32 %401 = OpLoad %246 
                                                      OpStore %394 %401 
                                                      OpBranch %397 
                                             %397 = OpLabel 
                                         f32 %402 = OpLoad %394 
                                Private f32* %403 = OpAccessChain %9 %43 
                                                      OpStore %403 %402 
                              Uniform f32_4* %406 = OpAccessChain %18 %181 
                                       f32_4 %407 = OpLoad %406 
                                       f32_2 %408 = OpVectorShuffle %407 %407 2 2 
                                       f32_2 %412 = OpFMul %408 %411 
                                       f32_3 %413 = OpLoad %405 
                                       f32_3 %414 = OpVectorShuffle %413 %412 3 1 4 
                                                      OpStore %405 %414 
                                Private f32* %415 = OpAccessChain %9 %43 
                                         f32 %416 = OpLoad %415 
                                         f32 %418 = OpFMul %416 %417 
                                Private f32* %419 = OpAccessChain %405 %191 
                                         f32 %420 = OpLoad %419 
                                         f32 %421 = OpFAdd %418 %420 
                                                      OpStore %246 %421 
                                         f32 %422 = OpLoad %246 
                                         f32 %423 = OpExtInst %1 13 %422 
                                                      OpStore %246 %423 
                                         f32 %424 = OpLoad %246 
                                         f32 %425 = OpFAdd %424 %48 
                                Private f32* %427 = OpAccessChain %9 %426 
                                                      OpStore %427 %425 
                                       f32_4 %428 = OpLoad %9 
                                       f32_2 %429 = OpVectorShuffle %428 %428 0 3 
                                       f32_2 %431 = OpFMul %429 %430 
                                       f32_4 %432 = OpLoad %9 
                                       f32_4 %433 = OpVectorShuffle %432 %431 4 1 2 5 
                                                      OpStore %9 %433 
                                Private f32* %434 = OpAccessChain %9 %43 
                                         f32 %435 = OpLoad %434 
                                         f32 %436 = OpExtInst %1 13 %435 
                                                      OpStore %37 %436 
                                         f32 %437 = OpLoad %37 
                                         f32 %438 = OpFAdd %437 %48 
                                                      OpStore %37 %438 
                                         f32 %439 = OpLoad %37 
                                         f32 %441 = OpFMul %439 %440 
                                         f32 %443 = OpFAdd %441 %442 
                                                      OpStore %37 %443 
                                Private f32* %444 = OpAccessChain %9 %43 
                                         f32 %445 = OpLoad %444 
                                         f32 %446 = OpLoad %37 
                                         f32 %447 = OpFMul %445 %446 
                                Private f32* %448 = OpAccessChain %405 %43 
                                         f32 %449 = OpLoad %448 
                                         f32 %450 = OpFAdd %447 %449 
                                Private f32* %451 = OpAccessChain %9 %43 
                                                      OpStore %451 %450 
                                Private f32* %452 = OpAccessChain %9 %43 
                                         f32 %453 = OpLoad %452 
                                         f32 %454 = OpExtInst %1 14 %453 
                                Private f32* %455 = OpAccessChain %9 %43 
                                                      OpStore %455 %454 
                                Private f32* %456 = OpAccessChain %9 %43 
                                         f32 %457 = OpLoad %456 
                                         f32 %458 = OpFAdd %457 %48 
                                Private f32* %459 = OpAccessChain %9 %43 
                                                      OpStore %459 %458 
                                Private f32* %460 = OpAccessChain %9 %43 
                                         f32 %461 = OpLoad %460 
                                         f32 %462 = OpFMul %461 %203 
                                Private f32* %463 = OpAccessChain %9 %426 
                                         f32 %464 = OpLoad %463 
                                         f32 %465 = OpFAdd %462 %464 
                                Private f32* %466 = OpAccessChain %9 %43 
                                                      OpStore %466 %465 
                                Private f32* %467 = OpAccessChain %9 %43 
                                         f32 %468 = OpLoad %467 
                                         f32 %470 = OpExtInst %1 40 %468 %469 
                                Private f32* %471 = OpAccessChain %9 %43 
                                                      OpStore %471 %470 
                                Uniform f32* %472 = OpAccessChain %18 %265 
                                         f32 %473 = OpLoad %472 
                                         f32 %474 = OpFNegate %473 
                                         f32 %475 = OpFMul %474 %268 
                                Uniform f32* %476 = OpAccessChain %18 %250 
                                         f32 %477 = OpLoad %476 
                                         f32 %478 = OpFAdd %475 %477 
                                Private f32* %479 = OpAccessChain %405 %43 
                                                      OpStore %479 %478 
                                Private f32* %480 = OpAccessChain %405 %43 
                                         f32 %481 = OpLoad %480 
                                Private f32* %482 = OpAccessChain %30 %43 
                                         f32 %483 = OpLoad %482 
                                        bool %484 = OpFOrdLessThan %481 %483 
                                                      OpStore %386 %484 
                                Private f32* %485 = OpAccessChain %30 %43 
                                         f32 %486 = OpLoad %485 
                                Uniform f32* %487 = OpAccessChain %18 %250 
                                         f32 %488 = OpLoad %487 
                                         f32 %489 = OpFNegate %488 
                                         f32 %490 = OpFAdd %486 %489 
                                Private f32* %491 = OpAccessChain %30 %43 
                                                      OpStore %491 %490 
                                        bool %493 = OpLoad %386 
                                                      OpSelectionMerge %495 None 
                                                      OpBranchConditional %493 %494 %496 
                                             %494 = OpLabel 
                                                      OpStore %492 %48 
                                                      OpBranch %495 
                                             %496 = OpLabel 
                                Private f32* %497 = OpAccessChain %9 %43 
                                         f32 %498 = OpLoad %497 
                                                      OpStore %492 %498 
                                                      OpBranch %495 
                                             %495 = OpLabel 
                                         f32 %499 = OpLoad %492 
                                Private f32* %500 = OpAccessChain %9 %43 
                                                      OpStore %500 %499 
                                Uniform f32* %501 = OpAccessChain %18 %265 
                                         f32 %502 = OpLoad %501 
                                         f32 %503 = OpFMul %502 %268 
                                         f32 %504 = OpFAdd %503 %274 
                                Private f32* %505 = OpAccessChain %405 %43 
                                                      OpStore %505 %504 
                                Private f32* %506 = OpAccessChain %30 %43 
                                         f32 %507 = OpLoad %506 
                                         f32 %508 = OpExtInst %1 4 %507 
                                         f32 %509 = OpFNegate %508 
                                Private f32* %510 = OpAccessChain %405 %43 
                                         f32 %511 = OpLoad %510 
                                         f32 %512 = OpFAdd %509 %511 
                                Private f32* %513 = OpAccessChain %405 %43 
                                                      OpStore %513 %512 
                                Private f32* %514 = OpAccessChain %405 %43 
                                         f32 %515 = OpLoad %514 
                                Private f32* %516 = OpAccessChain %405 %43 
                                         f32 %517 = OpLoad %516 
                                         f32 %518 = OpFMul %515 %517 
                                Private f32* %519 = OpAccessChain %405 %43 
                                                      OpStore %519 %518 
                                Private f32* %520 = OpAccessChain %405 %43 
                                         f32 %521 = OpLoad %520 
                                         f32 %523 = OpFMul %521 %522 
                                Private f32* %524 = OpAccessChain %405 %43 
                                                      OpStore %524 %523 
                                Private f32* %525 = OpAccessChain %405 %43 
                                         f32 %526 = OpLoad %525 
                                Private f32* %527 = OpAccessChain %9 %43 
                                         f32 %528 = OpLoad %527 
                                         f32 %529 = OpFMul %526 %528 
                                Private f32* %530 = OpAccessChain %9 %43 
                                                      OpStore %530 %529 
                                Private f32* %531 = OpAccessChain %9 %43 
                                         f32 %532 = OpLoad %531 
                                         f32 %533 = OpFMul %532 %185 
                                Private f32* %534 = OpAccessChain %9 %43 
                                                      OpStore %534 %533 
                                Private f32* %535 = OpAccessChain %9 %43 
                                         f32 %536 = OpLoad %535 
                                         f32 %537 = OpExtInst %1 8 %536 
                                Private f32* %538 = OpAccessChain %9 %43 
                                                      OpStore %538 %537 
                                Private f32* %539 = OpAccessChain %9 %43 
                                         f32 %540 = OpLoad %539 
                                         f32 %541 = OpFMul %540 %469 
                                Private f32* %542 = OpAccessChain %9 %43 
                                                      OpStore %542 %541 
                                Private f32* %543 = OpAccessChain %9 %43 
                                         f32 %544 = OpLoad %543 
                                         f32 %545 = OpExtInst %1 32 %544 
                                Private f32* %546 = OpAccessChain %9 %43 
                                                      OpStore %546 %545 
                                Private f32* %547 = OpAccessChain %9 %43 
                                         f32 %548 = OpLoad %547 
                                         f32 %549 = OpFDiv %48 %548 
                                Private f32* %550 = OpAccessChain %9 %43 
                                                      OpStore %550 %549 
                                       f32_4 %551 = OpLoad %9 
                                       f32_4 %552 = OpVectorShuffle %551 %551 0 0 0 0 
                              Uniform f32_4* %554 = OpAccessChain %18 %553 
                                       f32_4 %555 = OpLoad %554 
                                       f32_4 %556 = OpFMul %552 %555 
                                                      OpStore %9 %556 
                                       f32_4 %557 = OpLoad %9 
                                       f32_4 %559 = OpFMul %557 %558 
                                                      OpStore %9 %559 
                                       f32_4 %562 = OpLoad %9 
                                                      OpStore %561 %562 
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
}