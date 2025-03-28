//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Brave/GoopShader" {
Properties {
_MainTex ("Particle Texture", 2D) = "white" { }
_WorldTex ("World Tex", 2D) = "white" { }
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,1)
_OpaquenessMultiply ("Opaqueness", Float) = 0.5
_BrightnessMultiply ("Brightness", Float) = 1
_OilGoop ("Oily", Float) = 0
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend DstColor SrcColor, DstColor SrcColor
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Color (0.5,0.5,0.5,0.5)
  }
  GpuProgramID 18607
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
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _TintColor;
uniform 	float _OpaquenessMultiply;
uniform  sampler2D _MainTex;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * _TintColor;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat1.w = u_xlat0.w * _OpaquenessMultiply;
    u_xlat0.xyz = u_xlat0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-0.5, -0.5, -0.5);
    u_xlat1.x = float(0.5);
    u_xlat1.y = float(0.5);
    u_xlat1.z = float(0.5);
    u_xlat0.w = 0.0;
    SV_Target0 = u_xlat1.wwww * u_xlat0 + u_xlat1;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 108
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %87 %89 %99 %100 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 RelaxedPrecision 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %83 RelaxedPrecision 
                                                     OpDecorate %83 Location 83 
                                                     OpDecorate %84 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate %89 Location 89 
                                                     OpDecorate %99 Location 99 
                                                     OpDecorate %100 Location 100 
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
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
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
                               Output f32_4* %82 = OpVariable Output 
                                Input f32_4* %83 = OpVariable Input 
                                             %85 = OpTypeVector %6 2 
                                             %86 = OpTypePointer Output %85 
                               Output f32_2* %87 = OpVariable Output 
                                             %88 = OpTypePointer Input %85 
                                Input f32_2* %89 = OpVariable Input 
                               Output f32_2* %99 = OpVariable Output 
                               Input f32_2* %100 = OpVariable Input 
                                            %102 = OpTypePointer Output %6 
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
                                       f32_4 %84 = OpLoad %83 
                                                     OpStore %82 %84 
                                       f32_2 %90 = OpLoad %89 
                              Uniform f32_4* %91 = OpAccessChain %20 %35 
                                       f32_4 %92 = OpLoad %91 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                       f32_2 %94 = OpFMul %90 %93 
                              Uniform f32_4* %95 = OpAccessChain %20 %35 
                                       f32_4 %96 = OpLoad %95 
                                       f32_2 %97 = OpVectorShuffle %96 %96 2 3 
                                       f32_2 %98 = OpFAdd %94 %97 
                                                     OpStore %87 %98 
                                      f32_2 %101 = OpLoad %100 
                                                     OpStore %99 %101 
                                Output f32* %103 = OpAccessChain %72 %22 %68 
                                        f32 %104 = OpLoad %103 
                                        f32 %105 = OpFNegate %104 
                                Output f32* %106 = OpAccessChain %72 %22 %68 
                                                     OpStore %106 %105 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 73
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %17 %33 %59 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpDecorate %9 RelaxedPrecision 
                                                    OpDecorate %13 RelaxedPrecision 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %14 RelaxedPrecision 
                                                    OpDecorate %17 Location 17 
                                                    OpDecorate %20 RelaxedPrecision 
                                                    OpDecorate %21 RelaxedPrecision 
                                                    OpMemberDecorate %22 0 RelaxedPrecision 
                                                    OpMemberDecorate %22 0 Offset 22 
                                                    OpMemberDecorate %22 1 Offset 22 
                                                    OpDecorate %22 Block 
                                                    OpDecorate %24 DescriptorSet 24 
                                                    OpDecorate %24 Binding 24 
                                                    OpDecorate %29 RelaxedPrecision 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate %31 RelaxedPrecision 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %33 Location 33 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %35 RelaxedPrecision 
                                                    OpDecorate %38 RelaxedPrecision 
                                                    OpDecorate %39 RelaxedPrecision 
                                                    OpDecorate %40 RelaxedPrecision 
                                                    OpDecorate %43 RelaxedPrecision 
                                                    OpDecorate %46 RelaxedPrecision 
                                                    OpDecorate %52 RelaxedPrecision 
                                                    OpDecorate %59 RelaxedPrecision 
                                                    OpDecorate %59 Location 59 
                                                    OpDecorate %61 RelaxedPrecision 
                                                    OpDecorate %62 RelaxedPrecision 
                                                    OpDecorate %63 RelaxedPrecision 
                                                    OpDecorate %66 RelaxedPrecision 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                            %11 = OpTypeSampledImage %10 
                                            %12 = OpTypePointer UniformConstant %11 
UniformConstant read_only Texture2DSampled* %13 = OpVariable UniformConstant 
                                            %15 = OpTypeVector %6 2 
                                            %16 = OpTypePointer Input %15 
                               Input f32_2* %17 = OpVariable Input 
                             Private f32_4* %20 = OpVariable Private 
                                            %22 = OpTypeStruct %7 %6 
                                            %23 = OpTypePointer Uniform %22 
              Uniform struct {f32_4; f32;}* %24 = OpVariable Uniform 
                                            %25 = OpTypeInt 32 1 
                                        i32 %26 = OpConstant 0 
                                            %27 = OpTypePointer Uniform %7 
                                            %32 = OpTypePointer Input %7 
                               Input f32_4* %33 = OpVariable Input 
                                            %36 = OpTypeVector %6 3 
                                            %37 = OpTypePointer Private %36 
                             Private f32_3* %38 = OpVariable Private 
                                        f32 %41 = OpConstant 3.67402E-40 
                                      f32_3 %42 = OpConstantComposite %41 %41 %41 
                                        f32 %44 = OpConstant 3.67402E-40 
                                      f32_3 %45 = OpConstantComposite %44 %44 %44 
                                            %47 = OpTypePointer Private %6 
                               Private f32* %48 = OpVariable Private 
                                            %49 = OpTypeInt 32 0 
                                        u32 %50 = OpConstant 3 
                                        i32 %53 = OpConstant 1 
                                            %54 = OpTypePointer Uniform %6 
                                            %58 = OpTypePointer Output %7 
                              Output f32_4* %59 = OpVariable Output 
                                        f32 %64 = OpConstant 3.67402E-40 
                                      f32_3 %65 = OpConstantComposite %64 %64 %64 
                                            %70 = OpTypePointer Output %6 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                 read_only Texture2DSampled %14 = OpLoad %13 
                                      f32_2 %18 = OpLoad %17 
                                      f32_4 %19 = OpImageSampleImplicitLod %14 %18 
                                                    OpStore %9 %19 
                                      f32_4 %21 = OpLoad %9 
                             Uniform f32_4* %28 = OpAccessChain %24 %26 
                                      f32_4 %29 = OpLoad %28 
                                      f32_4 %30 = OpFMul %21 %29 
                                                    OpStore %20 %30 
                                      f32_4 %31 = OpLoad %20 
                                      f32_4 %34 = OpLoad %33 
                                      f32_4 %35 = OpFMul %31 %34 
                                                    OpStore %20 %35 
                                      f32_4 %39 = OpLoad %20 
                                      f32_3 %40 = OpVectorShuffle %39 %39 0 1 2 
                                      f32_3 %43 = OpFMul %40 %42 
                                      f32_3 %46 = OpFAdd %43 %45 
                                                    OpStore %38 %46 
                               Private f32* %51 = OpAccessChain %20 %50 
                                        f32 %52 = OpLoad %51 
                               Uniform f32* %55 = OpAccessChain %24 %53 
                                        f32 %56 = OpLoad %55 
                                        f32 %57 = OpFMul %52 %56 
                                                    OpStore %48 %57 
                                        f32 %60 = OpLoad %48 
                                      f32_3 %61 = OpCompositeConstruct %60 %60 %60 
                                      f32_3 %62 = OpLoad %38 
                                      f32_3 %63 = OpFMul %61 %62 
                                      f32_3 %66 = OpFAdd %63 %65 
                                      f32_4 %67 = OpLoad %59 
                                      f32_4 %68 = OpVectorShuffle %67 %66 4 5 6 3 
                                                    OpStore %59 %68 
                                        f32 %69 = OpLoad %48 
                                Output f32* %71 = OpAccessChain %59 %50 
                                                    OpStore %71 %69 
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
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Color (0.5,0.5,0.5,0.5)
  }
  GpuProgramID 87854
Program "vp" {
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
in  vec2 in_TEXCOORD0;
in  vec2 in_TEXCOORD1;
out vec4 vs_COLOR0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD1;
out vec2 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD3 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat2 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat2 * 0.5;
    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _Time;
uniform 	vec4 _TintColor;
uniform 	vec4 _WorldTex_TexelSize;
uniform 	float _OpaquenessMultiply;
uniform 	float _BrightnessMultiply;
uniform 	float _OilGoop;
uniform 	float _GlobalReflectionsEnabled;
uniform  sampler2D _MainTex;
uniform  sampler2D _WorldTex;
uniform  sampler2D _ReflMapFromPixelator;
in  vec4 vs_COLOR0;
in  vec2 vs_TEXCOORD0;
in  vec2 vs_TEXCOORD1;
in  vec2 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
vec2 u_xlat3;
float u_xlat5;
vec2 u_xlat9;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
void main()
{
    u_xlat0.x = _WorldTex_TexelSize.z * 0.0625;
    u_xlat0.xy = vs_TEXCOORD3.xy / u_xlat0.xx;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat10_0 = texture(_WorldTex, u_xlat0.xy);
    u_xlat12 = u_xlat10_0.w + -0.100000001;
    u_xlatb12 = u_xlat12<0.0;
    if((int(u_xlatb12) * int(0xffffffffu))!=0){discard;}
    u_xlat10_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat10_1 * _TintColor;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat1 = u_xlat1 * vec4(_OpaquenessMultiply);
    u_xlat2.xyz = (-u_xlat1.xyz) * vec3(vec3(_BrightnessMultiply, _BrightnessMultiply, _BrightnessMultiply)) + vec3(0.0250000004, 0.0350000001, 0.0350000001);
    u_xlat1 = u_xlat1 * vec4(vec4(_BrightnessMultiply, _BrightnessMultiply, _BrightnessMultiply, _BrightnessMultiply));
    u_xlat12 = _OilGoop * 0.5;
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat2.xyz + u_xlat1.xyz;
    SV_Target0.w = u_xlat1.w;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vs_TEXCOORD1.xxx * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat1 = vs_TEXCOORD2.yxyx * vec4(500.0, 9.69999981, 14.3000002, 5.30000019);
    u_xlat5 = sin(u_xlat1.y);
    u_xlat2.x = u_xlat5 * 0.0285714287 + u_xlat0.x;
    u_xlat5 = sin(vs_TEXCOORD3.x);
    u_xlat9.xy = cos(u_xlat1.zw);
    u_xlat1.x = _Time.z * 5.0 + u_xlat1.x;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat3.x = u_xlat1.x * 0.00100000005;
    u_xlat1.x = u_xlat9.y + u_xlat5;
    u_xlat2.y = u_xlat9.x * 0.0333333351 + u_xlat0.y;
    u_xlat2.z = u_xlat1.x * 0.0333333351 + u_xlat0.z;
    u_xlatb1 = 0.5<_OilGoop;
    u_xlat0.xyz = (bool(u_xlatb1)) ? u_xlat2.xyz : u_xlat0.xyz;
    u_xlat3.y = 0.0;
    u_xlat1.xy = u_xlat3.xy + vs_TEXCOORD2.xy;
    u_xlat10_1 = texture(_ReflMapFromPixelator, u_xlat1.xy);
    u_xlat1.xyz = (-u_xlat0.xyz) + u_xlat10_1.xyz;
    u_xlat13 = vs_TEXCOORD2.y + -0.875;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat13 = u_xlat13 * 10.0;
    u_xlat13 = min(u_xlat13, 1.0);
    u_xlat12 = u_xlat13 * (-u_xlat12) + u_xlat12;
    u_xlat12 = u_xlat12 * _GlobalReflectionsEnabled;
    SV_Target0.xyz = vec3(u_xlat12) * u_xlat1.xyz + u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 143
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %50 %88 %91 %92 %96 %98 %108 %109 %131 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpDecorate %50 Location 50 
                                                      OpMemberDecorate %86 0 BuiltIn 86 
                                                      OpMemberDecorate %86 1 BuiltIn 86 
                                                      OpMemberDecorate %86 2 BuiltIn 86 
                                                      OpDecorate %86 Block 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %92 Location 92 
                                                      OpDecorate %93 RelaxedPrecision 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate %98 Location 98 
                                                      OpDecorate %108 Location 108 
                                                      OpDecorate %109 Location 109 
                                                      OpDecorate %131 Location 131 
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
                                              %18 = OpTypeStruct %7 %16 %17 %7 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                              %21 = OpTypeInt 32 1 
                                          i32 %22 = OpConstant 1 
                                              %23 = OpTypePointer Uniform %7 
                                          i32 %27 = OpConstant 0 
                                          i32 %35 = OpConstant 2 
                               Private f32_4* %43 = OpVariable Private 
                                          i32 %45 = OpConstant 3 
                                              %49 = OpTypePointer Output %7 
                                Output f32_4* %50 = OpVariable Output 
                                          u32 %84 = OpConstant 1 
                                              %85 = OpTypeArray %6 %84 
                                              %86 = OpTypeStruct %7 %6 %85 
                                              %87 = OpTypePointer Output %86 
         Output struct {f32_4; f32; f32[1];}* %88 = OpVariable Output 
                                Output f32_4* %91 = OpVariable Output 
                                 Input f32_4* %92 = OpVariable Input 
                                              %94 = OpTypeVector %6 2 
                                              %95 = OpTypePointer Output %94 
                                Output f32_2* %96 = OpVariable Output 
                                              %97 = OpTypePointer Input %94 
                                 Input f32_2* %98 = OpVariable Input 
                               Output f32_2* %108 = OpVariable Output 
                                Input f32_2* %109 = OpVariable Input 
                                             %111 = OpTypePointer Private %6 
                                Private f32* %112 = OpVariable Private 
                                         u32 %115 = OpConstant 0 
                                             %116 = OpTypePointer Uniform %6 
                                         f32 %122 = OpConstant 3.67402E-40 
                                       f32_2 %123 = OpConstantComposite %122 %122 
                                         u32 %129 = OpConstant 3 
                               Output f32_2* %131 = OpVariable Output 
                                             %137 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                        f32_4 %25 = OpLoad %24 
                                        f32_4 %26 = OpFMul %13 %25 
                                                      OpStore %9 %26 
                               Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
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
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %20 %22 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %43 %48 
                               Uniform f32_4* %51 = OpAccessChain %20 %22 %45 
                                        f32_4 %52 = OpLoad %51 
                                        f32_4 %53 = OpLoad %11 
                                        f32_4 %54 = OpVectorShuffle %53 %53 3 3 3 3 
                                        f32_4 %55 = OpFMul %52 %54 
                                        f32_4 %56 = OpLoad %9 
                                        f32_4 %57 = OpFAdd %55 %56 
                                                      OpStore %50 %57 
                                        f32_4 %58 = OpLoad %43 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %20 %35 %22 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %9 %62 
                               Uniform f32_4* %63 = OpAccessChain %20 %35 %27 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %43 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %9 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %9 %69 
                               Uniform f32_4* %70 = OpAccessChain %20 %35 %35 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %43 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %9 %76 
                               Uniform f32_4* %77 = OpAccessChain %20 %35 %45 
                                        f32_4 %78 = OpLoad %77 
                                        f32_4 %79 = OpLoad %43 
                                        f32_4 %80 = OpVectorShuffle %79 %79 3 3 3 3 
                                        f32_4 %81 = OpFMul %78 %80 
                                        f32_4 %82 = OpLoad %9 
                                        f32_4 %83 = OpFAdd %81 %82 
                                                      OpStore %9 %83 
                                        f32_4 %89 = OpLoad %9 
                                Output f32_4* %90 = OpAccessChain %88 %27 
                                                      OpStore %90 %89 
                                        f32_4 %93 = OpLoad %92 
                                                      OpStore %91 %93 
                                        f32_2 %99 = OpLoad %98 
                              Uniform f32_4* %100 = OpAccessChain %20 %45 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_2 %103 = OpFMul %99 %102 
                              Uniform f32_4* %104 = OpAccessChain %20 %45 
                                       f32_4 %105 = OpLoad %104 
                                       f32_2 %106 = OpVectorShuffle %105 %105 2 3 
                                       f32_2 %107 = OpFAdd %103 %106 
                                                      OpStore %96 %107 
                                       f32_2 %110 = OpLoad %109 
                                                      OpStore %108 %110 
                                Private f32* %113 = OpAccessChain %9 %84 
                                         f32 %114 = OpLoad %113 
                                Uniform f32* %117 = OpAccessChain %20 %27 %115 
                                         f32 %118 = OpLoad %117 
                                         f32 %119 = OpFMul %114 %118 
                                                      OpStore %112 %119 
                                       f32_4 %120 = OpLoad %9 
                                       f32_2 %121 = OpVectorShuffle %120 %120 0 3 
                                       f32_2 %124 = OpFMul %121 %123 
                                       f32_4 %125 = OpLoad %9 
                                       f32_4 %126 = OpVectorShuffle %125 %124 4 1 5 3 
                                                      OpStore %9 %126 
                                         f32 %127 = OpLoad %112 
                                         f32 %128 = OpFMul %127 %122 
                                Private f32* %130 = OpAccessChain %9 %129 
                                                      OpStore %130 %128 
                                       f32_4 %132 = OpLoad %9 
                                       f32_2 %133 = OpVectorShuffle %132 %132 2 2 
                                       f32_4 %134 = OpLoad %9 
                                       f32_2 %135 = OpVectorShuffle %134 %134 0 3 
                                       f32_2 %136 = OpFAdd %133 %135 
                                                      OpStore %131 %136 
                                 Output f32* %138 = OpAccessChain %88 %27 %84 
                                         f32 %139 = OpLoad %138 
                                         f32 %140 = OpFNegate %139 
                                 Output f32* %141 = OpAccessChain %88 %27 %84 
                                                      OpStore %141 %140 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 310
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %27 %77 %87 %160 %176 %307 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpMemberDecorate %11 0 Offset 11 
                                                      OpMemberDecorate %11 1 RelaxedPrecision 
                                                      OpMemberDecorate %11 1 Offset 11 
                                                      OpMemberDecorate %11 2 Offset 11 
                                                      OpMemberDecorate %11 3 Offset 11 
                                                      OpMemberDecorate %11 4 Offset 11 
                                                      OpMemberDecorate %11 5 Offset 11 
                                                      OpMemberDecorate %11 6 Offset 11 
                                                      OpDecorate %11 Block 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %27 Location 27 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %46 DescriptorSet 46 
                                                      OpDecorate %46 Binding 46 
                                                      OpDecorate %47 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %74 DescriptorSet 74 
                                                      OpDecorate %74 Binding 74 
                                                      OpDecorate %75 RelaxedPrecision 
                                                      OpDecorate %77 Location 77 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %87 Location 87 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %95 RelaxedPrecision 
                                                      OpDecorate %96 RelaxedPrecision 
                                                      OpDecorate %151 RelaxedPrecision 
                                                      OpDecorate %152 RelaxedPrecision 
                                                      OpDecorate %153 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %160 Location 160 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %176 Location 176 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %261 DescriptorSet 261 
                                                      OpDecorate %261 Binding 261 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %307 Location 307 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 4 
                                              %11 = OpTypeStruct %10 %10 %10 %6 %6 %6 %6 
                                              %12 = OpTypePointer Uniform %11 
Uniform struct {f32_4; f32_4; f32_4; f32; f32; f32; f32;}* %13 = OpVariable Uniform 
                                              %14 = OpTypeInt 32 1 
                                          i32 %15 = OpConstant 2 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 2 
                                              %18 = OpTypePointer Uniform %6 
                                          f32 %21 = OpConstant 3.67402E-40 
                                          u32 %23 = OpConstant 0 
                                              %24 = OpTypePointer Private %6 
                                              %26 = OpTypePointer Input %10 
                                 Input f32_4* %27 = OpVariable Input 
                                              %28 = OpTypeVector %6 2 
                                              %41 = OpTypePointer Private %10 
                               Private f32_4* %42 = OpVariable Private 
                                              %43 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %44 = OpTypeSampledImage %43 
                                              %45 = OpTypePointer UniformConstant %44 
  UniformConstant read_only Texture2DSampled* %46 = OpVariable UniformConstant 
                                 Private f32* %51 = OpVariable Private 
                                          u32 %52 = OpConstant 3 
                                          f32 %55 = OpConstant 3.67402E-40 
                                              %57 = OpTypeBool 
                                              %58 = OpTypePointer Private %57 
                                Private bool* %59 = OpVariable Private 
                                          f32 %61 = OpConstant 3.67402E-40 
                                          i32 %64 = OpConstant 0 
                                          i32 %65 = OpConstant 1 
                                          i32 %67 = OpConstant -1 
                               Private f32_4* %73 = OpVariable Private 
  UniformConstant read_only Texture2DSampled* %74 = OpVariable UniformConstant 
                                              %76 = OpTypePointer Input %28 
                                 Input f32_2* %77 = OpVariable Input 
                               Private f32_4* %80 = OpVariable Private 
                                              %82 = OpTypePointer Uniform %10 
                                 Input f32_4* %87 = OpVariable Input 
                               Private f32_4* %90 = OpVariable Private 
                                          i32 %92 = OpConstant 3 
                               Private f32_4* %97 = OpVariable Private 
                                         i32 %101 = OpConstant 4 
                                         f32 %114 = OpConstant 3.67402E-40 
                                         f32 %115 = OpConstant 3.67402E-40 
                                       f32_3 %116 = OpConstantComposite %114 %115 %115 
                                         i32 %136 = OpConstant 5 
                                         f32 %139 = OpConstant 3.67402E-40 
                                Input f32_2* %160 = OpVariable Input 
                                Private f32* %168 = OpVariable Private 
                                         f32 %171 = OpConstant 3.67402E-40 
                                         f32 %172 = OpConstant 3.67402E-40 
                                         f32 %173 = OpConstant 3.67402E-40 
                                       f32_3 %174 = OpConstantComposite %171 %172 %173 
                                Input f32_2* %176 = OpVariable Input 
                                         f32 %179 = OpConstant 3.67402E-40 
                                         f32 %180 = OpConstant 3.67402E-40 
                                         f32 %181 = OpConstant 3.67402E-40 
                                         f32 %182 = OpConstant 3.67402E-40 
                                       f32_4 %183 = OpConstantComposite %179 %180 %181 %182 
                                         u32 %185 = OpConstant 1 
                              Private f32_3* %189 = OpVariable Private 
                                         f32 %191 = OpConstant 3.67402E-40 
                                             %197 = OpTypePointer Input %6 
                                             %201 = OpTypePointer Private %28 
                              Private f32_2* %202 = OpVariable Private 
                                         f32 %208 = OpConstant 3.67402E-40 
                              Private f32_2* %218 = OpVariable Private 
                                         f32 %221 = OpConstant 3.67402E-40 
                                         f32 %230 = OpConstant 3.67402E-40 
                              Private f32_3* %245 = OpVariable Private 
                                             %246 = OpTypePointer Function %7 
 UniformConstant read_only Texture2DSampled* %261 = OpVariable UniformConstant 
                              Private f32_3* %269 = OpVariable Private 
                                         f32 %277 = OpConstant 3.67402E-40 
                                         f32 %280 = OpConstant 3.67402E-40 
                                         f32 %283 = OpConstant 3.67402E-40 
                                         i32 %294 = OpConstant 6 
                                             %306 = OpTypePointer Output %10 
                               Output f32_4* %307 = OpVariable Output 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %247 = OpVariable Function 
                                 Uniform f32* %19 = OpAccessChain %13 %15 %17 
                                          f32 %20 = OpLoad %19 
                                          f32 %22 = OpFMul %20 %21 
                                 Private f32* %25 = OpAccessChain %9 %23 
                                                      OpStore %25 %22 
                                        f32_4 %29 = OpLoad %27 
                                        f32_2 %30 = OpVectorShuffle %29 %29 0 1 
                                        f32_3 %31 = OpLoad %9 
                                        f32_2 %32 = OpVectorShuffle %31 %31 0 0 
                                        f32_2 %33 = OpFDiv %30 %32 
                                        f32_3 %34 = OpLoad %9 
                                        f32_3 %35 = OpVectorShuffle %34 %33 3 4 2 
                                                      OpStore %9 %35 
                                        f32_3 %36 = OpLoad %9 
                                        f32_2 %37 = OpVectorShuffle %36 %36 0 1 
                                        f32_2 %38 = OpExtInst %1 10 %37 
                                        f32_3 %39 = OpLoad %9 
                                        f32_3 %40 = OpVectorShuffle %39 %38 3 4 2 
                                                      OpStore %9 %40 
                   read_only Texture2DSampled %47 = OpLoad %46 
                                        f32_3 %48 = OpLoad %9 
                                        f32_2 %49 = OpVectorShuffle %48 %48 0 1 
                                        f32_4 %50 = OpImageSampleImplicitLod %47 %49 
                                                      OpStore %42 %50 
                                 Private f32* %53 = OpAccessChain %42 %52 
                                          f32 %54 = OpLoad %53 
                                          f32 %56 = OpFAdd %54 %55 
                                                      OpStore %51 %56 
                                          f32 %60 = OpLoad %51 
                                         bool %62 = OpFOrdLessThan %60 %61 
                                                      OpStore %59 %62 
                                         bool %63 = OpLoad %59 
                                          i32 %66 = OpSelect %63 %65 %64 
                                          i32 %68 = OpIMul %66 %67 
                                         bool %69 = OpINotEqual %68 %64 
                                                      OpSelectionMerge %71 None 
                                                      OpBranchConditional %69 %70 %71 
                                              %70 = OpLabel 
                                                      OpKill
                                              %71 = OpLabel 
                   read_only Texture2DSampled %75 = OpLoad %74 
                                        f32_2 %78 = OpLoad %77 
                                        f32_4 %79 = OpImageSampleImplicitLod %75 %78 
                                                      OpStore %73 %79 
                                        f32_4 %81 = OpLoad %73 
                               Uniform f32_4* %83 = OpAccessChain %13 %65 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFMul %81 %84 
                                                      OpStore %80 %85 
                                        f32_4 %86 = OpLoad %80 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFMul %86 %88 
                                                      OpStore %80 %89 
                                        f32_4 %91 = OpLoad %80 
                                 Uniform f32* %93 = OpAccessChain %13 %92 
                                          f32 %94 = OpLoad %93 
                                        f32_4 %95 = OpCompositeConstruct %94 %94 %94 %94 
                                        f32_4 %96 = OpFMul %91 %95 
                                                      OpStore %90 %96 
                                        f32_4 %98 = OpLoad %90 
                                        f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                                       f32_3 %100 = OpFNegate %99 
                                Uniform f32* %102 = OpAccessChain %13 %101 
                                         f32 %103 = OpLoad %102 
                                Uniform f32* %104 = OpAccessChain %13 %101 
                                         f32 %105 = OpLoad %104 
                                Uniform f32* %106 = OpAccessChain %13 %101 
                                         f32 %107 = OpLoad %106 
                                       f32_3 %108 = OpCompositeConstruct %103 %105 %107 
                                         f32 %109 = OpCompositeExtract %108 0 
                                         f32 %110 = OpCompositeExtract %108 1 
                                         f32 %111 = OpCompositeExtract %108 2 
                                       f32_3 %112 = OpCompositeConstruct %109 %110 %111 
                                       f32_3 %113 = OpFMul %100 %112 
                                       f32_3 %117 = OpFAdd %113 %116 
                                       f32_4 %118 = OpLoad %97 
                                       f32_4 %119 = OpVectorShuffle %118 %117 4 5 6 3 
                                                      OpStore %97 %119 
                                       f32_4 %120 = OpLoad %90 
                                Uniform f32* %121 = OpAccessChain %13 %101 
                                         f32 %122 = OpLoad %121 
                                Uniform f32* %123 = OpAccessChain %13 %101 
                                         f32 %124 = OpLoad %123 
                                Uniform f32* %125 = OpAccessChain %13 %101 
                                         f32 %126 = OpLoad %125 
                                Uniform f32* %127 = OpAccessChain %13 %101 
                                         f32 %128 = OpLoad %127 
                                       f32_4 %129 = OpCompositeConstruct %122 %124 %126 %128 
                                         f32 %130 = OpCompositeExtract %129 0 
                                         f32 %131 = OpCompositeExtract %129 1 
                                         f32 %132 = OpCompositeExtract %129 2 
                                         f32 %133 = OpCompositeExtract %129 3 
                                       f32_4 %134 = OpCompositeConstruct %130 %131 %132 %133 
                                       f32_4 %135 = OpFMul %120 %134 
                                                      OpStore %90 %135 
                                Uniform f32* %137 = OpAccessChain %13 %136 
                                         f32 %138 = OpLoad %137 
                                         f32 %140 = OpFMul %138 %139 
                                                      OpStore %51 %140 
                                         f32 %141 = OpLoad %51 
                                       f32_3 %142 = OpCompositeConstruct %141 %141 %141 
                                       f32_4 %143 = OpLoad %97 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %90 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_3 %148 = OpFAdd %145 %147 
                                       f32_4 %149 = OpLoad %97 
                                       f32_4 %150 = OpVectorShuffle %149 %148 4 5 6 3 
                                                      OpStore %97 %150 
                                       f32_4 %151 = OpLoad %42 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_4 %153 = OpLoad %87 
                                       f32_3 %154 = OpVectorShuffle %153 %153 0 1 2 
                                       f32_3 %155 = OpFMul %152 %154 
                                       f32_4 %156 = OpLoad %97 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %158 = OpFNegate %157 
                                       f32_3 %159 = OpFAdd %155 %158 
                                                      OpStore %9 %159 
                                       f32_2 %161 = OpLoad %160 
                                       f32_3 %162 = OpVectorShuffle %161 %161 0 0 0 
                                       f32_3 %163 = OpLoad %9 
                                       f32_3 %164 = OpFMul %162 %163 
                                       f32_4 %165 = OpLoad %97 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpFAdd %164 %166 
                                                      OpStore %9 %167 
                                       f32_4 %169 = OpLoad %97 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                                         f32 %175 = OpDot %170 %174 
                                                      OpStore %168 %175 
                                       f32_2 %177 = OpLoad %176 
                                       f32_4 %178 = OpVectorShuffle %177 %177 1 0 1 0 
                                       f32_4 %184 = OpFMul %178 %183 
                                                      OpStore %97 %184 
                                Private f32* %186 = OpAccessChain %97 %185 
                                         f32 %187 = OpLoad %186 
                                         f32 %188 = OpExtInst %1 13 %187 
                                                      OpStore %51 %188 
                                         f32 %190 = OpLoad %51 
                                         f32 %192 = OpFMul %190 %191 
                                Private f32* %193 = OpAccessChain %9 %23 
                                         f32 %194 = OpLoad %193 
                                         f32 %195 = OpFAdd %192 %194 
                                Private f32* %196 = OpAccessChain %189 %23 
                                                      OpStore %196 %195 
                                  Input f32* %198 = OpAccessChain %27 %23 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpExtInst %1 13 %199 
                                                      OpStore %51 %200 
                                       f32_4 %203 = OpLoad %97 
                                       f32_2 %204 = OpVectorShuffle %203 %203 2 3 
                                       f32_2 %205 = OpExtInst %1 14 %204 
                                                      OpStore %202 %205 
                                Uniform f32* %206 = OpAccessChain %13 %64 %17 
                                         f32 %207 = OpLoad %206 
                                         f32 %209 = OpFMul %207 %208 
                                Private f32* %210 = OpAccessChain %97 %23 
                                         f32 %211 = OpLoad %210 
                                         f32 %212 = OpFAdd %209 %211 
                                Private f32* %213 = OpAccessChain %97 %23 
                                                      OpStore %213 %212 
                                Private f32* %214 = OpAccessChain %97 %23 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpExtInst %1 13 %215 
                                Private f32* %217 = OpAccessChain %97 %23 
                                                      OpStore %217 %216 
                                Private f32* %219 = OpAccessChain %97 %23 
                                         f32 %220 = OpLoad %219 
                                         f32 %222 = OpFMul %220 %221 
                                Private f32* %223 = OpAccessChain %218 %23 
                                                      OpStore %223 %222 
                                         f32 %224 = OpLoad %51 
                                Private f32* %225 = OpAccessChain %202 %185 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFAdd %224 %226 
                                                      OpStore %51 %227 
                                Private f32* %228 = OpAccessChain %202 %23 
                                         f32 %229 = OpLoad %228 
                                         f32 %231 = OpFMul %229 %230 
                                Private f32* %232 = OpAccessChain %9 %185 
                                         f32 %233 = OpLoad %232 
                                         f32 %234 = OpFAdd %231 %233 
                                Private f32* %235 = OpAccessChain %189 %185 
                                                      OpStore %235 %234 
                                         f32 %236 = OpLoad %51 
                                         f32 %237 = OpFMul %236 %230 
                                Private f32* %238 = OpAccessChain %9 %17 
                                         f32 %239 = OpLoad %238 
                                         f32 %240 = OpFAdd %237 %239 
                                Private f32* %241 = OpAccessChain %189 %17 
                                                      OpStore %241 %240 
                                Uniform f32* %242 = OpAccessChain %13 %136 
                                         f32 %243 = OpLoad %242 
                                        bool %244 = OpFOrdLessThan %139 %243 
                                                      OpStore %59 %244 
                                        bool %248 = OpLoad %59 
                                                      OpSelectionMerge %250 None 
                                                      OpBranchConditional %248 %249 %252 
                                             %249 = OpLabel 
                                       f32_3 %251 = OpLoad %189 
                                                      OpStore %247 %251 
                                                      OpBranch %250 
                                             %252 = OpLabel 
                                       f32_3 %253 = OpLoad %9 
                                                      OpStore %247 %253 
                                                      OpBranch %250 
                                             %250 = OpLabel 
                                       f32_3 %254 = OpLoad %247 
                                                      OpStore %245 %254 
                                Private f32* %255 = OpAccessChain %218 %185 
                                                      OpStore %255 %61 
                                       f32_2 %256 = OpLoad %218 
                                       f32_2 %257 = OpLoad %176 
                                       f32_2 %258 = OpFAdd %256 %257 
                                       f32_3 %259 = OpLoad %9 
                                       f32_3 %260 = OpVectorShuffle %259 %258 3 4 2 
                                                      OpStore %9 %260 
                  read_only Texture2DSampled %262 = OpLoad %261 
                                       f32_3 %263 = OpLoad %9 
                                       f32_2 %264 = OpVectorShuffle %263 %263 0 1 
                                       f32_4 %265 = OpImageSampleImplicitLod %262 %264 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                       f32_4 %267 = OpLoad %42 
                                       f32_4 %268 = OpVectorShuffle %267 %266 4 5 6 3 
                                                      OpStore %42 %268 
                                       f32_3 %270 = OpLoad %245 
                                       f32_3 %271 = OpFNegate %270 
                                       f32_4 %272 = OpLoad %42 
                                       f32_3 %273 = OpVectorShuffle %272 %272 0 1 2 
                                       f32_3 %274 = OpFAdd %271 %273 
                                                      OpStore %269 %274 
                                  Input f32* %275 = OpAccessChain %176 %185 
                                         f32 %276 = OpLoad %275 
                                         f32 %278 = OpFAdd %276 %277 
                                                      OpStore %51 %278 
                                         f32 %279 = OpLoad %51 
                                         f32 %281 = OpExtInst %1 43 %279 %61 %280 
                                                      OpStore %51 %281 
                                         f32 %282 = OpLoad %51 
                                         f32 %284 = OpFMul %282 %283 
                                                      OpStore %51 %284 
                                         f32 %285 = OpLoad %51 
                                         f32 %286 = OpExtInst %1 37 %285 %280 
                                                      OpStore %51 %286 
                                         f32 %287 = OpLoad %51 
                                         f32 %288 = OpLoad %168 
                                         f32 %289 = OpFNegate %288 
                                         f32 %290 = OpFMul %287 %289 
                                         f32 %291 = OpLoad %168 
                                         f32 %292 = OpFAdd %290 %291 
                                                      OpStore %51 %292 
                                         f32 %293 = OpLoad %51 
                                Uniform f32* %295 = OpAccessChain %13 %294 
                                         f32 %296 = OpLoad %295 
                                         f32 %297 = OpFMul %293 %296 
                                                      OpStore %51 %297 
                                         f32 %298 = OpLoad %51 
                                       f32_3 %299 = OpCompositeConstruct %298 %298 %298 
                                       f32_3 %300 = OpLoad %269 
                                       f32_3 %301 = OpFMul %299 %300 
                                       f32_3 %302 = OpLoad %245 
                                       f32_3 %303 = OpFAdd %301 %302 
                                       f32_4 %304 = OpLoad %90 
                                       f32_4 %305 = OpVectorShuffle %304 %303 4 5 6 3 
                                                      OpStore %90 %305 
                                       f32_4 %308 = OpLoad %90 
                                                      OpStore %307 %308 
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