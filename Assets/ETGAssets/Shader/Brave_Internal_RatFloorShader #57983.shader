//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/Internal/RatFloorShader" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
_NoiseTex ("Noise", 2D) = "white" { }
_FloorTex ("Floor", 2D) = "white" { }
_EdgeColor ("Edge Color", Color) = (0.5,0.1,0.7,1)
_BorderColor ("Border Color", Color) = (0,0,0,1)
_RotSpeed ("Rotation Speed", Float) = 0
_Magnitudes ("LS/SS MinMax", Vector) = (0.25,0.25,0.1,0.1)
_LSFreq ("Large-Scale Frequency", Float) = 8
_SSFreq ("Small-Scale Frequency", Float) = 24
_PlayerPos ("Player Position World", Vector) = (0,0,0,0)
_HoleEdgeDepth ("Hole Edge Depth", Float) = 6
_UVDistCutoff ("Cutoff Edge", Float) = 0.4
_TimeScale ("Time Scale", Float) = 1
}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Overlay+1" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "QUEUE" = "Overlay+1" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  Cull Off
  Stencil {
   Ref 1
   Comp Always
   Pass Replace
   Fail DecrSat
   ZFail DecrSat
  }
  Fog {
   Mode Off
  }
  GpuProgramID 12414
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
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec2 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec4 vs_TEXCOORD1;
out vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    u_xlat0 = u_xlat0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = u_xlat0 * vec4(0.5, 0.5, 0.5, 0.5);
    vs_TEXCOORD2 = u_xlat0 * vec4(1.0, -1.0, 1.0, 1.0) + vec4(0.0, 1.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _Magnitudes;
uniform 	float _LSFreq;
uniform 	float _SSFreq;
uniform 	float _RotSpeed;
uniform 	vec4 _PlayerPos;
uniform 	float _TimeScale;
uniform  sampler2D _NoiseTex;
uniform  sampler2D _FloorTex;
in  vec4 vs_TEXCOORD1;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
bvec4 u_xlatb0;
vec2 u_xlat1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat10_2;
bool u_xlatb2;
float u_xlat3;
vec2 u_xlat4;
vec2 u_xlat6;
vec2 u_xlat7;
float u_xlat10;
bool u_xlatb10;
void main()
{
    u_xlat0 = vs_TEXCOORD1.xyxy + (-_PlayerPos.xyxy);
    u_xlat0 = u_xlat0 + vec4(0.5, 1.0, 0.0, 0.5);
    u_xlat1.x = u_xlat0.w / u_xlat0.z;
    u_xlat4.x = max(abs(u_xlat1.x), 1.0);
    u_xlat4.x = float(1.0) / u_xlat4.x;
    u_xlat7.x = min(abs(u_xlat1.x), 1.0);
    u_xlat4.x = u_xlat4.x * u_xlat7.x;
    u_xlat7.x = u_xlat4.x * u_xlat4.x;
    u_xlat10 = u_xlat7.x * 0.0208350997 + -0.0851330012;
    u_xlat10 = u_xlat7.x * u_xlat10 + 0.180141002;
    u_xlat10 = u_xlat7.x * u_xlat10 + -0.330299497;
    u_xlat7.x = u_xlat7.x * u_xlat10 + 0.999866009;
    u_xlat10 = u_xlat7.x * u_xlat4.x;
    u_xlat10 = u_xlat10 * -2.0 + 1.57079637;
    u_xlatb2 = 1.0<abs(u_xlat1.x);
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlatb1 = u_xlat1.x<(-u_xlat1.x);
    u_xlat10 = u_xlatb2 ? u_xlat10 : float(0.0);
    u_xlat4.x = u_xlat4.x * u_xlat7.x + u_xlat10;
    u_xlat1.x = (u_xlatb1) ? (-u_xlat4.x) : u_xlat4.x;
    u_xlat4.xy = _Time.xy * vec2(_TimeScale);
    u_xlat4.x = u_xlat4.x * _RotSpeed;
    u_xlat10 = u_xlat4.x * 90.0;
    u_xlatb10 = u_xlat10>=(-u_xlat10);
    u_xlat2.xy = (bool(u_xlatb10)) ? vec2(90.0, 0.0111111114) : vec2(-90.0, -0.0111111114);
    u_xlat4.x = u_xlat4.x * u_xlat2.y;
    u_xlat4.x = fract(u_xlat4.x);
    u_xlat1.x = u_xlat2.x * u_xlat4.x + u_xlat1.x;
    u_xlat4.x = u_xlat1.x * _LSFreq;
    u_xlat4.x = cos(u_xlat4.x);
    u_xlat2.xy = _PlayerPos.xy + _PlayerPos.xy;
    u_xlat10 = _Time.y * _TimeScale + u_xlat2.x;
    u_xlat2.x = u_xlat2.y + u_xlat2.x;
    u_xlat7.x = u_xlat4.y * 2.0 + u_xlat2.x;
    u_xlat7.x = sin(u_xlat7.x);
    u_xlat7.x = u_xlat7.x + 1.0;
    u_xlat10 = _PlayerPos.y * 2.0 + u_xlat10;
    u_xlat2.xy = _Time.xx * vec2(-1.0, 1.0);
    u_xlat2.xy = u_xlat2.xy * vec2(_TimeScale) + u_xlat0.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(0.0500000007, 0.0500000007);
    u_xlat2.xy = fract(u_xlat2.xy);
    u_xlat10_2 = texture(_NoiseTex, u_xlat2.xy);
    u_xlat10 = u_xlat10_2.z * 20.0 + u_xlat10;
    u_xlat10 = sin(u_xlat10);
    u_xlat7.y = u_xlat10 + 1.0;
    u_xlat7.xy = u_xlat7.xy * vec2(0.5, 0.5);
    u_xlat2.xw = (-_Magnitudes.xz) + _Magnitudes.yw;
    u_xlat10 = u_xlat7.y * u_xlat2.x + _Magnitudes.x;
    u_xlat7.x = u_xlat7.x * u_xlat2.w + _Magnitudes.z;
    u_xlat2.xw = u_xlat0.zw * vec2(u_xlat10);
    u_xlat2.xy = u_xlat10_2.yy * u_xlat2.xw;
    u_xlat2.xy = u_xlat10_2.zz * u_xlat2.xy;
    u_xlat6.xy = u_xlat4.xx * u_xlat2.xy + u_xlat0.zw;
    u_xlat0.xy = _Time.xx * vec2(_TimeScale) + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_2 = texture(_NoiseTex, u_xlat0.xy);
    u_xlat0.x = u_xlat7.x * u_xlat10_2.x;
    u_xlat3 = u_xlat10_2.z * 0.5 + u_xlat1.x;
    u_xlat3 = u_xlat3 * _SSFreq;
    u_xlat3 = sin(u_xlat3);
    u_xlat1.xy = u_xlat0.xx * u_xlat6.xy;
    u_xlat0.xy = vec2(u_xlat3) * u_xlat1.xy + u_xlat6.xy;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlatb0.x = u_xlat0.x<0.0;
    if((int(u_xlatb0.x) * int(0xffffffffu))!=0){discard;}
    u_xlat0 = vs_TEXCOORD1.xyxy * vec4(3.0, 3.0, 3.0, 3.0);
    u_xlatb0 = greaterThanEqual(u_xlat0, (-u_xlat0.zwzw));
    u_xlat0.x = (u_xlatb0.x) ? float(3.0) : float(-3.0);
    u_xlat0.y = (u_xlatb0.y) ? float(3.0) : float(-3.0);
    u_xlat0.z = (u_xlatb0.z) ? float(0.333333343) : float(-0.333333343);
    u_xlat0.w = (u_xlatb0.w) ? float(0.333333343) : float(-0.333333343);
    u_xlat6.xy = u_xlat0.zw * vs_TEXCOORD1.xy;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat0.xy = u_xlat6.xy * u_xlat0.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(0.333333343, 0.333333343);
    u_xlat10_0 = texture(_FloorTex, u_xlat0.xy);
    SV_Target0.xyz = u_xlat10_0.xyz;
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
; Bound: 127
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %35 %64 %102 %113 
                                                     OpDecorate %9 Location 9 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %35 Location 35 
                                                     OpDecorate %64 Location 64 
                                                     OpMemberDecorate %100 0 BuiltIn 100 
                                                     OpMemberDecorate %100 1 BuiltIn 100 
                                                     OpMemberDecorate %100 2 BuiltIn 100 
                                                     OpDecorate %100 Block 
                                                     OpDecorate %113 Location 113 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 2 
                                              %8 = OpTypePointer Output %7 
                                Output f32_2* %9 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_2* %11 = OpVariable Input 
                                             %13 = OpTypeVector %6 4 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %13 %15 
                                             %17 = OpTypeArray %13 %15 
                                             %18 = OpTypeStruct %16 %17 %13 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %13 
                                             %32 = OpTypePointer Private %13 
                              Private f32_4* %33 = OpVariable Private 
                                             %34 = OpTypePointer Input %13 
                                Input f32_4* %35 = OpVariable Input 
                                         i32 %38 = OpConstant 0 
                                         i32 %39 = OpConstant 1 
                              Private f32_4* %57 = OpVariable Private 
                                         i32 %59 = OpConstant 3 
                                             %63 = OpTypePointer Output %13 
                               Output f32_4* %64 = OpVariable Output 
                                         u32 %98 = OpConstant 1 
                                             %99 = OpTypeArray %6 %98 
                                            %100 = OpTypeStruct %13 %6 %99 
                                            %101 = OpTypePointer Output %100 
       Output struct {f32_4; f32; f32[1];}* %102 = OpVariable Output 
                                        f32 %106 = OpConstant 3.67402E-40 
                                      f32_4 %107 = OpConstantComposite %106 %106 %106 %106 
                                        f32 %110 = OpConstant 3.67402E-40 
                                      f32_4 %111 = OpConstantComposite %110 %110 %110 %110 
                              Output f32_4* %113 = OpVariable Output 
                                        f32 %115 = OpConstant 3.67402E-40 
                                      f32_4 %116 = OpConstantComposite %106 %115 %106 %106 
                                        f32 %118 = OpConstant 3.67402E-40 
                                      f32_4 %119 = OpConstantComposite %118 %106 %118 %118 
                                            %121 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                                       f32_2 %27 = OpFMul %12 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_2 %30 = OpVectorShuffle %29 %29 2 3 
                                       f32_2 %31 = OpFAdd %27 %30 
                                                     OpStore %9 %31 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpVectorShuffle %36 %36 1 1 1 1 
                              Uniform f32_4* %40 = OpAccessChain %20 %38 %39 
                                       f32_4 %41 = OpLoad %40 
                                       f32_4 %42 = OpFMul %37 %41 
                                                     OpStore %33 %42 
                              Uniform f32_4* %43 = OpAccessChain %20 %38 %38 
                                       f32_4 %44 = OpLoad %43 
                                       f32_4 %45 = OpLoad %35 
                                       f32_4 %46 = OpVectorShuffle %45 %45 0 0 0 0 
                                       f32_4 %47 = OpFMul %44 %46 
                                       f32_4 %48 = OpLoad %33 
                                       f32_4 %49 = OpFAdd %47 %48 
                                                     OpStore %33 %49 
                              Uniform f32_4* %50 = OpAccessChain %20 %38 %22 
                                       f32_4 %51 = OpLoad %50 
                                       f32_4 %52 = OpLoad %35 
                                       f32_4 %53 = OpVectorShuffle %52 %52 2 2 2 2 
                                       f32_4 %54 = OpFMul %51 %53 
                                       f32_4 %55 = OpLoad %33 
                                       f32_4 %56 = OpFAdd %54 %55 
                                                     OpStore %33 %56 
                                       f32_4 %58 = OpLoad %33 
                              Uniform f32_4* %60 = OpAccessChain %20 %38 %59 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpFAdd %58 %61 
                                                     OpStore %57 %62 
                              Uniform f32_4* %65 = OpAccessChain %20 %38 %59 
                                       f32_4 %66 = OpLoad %65 
                                       f32_4 %67 = OpLoad %35 
                                       f32_4 %68 = OpVectorShuffle %67 %67 3 3 3 3 
                                       f32_4 %69 = OpFMul %66 %68 
                                       f32_4 %70 = OpLoad %33 
                                       f32_4 %71 = OpFAdd %69 %70 
                                                     OpStore %64 %71 
                                       f32_4 %72 = OpLoad %57 
                                       f32_4 %73 = OpVectorShuffle %72 %72 1 1 1 1 
                              Uniform f32_4* %74 = OpAccessChain %20 %39 %39 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpFMul %73 %75 
                                                     OpStore %33 %76 
                              Uniform f32_4* %77 = OpAccessChain %20 %39 %38 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpLoad %57 
                                       f32_4 %80 = OpVectorShuffle %79 %79 0 0 0 0 
                                       f32_4 %81 = OpFMul %78 %80 
                                       f32_4 %82 = OpLoad %33 
                                       f32_4 %83 = OpFAdd %81 %82 
                                                     OpStore %33 %83 
                              Uniform f32_4* %84 = OpAccessChain %20 %39 %22 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpLoad %57 
                                       f32_4 %87 = OpVectorShuffle %86 %86 2 2 2 2 
                                       f32_4 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %33 
                                       f32_4 %90 = OpFAdd %88 %89 
                                                     OpStore %33 %90 
                              Uniform f32_4* %91 = OpAccessChain %20 %39 %59 
                                       f32_4 %92 = OpLoad %91 
                                       f32_4 %93 = OpLoad %57 
                                       f32_4 %94 = OpVectorShuffle %93 %93 3 3 3 3 
                                       f32_4 %95 = OpFMul %92 %94 
                                       f32_4 %96 = OpLoad %33 
                                       f32_4 %97 = OpFAdd %95 %96 
                                                     OpStore %33 %97 
                                      f32_4 %103 = OpLoad %33 
                              Output f32_4* %104 = OpAccessChain %102 %38 
                                                     OpStore %104 %103 
                                      f32_4 %105 = OpLoad %33 
                                      f32_4 %108 = OpFAdd %105 %107 
                                                     OpStore %33 %108 
                                      f32_4 %109 = OpLoad %33 
                                      f32_4 %112 = OpFMul %109 %111 
                                                     OpStore %33 %112 
                                      f32_4 %114 = OpLoad %33 
                                      f32_4 %117 = OpFMul %114 %116 
                                      f32_4 %120 = OpFAdd %117 %119 
                                                     OpStore %113 %120 
                                Output f32* %122 = OpAccessChain %102 %38 %98 
                                        f32 %123 = OpLoad %122 
                                        f32 %124 = OpFNegate %123 
                                Output f32* %125 = OpAccessChain %102 %38 %98 
                                                     OpStore %125 %124 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 549
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %542 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpDecorate %11 Location 11 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %308 DescriptorSet 308 
                                                      OpDecorate %308 Binding 308 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %360 RelaxedPrecision 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %366 RelaxedPrecision 
                                                      OpDecorate %367 RelaxedPrecision 
                                                      OpDecorate %399 RelaxedPrecision 
                                                      OpDecorate %400 RelaxedPrecision 
                                                      OpDecorate %404 RelaxedPrecision 
                                                      OpDecorate %408 RelaxedPrecision 
                                                      OpDecorate %415 RelaxedPrecision 
                                                      OpDecorate %416 RelaxedPrecision 
                                                      OpDecorate %535 RelaxedPrecision 
                                                      OpDecorate %535 DescriptorSet 535 
                                                      OpDecorate %535 Binding 535 
                                                      OpDecorate %536 RelaxedPrecision 
                                                      OpDecorate %540 RelaxedPrecision 
                                                      OpDecorate %542 RelaxedPrecision 
                                                      OpDecorate %542 Location 542 
                                                      OpDecorate %543 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeStruct %7 %7 %6 %6 %6 %7 %6 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4; f32_4; f32; f32; f32; f32_4; f32;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 5 
                                              %19 = OpTypePointer Uniform %7 
                                          f32 %26 = OpConstant 3.67402E-40 
                                          f32 %27 = OpConstant 3.67402E-40 
                                          f32 %28 = OpConstant 3.67402E-40 
                                        f32_4 %29 = OpConstantComposite %26 %27 %28 %26 
                                              %31 = OpTypeVector %6 2 
                                              %32 = OpTypePointer Private %31 
                               Private f32_2* %33 = OpVariable Private 
                                              %34 = OpTypeInt 32 0 
                                          u32 %35 = OpConstant 3 
                                              %36 = OpTypePointer Private %6 
                                          u32 %39 = OpConstant 2 
                                          u32 %43 = OpConstant 0 
                               Private f32_2* %45 = OpVariable Private 
                               Private f32_2* %55 = OpVariable Private 
                                 Private f32* %73 = OpVariable Private 
                                          f32 %76 = OpConstant 3.67402E-40 
                                          f32 %78 = OpConstant 3.67402E-40 
                                          f32 %84 = OpConstant 3.67402E-40 
                                          f32 %90 = OpConstant 3.67402E-40 
                                          f32 %96 = OpConstant 3.67402E-40 
                                         f32 %105 = OpConstant 3.67402E-40 
                                         f32 %107 = OpConstant 3.67402E-40 
                                             %109 = OpTypeBool 
                                             %110 = OpTypePointer Private %109 
                               Private bool* %111 = OpVariable Private 
                               Private bool* %120 = OpVariable Private 
                                             %127 = OpTypePointer Function %6 
                                         i32 %155 = OpConstant 0 
                                         i32 %159 = OpConstant 6 
                                             %160 = OpTypePointer Uniform %6 
                                         i32 %167 = OpConstant 4 
                                         f32 %174 = OpConstant 3.67402E-40 
                               Private bool* %176 = OpVariable Private 
                                             %181 = OpTypeVector %6 3 
                                             %182 = OpTypePointer Private %181 
                              Private f32_3* %183 = OpVariable Private 
                                             %184 = OpTypePointer Function %31 
                                         f32 %189 = OpConstant 3.67402E-40 
                                       f32_2 %190 = OpConstantComposite %174 %189 
                                         f32 %192 = OpConstant 3.67402E-40 
                                         f32 %193 = OpConstant 3.67402E-40 
                                       f32_2 %194 = OpConstantComposite %192 %193 
                                         u32 %200 = OpConstant 1 
                                         i32 %220 = OpConstant 2 
                                         f32 %254 = OpConstant 3.67402E-40 
                                         f32 %276 = OpConstant 3.67402E-40 
                                       f32_2 %277 = OpConstantComposite %276 %27 
                                         f32 %294 = OpConstant 3.67402E-40 
                                       f32_2 %295 = OpConstantComposite %294 %294 
                              Private f32_2* %304 = OpVariable Private 
                                             %305 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %306 = OpTypeSampledImage %305 
                                             %307 = OpTypePointer UniformConstant %306 
 UniformConstant read_only Texture2DSampled* %308 = OpVariable UniformConstant 
                                         f32 %316 = OpConstant 3.67402E-40 
                                       f32_2 %326 = OpConstantComposite %26 %26 
                              Private f32_2* %328 = OpVariable Private 
                                         i32 %329 = OpConstant 1 
                              Private f32_2* %373 = OpVariable Private 
                              Private f32_3* %399 = OpVariable Private 
                                Private f32* %413 = OpVariable Private 
                                         i32 %421 = OpConstant 3 
                                             %454 = OpTypeVector %109 4 
                                             %455 = OpTypePointer Private %454 
                             Private bool_4* %456 = OpVariable Private 
                                         i32 %465 = OpConstant -1 
                                         f32 %473 = OpConstant 3.67402E-40 
                                       f32_4 %474 = OpConstantComposite %473 %473 %473 %473 
                                         f32 %487 = OpConstant 3.67402E-40 
                                         f32 %503 = OpConstant 3.67402E-40 
                                         f32 %505 = OpConstant 3.67402E-40 
                                       f32_2 %531 = OpConstantComposite %503 %503 
 UniformConstant read_only Texture2DSampled* %535 = OpVariable UniformConstant 
                                             %541 = OpTypePointer Output %7 
                               Output f32_4* %542 = OpVariable Output 
                                             %546 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %128 = OpVariable Function 
                               Function f32* %143 = OpVariable Function 
                             Function f32_2* %185 = OpVariable Function 
                               Function f32* %481 = OpVariable Function 
                               Function f32* %490 = OpVariable Function 
                               Function f32* %498 = OpVariable Function 
                               Function f32* %508 = OpVariable Function 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 0 1 0 1 
                               Uniform f32_4* %20 = OpAccessChain %16 %18 
                                        f32_4 %21 = OpLoad %20 
                                        f32_4 %22 = OpVectorShuffle %21 %21 0 1 0 1 
                                        f32_4 %23 = OpFNegate %22 
                                        f32_4 %24 = OpFAdd %13 %23 
                                                      OpStore %9 %24 
                                        f32_4 %25 = OpLoad %9 
                                        f32_4 %30 = OpFAdd %25 %29 
                                                      OpStore %9 %30 
                                 Private f32* %37 = OpAccessChain %9 %35 
                                          f32 %38 = OpLoad %37 
                                 Private f32* %40 = OpAccessChain %9 %39 
                                          f32 %41 = OpLoad %40 
                                          f32 %42 = OpFDiv %38 %41 
                                 Private f32* %44 = OpAccessChain %33 %43 
                                                      OpStore %44 %42 
                                 Private f32* %46 = OpAccessChain %33 %43 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpExtInst %1 4 %47 
                                          f32 %49 = OpExtInst %1 40 %48 %27 
                                 Private f32* %50 = OpAccessChain %45 %43 
                                                      OpStore %50 %49 
                                 Private f32* %51 = OpAccessChain %45 %43 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpFDiv %27 %52 
                                 Private f32* %54 = OpAccessChain %45 %43 
                                                      OpStore %54 %53 
                                 Private f32* %56 = OpAccessChain %33 %43 
                                          f32 %57 = OpLoad %56 
                                          f32 %58 = OpExtInst %1 4 %57 
                                          f32 %59 = OpExtInst %1 37 %58 %27 
                                 Private f32* %60 = OpAccessChain %55 %43 
                                                      OpStore %60 %59 
                                 Private f32* %61 = OpAccessChain %45 %43 
                                          f32 %62 = OpLoad %61 
                                 Private f32* %63 = OpAccessChain %55 %43 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpFMul %62 %64 
                                 Private f32* %66 = OpAccessChain %45 %43 
                                                      OpStore %66 %65 
                                 Private f32* %67 = OpAccessChain %45 %43 
                                          f32 %68 = OpLoad %67 
                                 Private f32* %69 = OpAccessChain %45 %43 
                                          f32 %70 = OpLoad %69 
                                          f32 %71 = OpFMul %68 %70 
                                 Private f32* %72 = OpAccessChain %55 %43 
                                                      OpStore %72 %71 
                                 Private f32* %74 = OpAccessChain %55 %43 
                                          f32 %75 = OpLoad %74 
                                          f32 %77 = OpFMul %75 %76 
                                          f32 %79 = OpFAdd %77 %78 
                                                      OpStore %73 %79 
                                 Private f32* %80 = OpAccessChain %55 %43 
                                          f32 %81 = OpLoad %80 
                                          f32 %82 = OpLoad %73 
                                          f32 %83 = OpFMul %81 %82 
                                          f32 %85 = OpFAdd %83 %84 
                                                      OpStore %73 %85 
                                 Private f32* %86 = OpAccessChain %55 %43 
                                          f32 %87 = OpLoad %86 
                                          f32 %88 = OpLoad %73 
                                          f32 %89 = OpFMul %87 %88 
                                          f32 %91 = OpFAdd %89 %90 
                                                      OpStore %73 %91 
                                 Private f32* %92 = OpAccessChain %55 %43 
                                          f32 %93 = OpLoad %92 
                                          f32 %94 = OpLoad %73 
                                          f32 %95 = OpFMul %93 %94 
                                          f32 %97 = OpFAdd %95 %96 
                                 Private f32* %98 = OpAccessChain %55 %43 
                                                      OpStore %98 %97 
                                 Private f32* %99 = OpAccessChain %55 %43 
                                         f32 %100 = OpLoad %99 
                                Private f32* %101 = OpAccessChain %45 %43 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFMul %100 %102 
                                                      OpStore %73 %103 
                                         f32 %104 = OpLoad %73 
                                         f32 %106 = OpFMul %104 %105 
                                         f32 %108 = OpFAdd %106 %107 
                                                      OpStore %73 %108 
                                Private f32* %112 = OpAccessChain %33 %43 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpExtInst %1 4 %113 
                                        bool %115 = OpFOrdLessThan %27 %114 
                                                      OpStore %111 %115 
                                Private f32* %116 = OpAccessChain %33 %43 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpExtInst %1 37 %117 %27 
                                Private f32* %119 = OpAccessChain %33 %43 
                                                      OpStore %119 %118 
                                Private f32* %121 = OpAccessChain %33 %43 
                                         f32 %122 = OpLoad %121 
                                Private f32* %123 = OpAccessChain %33 %43 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpFNegate %124 
                                        bool %126 = OpFOrdLessThan %122 %125 
                                                      OpStore %120 %126 
                                        bool %129 = OpLoad %111 
                                                      OpSelectionMerge %131 None 
                                                      OpBranchConditional %129 %130 %133 
                                             %130 = OpLabel 
                                         f32 %132 = OpLoad %73 
                                                      OpStore %128 %132 
                                                      OpBranch %131 
                                             %133 = OpLabel 
                                                      OpStore %128 %28 
                                                      OpBranch %131 
                                             %131 = OpLabel 
                                         f32 %134 = OpLoad %128 
                                                      OpStore %73 %134 
                                Private f32* %135 = OpAccessChain %45 %43 
                                         f32 %136 = OpLoad %135 
                                Private f32* %137 = OpAccessChain %55 %43 
                                         f32 %138 = OpLoad %137 
                                         f32 %139 = OpFMul %136 %138 
                                         f32 %140 = OpLoad %73 
                                         f32 %141 = OpFAdd %139 %140 
                                Private f32* %142 = OpAccessChain %45 %43 
                                                      OpStore %142 %141 
                                        bool %144 = OpLoad %120 
                                                      OpSelectionMerge %146 None 
                                                      OpBranchConditional %144 %145 %150 
                                             %145 = OpLabel 
                                Private f32* %147 = OpAccessChain %45 %43 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFNegate %148 
                                                      OpStore %143 %149 
                                                      OpBranch %146 
                                             %150 = OpLabel 
                                Private f32* %151 = OpAccessChain %45 %43 
                                         f32 %152 = OpLoad %151 
                                                      OpStore %143 %152 
                                                      OpBranch %146 
                                             %146 = OpLabel 
                                         f32 %153 = OpLoad %143 
                                Private f32* %154 = OpAccessChain %33 %43 
                                                      OpStore %154 %153 
                              Uniform f32_4* %156 = OpAccessChain %16 %155 
                                       f32_4 %157 = OpLoad %156 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
                                Uniform f32* %161 = OpAccessChain %16 %159 
                                         f32 %162 = OpLoad %161 
                                       f32_2 %163 = OpCompositeConstruct %162 %162 
                                       f32_2 %164 = OpFMul %158 %163 
                                                      OpStore %45 %164 
                                Private f32* %165 = OpAccessChain %45 %43 
                                         f32 %166 = OpLoad %165 
                                Uniform f32* %168 = OpAccessChain %16 %167 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpFMul %166 %169 
                                Private f32* %171 = OpAccessChain %45 %43 
                                                      OpStore %171 %170 
                                Private f32* %172 = OpAccessChain %45 %43 
                                         f32 %173 = OpLoad %172 
                                         f32 %175 = OpFMul %173 %174 
                                                      OpStore %73 %175 
                                         f32 %177 = OpLoad %73 
                                         f32 %178 = OpLoad %73 
                                         f32 %179 = OpFNegate %178 
                                        bool %180 = OpFOrdGreaterThanEqual %177 %179 
                                                      OpStore %176 %180 
                                        bool %186 = OpLoad %176 
                                                      OpSelectionMerge %188 None 
                                                      OpBranchConditional %186 %187 %191 
                                             %187 = OpLabel 
                                                      OpStore %185 %190 
                                                      OpBranch %188 
                                             %191 = OpLabel 
                                                      OpStore %185 %194 
                                                      OpBranch %188 
                                             %188 = OpLabel 
                                       f32_2 %195 = OpLoad %185 
                                       f32_3 %196 = OpLoad %183 
                                       f32_3 %197 = OpVectorShuffle %196 %195 3 4 2 
                                                      OpStore %183 %197 
                                Private f32* %198 = OpAccessChain %45 %43 
                                         f32 %199 = OpLoad %198 
                                Private f32* %201 = OpAccessChain %183 %200 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFMul %199 %202 
                                Private f32* %204 = OpAccessChain %45 %43 
                                                      OpStore %204 %203 
                                Private f32* %205 = OpAccessChain %45 %43 
                                         f32 %206 = OpLoad %205 
                                         f32 %207 = OpExtInst %1 10 %206 
                                Private f32* %208 = OpAccessChain %45 %43 
                                                      OpStore %208 %207 
                                Private f32* %209 = OpAccessChain %183 %43 
                                         f32 %210 = OpLoad %209 
                                Private f32* %211 = OpAccessChain %45 %43 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpFMul %210 %212 
                                Private f32* %214 = OpAccessChain %33 %43 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpFAdd %213 %215 
                                Private f32* %217 = OpAccessChain %33 %43 
                                                      OpStore %217 %216 
                                Private f32* %218 = OpAccessChain %33 %43 
                                         f32 %219 = OpLoad %218 
                                Uniform f32* %221 = OpAccessChain %16 %220 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFMul %219 %222 
                                Private f32* %224 = OpAccessChain %45 %43 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %45 %43 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpExtInst %1 14 %226 
                                Private f32* %228 = OpAccessChain %45 %43 
                                                      OpStore %228 %227 
                              Uniform f32_4* %229 = OpAccessChain %16 %18 
                                       f32_4 %230 = OpLoad %229 
                                       f32_2 %231 = OpVectorShuffle %230 %230 0 1 
                              Uniform f32_4* %232 = OpAccessChain %16 %18 
                                       f32_4 %233 = OpLoad %232 
                                       f32_2 %234 = OpVectorShuffle %233 %233 0 1 
                                       f32_2 %235 = OpFAdd %231 %234 
                                       f32_3 %236 = OpLoad %183 
                                       f32_3 %237 = OpVectorShuffle %236 %235 3 4 2 
                                                      OpStore %183 %237 
                                Uniform f32* %238 = OpAccessChain %16 %155 %200 
                                         f32 %239 = OpLoad %238 
                                Uniform f32* %240 = OpAccessChain %16 %159 
                                         f32 %241 = OpLoad %240 
                                         f32 %242 = OpFMul %239 %241 
                                Private f32* %243 = OpAccessChain %183 %43 
                                         f32 %244 = OpLoad %243 
                                         f32 %245 = OpFAdd %242 %244 
                                                      OpStore %73 %245 
                                Private f32* %246 = OpAccessChain %183 %200 
                                         f32 %247 = OpLoad %246 
                                Private f32* %248 = OpAccessChain %183 %43 
                                         f32 %249 = OpLoad %248 
                                         f32 %250 = OpFAdd %247 %249 
                                Private f32* %251 = OpAccessChain %183 %43 
                                                      OpStore %251 %250 
                                Private f32* %252 = OpAccessChain %45 %200 
                                         f32 %253 = OpLoad %252 
                                         f32 %255 = OpFMul %253 %254 
                                Private f32* %256 = OpAccessChain %183 %43 
                                         f32 %257 = OpLoad %256 
                                         f32 %258 = OpFAdd %255 %257 
                                Private f32* %259 = OpAccessChain %55 %43 
                                                      OpStore %259 %258 
                                Private f32* %260 = OpAccessChain %55 %43 
                                         f32 %261 = OpLoad %260 
                                         f32 %262 = OpExtInst %1 13 %261 
                                Private f32* %263 = OpAccessChain %55 %43 
                                                      OpStore %263 %262 
                                Private f32* %264 = OpAccessChain %55 %43 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpFAdd %265 %27 
                                Private f32* %267 = OpAccessChain %55 %43 
                                                      OpStore %267 %266 
                                Uniform f32* %268 = OpAccessChain %16 %18 %200 
                                         f32 %269 = OpLoad %268 
                                         f32 %270 = OpFMul %269 %254 
                                         f32 %271 = OpLoad %73 
                                         f32 %272 = OpFAdd %270 %271 
                                                      OpStore %73 %272 
                              Uniform f32_4* %273 = OpAccessChain %16 %155 
                                       f32_4 %274 = OpLoad %273 
                                       f32_2 %275 = OpVectorShuffle %274 %274 0 0 
                                       f32_2 %278 = OpFMul %275 %277 
                                       f32_3 %279 = OpLoad %183 
                                       f32_3 %280 = OpVectorShuffle %279 %278 3 4 2 
                                                      OpStore %183 %280 
                                       f32_3 %281 = OpLoad %183 
                                       f32_2 %282 = OpVectorShuffle %281 %281 0 1 
                                Uniform f32* %283 = OpAccessChain %16 %159 
                                         f32 %284 = OpLoad %283 
                                       f32_2 %285 = OpCompositeConstruct %284 %284 
                                       f32_2 %286 = OpFMul %282 %285 
                                       f32_4 %287 = OpLoad %9 
                                       f32_2 %288 = OpVectorShuffle %287 %287 0 1 
                                       f32_2 %289 = OpFAdd %286 %288 
                                       f32_3 %290 = OpLoad %183 
                                       f32_3 %291 = OpVectorShuffle %290 %289 3 4 2 
                                                      OpStore %183 %291 
                                       f32_3 %292 = OpLoad %183 
                                       f32_2 %293 = OpVectorShuffle %292 %292 0 1 
                                       f32_2 %296 = OpFMul %293 %295 
                                       f32_3 %297 = OpLoad %183 
                                       f32_3 %298 = OpVectorShuffle %297 %296 3 4 2 
                                                      OpStore %183 %298 
                                       f32_3 %299 = OpLoad %183 
                                       f32_2 %300 = OpVectorShuffle %299 %299 0 1 
                                       f32_2 %301 = OpExtInst %1 10 %300 
                                       f32_3 %302 = OpLoad %183 
                                       f32_3 %303 = OpVectorShuffle %302 %301 3 4 2 
                                                      OpStore %183 %303 
                  read_only Texture2DSampled %309 = OpLoad %308 
                                       f32_3 %310 = OpLoad %183 
                                       f32_2 %311 = OpVectorShuffle %310 %310 0 1 
                                       f32_4 %312 = OpImageSampleImplicitLod %309 %311 
                                       f32_2 %313 = OpVectorShuffle %312 %312 1 2 
                                                      OpStore %304 %313 
                                Private f32* %314 = OpAccessChain %304 %200 
                                         f32 %315 = OpLoad %314 
                                         f32 %317 = OpFMul %315 %316 
                                         f32 %318 = OpLoad %73 
                                         f32 %319 = OpFAdd %317 %318 
                                                      OpStore %73 %319 
                                         f32 %320 = OpLoad %73 
                                         f32 %321 = OpExtInst %1 13 %320 
                                                      OpStore %73 %321 
                                         f32 %322 = OpLoad %73 
                                         f32 %323 = OpFAdd %322 %27 
                                Private f32* %324 = OpAccessChain %55 %200 
                                                      OpStore %324 %323 
                                       f32_2 %325 = OpLoad %55 
                                       f32_2 %327 = OpFMul %325 %326 
                                                      OpStore %55 %327 
                              Uniform f32_4* %330 = OpAccessChain %16 %329 
                                       f32_4 %331 = OpLoad %330 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 2 
                                       f32_2 %333 = OpFNegate %332 
                              Uniform f32_4* %334 = OpAccessChain %16 %329 
                                       f32_4 %335 = OpLoad %334 
                                       f32_2 %336 = OpVectorShuffle %335 %335 1 3 
                                       f32_2 %337 = OpFAdd %333 %336 
                                                      OpStore %328 %337 
                                Private f32* %338 = OpAccessChain %55 %200 
                                         f32 %339 = OpLoad %338 
                                Private f32* %340 = OpAccessChain %328 %43 
                                         f32 %341 = OpLoad %340 
                                         f32 %342 = OpFMul %339 %341 
                                Uniform f32* %343 = OpAccessChain %16 %329 %43 
                                         f32 %344 = OpLoad %343 
                                         f32 %345 = OpFAdd %342 %344 
                                                      OpStore %73 %345 
                                Private f32* %346 = OpAccessChain %55 %43 
                                         f32 %347 = OpLoad %346 
                                Private f32* %348 = OpAccessChain %328 %200 
                                         f32 %349 = OpLoad %348 
                                         f32 %350 = OpFMul %347 %349 
                                Uniform f32* %351 = OpAccessChain %16 %329 %39 
                                         f32 %352 = OpLoad %351 
                                         f32 %353 = OpFAdd %350 %352 
                                Private f32* %354 = OpAccessChain %55 %43 
                                                      OpStore %354 %353 
                                       f32_4 %355 = OpLoad %9 
                                       f32_2 %356 = OpVectorShuffle %355 %355 2 3 
                                         f32 %357 = OpLoad %73 
                                       f32_2 %358 = OpCompositeConstruct %357 %357 
                                       f32_2 %359 = OpFMul %356 %358 
                                                      OpStore %328 %359 
                                       f32_2 %360 = OpLoad %304 
                                       f32_2 %361 = OpVectorShuffle %360 %360 0 0 
                                       f32_2 %362 = OpLoad %328 
                                       f32_2 %363 = OpFMul %361 %362 
                                       f32_3 %364 = OpLoad %183 
                                       f32_3 %365 = OpVectorShuffle %364 %363 3 1 4 
                                                      OpStore %183 %365 
                                       f32_2 %366 = OpLoad %304 
                                       f32_2 %367 = OpVectorShuffle %366 %366 1 1 
                                       f32_3 %368 = OpLoad %183 
                                       f32_2 %369 = OpVectorShuffle %368 %368 0 2 
                                       f32_2 %370 = OpFMul %367 %369 
                                       f32_3 %371 = OpLoad %183 
                                       f32_3 %372 = OpVectorShuffle %371 %370 3 4 2 
                                                      OpStore %183 %372 
                                       f32_2 %374 = OpLoad %45 
                                       f32_2 %375 = OpVectorShuffle %374 %374 0 0 
                                       f32_3 %376 = OpLoad %183 
                                       f32_2 %377 = OpVectorShuffle %376 %376 0 1 
                                       f32_2 %378 = OpFMul %375 %377 
                                       f32_4 %379 = OpLoad %9 
                                       f32_2 %380 = OpVectorShuffle %379 %379 2 3 
                                       f32_2 %381 = OpFAdd %378 %380 
                                                      OpStore %373 %381 
                              Uniform f32_4* %382 = OpAccessChain %16 %155 
                                       f32_4 %383 = OpLoad %382 
                                       f32_2 %384 = OpVectorShuffle %383 %383 0 0 
                                Uniform f32* %385 = OpAccessChain %16 %159 
                                         f32 %386 = OpLoad %385 
                                       f32_2 %387 = OpCompositeConstruct %386 %386 
                                       f32_2 %388 = OpFMul %384 %387 
                                       f32_4 %389 = OpLoad %9 
                                       f32_2 %390 = OpVectorShuffle %389 %389 0 1 
                                       f32_2 %391 = OpFAdd %388 %390 
                                       f32_4 %392 = OpLoad %9 
                                       f32_4 %393 = OpVectorShuffle %392 %391 4 5 2 3 
                                                      OpStore %9 %393 
                                       f32_4 %394 = OpLoad %9 
                                       f32_2 %395 = OpVectorShuffle %394 %394 0 1 
                                       f32_2 %396 = OpExtInst %1 10 %395 
                                       f32_4 %397 = OpLoad %9 
                                       f32_4 %398 = OpVectorShuffle %397 %396 4 5 2 3 
                                                      OpStore %9 %398 
                  read_only Texture2DSampled %400 = OpLoad %308 
                                       f32_4 %401 = OpLoad %9 
                                       f32_2 %402 = OpVectorShuffle %401 %401 0 1 
                                       f32_4 %403 = OpImageSampleImplicitLod %400 %402 
                                       f32_2 %404 = OpVectorShuffle %403 %403 0 2 
                                       f32_3 %405 = OpLoad %399 
                                       f32_3 %406 = OpVectorShuffle %405 %404 3 4 2 
                                                      OpStore %399 %406 
                                Private f32* %407 = OpAccessChain %399 %43 
                                         f32 %408 = OpLoad %407 
                                Private f32* %409 = OpAccessChain %55 %43 
                                         f32 %410 = OpLoad %409 
                                         f32 %411 = OpFMul %408 %410 
                                Private f32* %412 = OpAccessChain %9 %43 
                                                      OpStore %412 %411 
                                Private f32* %414 = OpAccessChain %399 %200 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFMul %415 %26 
                                Private f32* %417 = OpAccessChain %33 %43 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpFAdd %416 %418 
                                                      OpStore %413 %419 
                                         f32 %420 = OpLoad %413 
                                Uniform f32* %422 = OpAccessChain %16 %421 
                                         f32 %423 = OpLoad %422 
                                         f32 %424 = OpFMul %420 %423 
                                                      OpStore %413 %424 
                                         f32 %425 = OpLoad %413 
                                         f32 %426 = OpExtInst %1 13 %425 
                                                      OpStore %413 %426 
                                       f32_4 %427 = OpLoad %9 
                                       f32_2 %428 = OpVectorShuffle %427 %427 0 0 
                                       f32_2 %429 = OpLoad %373 
                                       f32_2 %430 = OpFMul %428 %429 
                                                      OpStore %33 %430 
                                         f32 %431 = OpLoad %413 
                                       f32_2 %432 = OpCompositeConstruct %431 %431 
                                       f32_2 %433 = OpLoad %33 
                                       f32_2 %434 = OpFMul %432 %433 
                                       f32_2 %435 = OpLoad %373 
                                       f32_2 %436 = OpFAdd %434 %435 
                                       f32_4 %437 = OpLoad %9 
                                       f32_4 %438 = OpVectorShuffle %437 %436 4 5 2 3 
                                                      OpStore %9 %438 
                                       f32_4 %439 = OpLoad %9 
                                       f32_2 %440 = OpVectorShuffle %439 %439 0 1 
                                       f32_4 %441 = OpLoad %9 
                                       f32_2 %442 = OpVectorShuffle %441 %441 0 1 
                                         f32 %443 = OpDot %440 %442 
                                Private f32* %444 = OpAccessChain %9 %43 
                                                      OpStore %444 %443 
                                Private f32* %445 = OpAccessChain %9 %43 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpExtInst %1 31 %446 
                                Private f32* %448 = OpAccessChain %9 %43 
                                                      OpStore %448 %447 
                                Private f32* %449 = OpAccessChain %9 %43 
                                         f32 %450 = OpLoad %449 
                                         f32 %451 = OpFNegate %450 
                                         f32 %452 = OpFAdd %451 %27 
                                Private f32* %453 = OpAccessChain %9 %43 
                                                      OpStore %453 %452 
                                Private f32* %457 = OpAccessChain %9 %43 
                                         f32 %458 = OpLoad %457 
                                        bool %459 = OpFOrdLessThan %458 %28 
                                      bool_4 %460 = OpLoad %456 
                                      bool_4 %461 = OpCompositeInsert %459 %460 0 
                                                      OpStore %456 %461 
                                      bool_4 %462 = OpLoad %456 
                                        bool %463 = OpCompositeExtract %462 0 
                                         i32 %464 = OpSelect %463 %329 %155 
                                         i32 %466 = OpIMul %464 %465 
                                        bool %467 = OpINotEqual %466 %155 
                                                      OpSelectionMerge %469 None 
                                                      OpBranchConditional %467 %468 %469 
                                             %468 = OpLabel 
                                                      OpKill
                                             %469 = OpLabel 
                                       f32_4 %471 = OpLoad %11 
                                       f32_4 %472 = OpVectorShuffle %471 %471 0 1 0 1 
                                       f32_4 %475 = OpFMul %472 %474 
                                                      OpStore %9 %475 
                                       f32_4 %476 = OpLoad %9 
                                       f32_4 %477 = OpLoad %9 
                                       f32_4 %478 = OpVectorShuffle %477 %477 2 3 2 3 
                                       f32_4 %479 = OpFNegate %478 
                                      bool_4 %480 = OpFOrdGreaterThanEqual %476 %479 
                                                      OpStore %456 %480 
                                      bool_4 %482 = OpLoad %456 
                                        bool %483 = OpCompositeExtract %482 0 
                                                      OpSelectionMerge %485 None 
                                                      OpBranchConditional %483 %484 %486 
                                             %484 = OpLabel 
                                                      OpStore %481 %473 
                                                      OpBranch %485 
                                             %486 = OpLabel 
                                                      OpStore %481 %487 
                                                      OpBranch %485 
                                             %485 = OpLabel 
                                         f32 %488 = OpLoad %481 
                                Private f32* %489 = OpAccessChain %9 %43 
                                                      OpStore %489 %488 
                                      bool_4 %491 = OpLoad %456 
                                        bool %492 = OpCompositeExtract %491 1 
                                                      OpSelectionMerge %494 None 
                                                      OpBranchConditional %492 %493 %495 
                                             %493 = OpLabel 
                                                      OpStore %490 %473 
                                                      OpBranch %494 
                                             %495 = OpLabel 
                                                      OpStore %490 %487 
                                                      OpBranch %494 
                                             %494 = OpLabel 
                                         f32 %496 = OpLoad %490 
                                Private f32* %497 = OpAccessChain %9 %200 
                                                      OpStore %497 %496 
                                      bool_4 %499 = OpLoad %456 
                                        bool %500 = OpCompositeExtract %499 2 
                                                      OpSelectionMerge %502 None 
                                                      OpBranchConditional %500 %501 %504 
                                             %501 = OpLabel 
                                                      OpStore %498 %503 
                                                      OpBranch %502 
                                             %504 = OpLabel 
                                                      OpStore %498 %505 
                                                      OpBranch %502 
                                             %502 = OpLabel 
                                         f32 %506 = OpLoad %498 
                                Private f32* %507 = OpAccessChain %9 %39 
                                                      OpStore %507 %506 
                                      bool_4 %509 = OpLoad %456 
                                        bool %510 = OpCompositeExtract %509 3 
                                                      OpSelectionMerge %512 None 
                                                      OpBranchConditional %510 %511 %513 
                                             %511 = OpLabel 
                                                      OpStore %508 %503 
                                                      OpBranch %512 
                                             %513 = OpLabel 
                                                      OpStore %508 %505 
                                                      OpBranch %512 
                                             %512 = OpLabel 
                                         f32 %514 = OpLoad %508 
                                Private f32* %515 = OpAccessChain %9 %35 
                                                      OpStore %515 %514 
                                       f32_4 %516 = OpLoad %9 
                                       f32_2 %517 = OpVectorShuffle %516 %516 2 3 
                                       f32_4 %518 = OpLoad %11 
                                       f32_2 %519 = OpVectorShuffle %518 %518 0 1 
                                       f32_2 %520 = OpFMul %517 %519 
                                                      OpStore %373 %520 
                                       f32_2 %521 = OpLoad %373 
                                       f32_2 %522 = OpExtInst %1 10 %521 
                                                      OpStore %373 %522 
                                       f32_2 %523 = OpLoad %373 
                                       f32_4 %524 = OpLoad %9 
                                       f32_2 %525 = OpVectorShuffle %524 %524 0 1 
                                       f32_2 %526 = OpFMul %523 %525 
                                       f32_4 %527 = OpLoad %9 
                                       f32_4 %528 = OpVectorShuffle %527 %526 4 5 2 3 
                                                      OpStore %9 %528 
                                       f32_4 %529 = OpLoad %9 
                                       f32_2 %530 = OpVectorShuffle %529 %529 0 1 
                                       f32_2 %532 = OpFMul %530 %531 
                                       f32_4 %533 = OpLoad %9 
                                       f32_4 %534 = OpVectorShuffle %533 %532 4 5 2 3 
                                                      OpStore %9 %534 
                  read_only Texture2DSampled %536 = OpLoad %535 
                                       f32_4 %537 = OpLoad %9 
                                       f32_2 %538 = OpVectorShuffle %537 %537 0 1 
                                       f32_4 %539 = OpImageSampleImplicitLod %536 %538 
                                       f32_3 %540 = OpVectorShuffle %539 %539 0 1 2 
                                                      OpStore %399 %540 
                                       f32_3 %543 = OpLoad %399 
                                       f32_4 %544 = OpLoad %542 
                                       f32_4 %545 = OpVectorShuffle %544 %543 4 5 6 3 
                                                      OpStore %542 %545 
                                 Output f32* %547 = OpAccessChain %542 %35 
                                                      OpStore %547 %27 
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